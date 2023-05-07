
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

        [HttpGet, Authorize]
        public IActionResult GetAll()
        {
            var staff = _staffService.GetAll();
            return Ok(new { message = "Ok", responseObject = staff });
        }
        [HttpGet("Department"), Authorize]
        public IActionResult GetAllDepartment()
        {
            var der = _staffService.GetAllDepartments();
            return Ok(new { message = "Ok", responseObject = der });

        }
    }
}
