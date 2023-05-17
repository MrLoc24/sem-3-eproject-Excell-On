
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
                return Ok(staff);
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
        [HttpPut("activateStatus/{id}")]
        public IActionResult Activate(string id)
        {
            try
            {
                _staffService.Activate(id);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "Staff Ready" });
        }

        [HttpPost]
        public IActionResult AddNew(staff staffs)
        {
            try
            {
                _staffService.AddNewStaff(staffs);
                return Ok(new { message = "Add Success" });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
        }
        [HttpPut("UpdateAvatar/{id}")]
        public IActionResult UpdateAvatar(string id, string url)
        {
            try
            {
                _staffService.UpdateAvatar(id, url);
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message });
            }
            return Ok(new { message = "Avatar Update" });
        }
        [HttpPut("updateProfile/{id}")]
        public IActionResult UpdateProfile(staff sta)
        {
            try
            {
                _staffService.UpdateProfile(sta);
                return Ok(new { message = "Staff Update" });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            
        }
    }
}
