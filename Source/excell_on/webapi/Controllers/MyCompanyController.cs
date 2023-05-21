using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Services;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MyCompanyController : ControllerBase
    {
        private readonly IMyCompanyService _myCompanyService;

        public MyCompanyController(IMyCompanyService myCompanyService)
        {
            _myCompanyService = myCompanyService;
        }

        [AllowAnonymous, HttpGet]
        public IActionResult GetAll()
        {
            var myCompany = _myCompanyService.Get();
            return Ok(new { status = "ok", message = "", responseObject = myCompany });
        }
    }
}
