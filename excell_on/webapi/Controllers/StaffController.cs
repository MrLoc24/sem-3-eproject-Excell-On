
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Services;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StaffController : ControllerBase
    {
        private readonly IStaffService _staffService;

        public StaffController(IStaffService staffService)
        {
            _staffService = staffService;
        }

        [HttpGet, AllowAnonymous]
        public IActionResult GetAll()
        {
            var staff = _staffService.GetAll();
            return Ok(new { message = "Ok", responseObject = staff });
        }
    }
}
