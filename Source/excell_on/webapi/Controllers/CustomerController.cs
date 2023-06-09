﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Models;
using webapi.Services;

namespace webapi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        [AllowAnonymous]
        [HttpPost("[action]")]
        public IActionResult Authenticate(AuthenticateRequest model)
        {
            AuthenticateResponseCustomer response;
            try
            {
                response = _customerService.Authenticate(model);
            }
            catch
            {
                return Ok(new { status = "fail", message = "", responseObject = "" });
            }

            return Ok(response);
        }

        [HttpGet, Authorize("HR", "Admin")]
        public IActionResult GetAll() {
            var customer = _customerService.GetAll();
            return Ok(new { status = "ok", message = "", responseObject = customer });
        }

        [HttpGet("{id}")]

        public IActionResult GetById(string id)
        {
            // only admins can access other customer records
            //var currentUser = (Customer)HttpContext.Items["Customer"];
            //if (id != currentUser.Id && currentUser.Role != "Admin")
            //    return Unauthorized(new { message = "Unauthorized" });

            var customer = _customerService.GetById(id);
            return Ok(new { status = "ok", message = "", responseObject = customer });
        }

        [HttpPost("CreateCustomer")]
        [AllowAnonymous]
        public IActionResult CreateCustomer(Customer customer)
        {
            _customerService.CreateCustomer(customer);
            return Ok(new { message = "New account created" });
        }

        [HttpPut("changePassword/{id}")]
        public IActionResult ChangePassword(string id, string newPassword)
        {
            try
            {
                _customerService.ChangePassword(id, newPassword);
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message, responseObject = "" });
            }
            return Ok(new { message = "Password Update" });
        }

        [HttpPut("updateProfile/{id}")]
        public IActionResult UpdateProfile(Customer customer)
        {
            try
            {
                _customerService.UpdateProfile(customer);
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message });
            }
            return Ok(new { message = "Profile Update" });
        }

        [HttpPut("UpdateAvatar/{id}")]
        public IActionResult UpdateAvatar(string id, string url)
        {
            try
            {
                _customerService.UpdateAvatar(id, url);
                return Ok(new { message = "Avatar Update" });
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message });
            }
            
        }
    }
}
