using Microsoft.AspNetCore.Http;
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


    }
}
