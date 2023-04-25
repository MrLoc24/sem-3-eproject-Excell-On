using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Models;
using webapi.Services;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly IServiceService _serviceService;

        public ServiceController(IServiceService serviceService)
        {
            _serviceService = serviceService;
        }

        [HttpGet, AllowAnonymous]
        public IActionResult GetAll()
        {
            var service = _serviceService.GetAll();
            return Ok(new { status = "ok", message = "", responseObject = service });
        }

        [HttpGet("{id}"), AllowAnonymous]
        public IActionResult GetById(int id)
        {
            var service = _serviceService.GetById(id);
            return Ok(new { status = "ok", message = "", responseObject = service });
        }
        [HttpPost, Authorize("Admin", "Manager", "Auditor")]

        public IActionResult Create(Service services)
        {
            _serviceService.Create(services);
            return Ok(new { message = "New service created" });
        }
        [HttpPut("{id}"), Authorize("Admin", "Manager")]
        public IActionResult Update(int id,Service services)
        {
            _serviceService.Update(id, services);
            return Ok(new { message = "Update Successfully" });
        }
    }
}
