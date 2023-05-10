
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Services;

namespace webapi.Controllers
{
    [Authorize]
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
        [HttpGet("{id}"), Authorize("Admin", "HR")]

        public IActionResult GetById(int id)
        {
            try
            {
                var staff = _staffService.GetById(id);
                return Ok(new { message = staff });
            }
            catch (Exception e)
            {

                return BadRequest(new { message = e.Message });
            }
        }
        [HttpPut("deleteStatus/{id}")]
        public IActionResult Delete(string id)
        {
            try
            {
                _staffService.Delete(id);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "Deleted successfully" });
        }
    }
}
