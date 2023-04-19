using webapi.Authorization;
using webapi.Models;
using webapi.Services;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using webapi.Models;
using webapi.Services;


namespace webapi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        [HttpPost("[action]")]
        public IActionResult Authenticate(AuthenticateRequest model)
        {
            AuthenticateResponse response;
            try
            {
                response = _userService.Authenticate(model);
            }
            catch
            {
                return Ok(new { status = "fail", message = "", responseObject = "" });
            }

            return Ok(response);
        }

        [Authorize("Admin", "HR")]
        [HttpGet]
        public IActionResult GetAll()
        {
            var users = _userService.GetAll();
            return Ok(new { status = "ok", message = "", responseObject = users });
        }
        [Authorize("Admin")]
        [HttpGet("{id}")]

        public IActionResult GetById(string id)
        {
            // only admins can access other user records
            //var currentUser = (User)HttpContext.Items["User"];
            //if (id != currentUser.Id && currentUser.Role != "Admin")
            //    return Unauthorized(new { message = "Unauthorized" });

            var user = _userService.GetById(id);
            return Ok(new { status = "ok", message = "", responseObject = user });
        }




    }
}

