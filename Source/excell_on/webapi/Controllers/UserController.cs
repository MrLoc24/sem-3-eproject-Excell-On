using webapi.Authorization;
using webapi.Models;
using webapi.Services;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;


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
            catch (Exception e)
            {
                return BadRequest(new {  message = e.Message});
            }

            return Ok(response);
        }
        [Authorize("Admin", "HR")]
        [HttpGet("Roles")]
        public IActionResult GetRoles()
        {
            var roles = _userService.GetAllRoles();
            return Ok(new { status = "ok", message = "", responseObject = roles });
        }

        [Authorize("Admin", "HR")]
        [HttpGet]
        public IActionResult GetAll()
        {
            var users = _userService.GetAll();
            return Ok(new { status = "ok", message = "", responseObject = users });
        }
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

        [HttpPut("changePassword/{id}")]
        public IActionResult ChangePassword(string id, string newPassword)
        {
            try
            {
                _userService.ChangePassword(id, newPassword);
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message, responseObject = "" });
            }
            return Ok(new { message = "Password Update" });
        }

        [HttpPut("updateProfile/{id}")]
        public IActionResult UpdateProfile(UserInFo user)
        {
            try
            {
                _userService.UpdateProfile(user);
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
                _userService.UpdateAvatar(id, url);
            }
            catch (Exception e)
            {
                return Ok(new { status = "fail", message = e.Message });
            }
            return Ok(new { message = "Avatar Update" });
        }

        [HttpPost("AddNew"), Authorize("Admin", "HR")]
        public IActionResult AddNew(UserInFo user)
        {
            try
            {
                _userService.AddNewUser(user);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "New user add" });
        }
        [HttpDelete("{id}"), Authorize("Admin", "HR")]
        public IActionResult Delete(string id)
        {
            try
            {
                _userService.Delete(id);
            }
            catch (Exception e)
            {

                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "Deleted" });
        }

    }
}

