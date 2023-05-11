
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Services;

namespace webapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderService _orderService;

        public OrdersController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult GetAll()
        {
            try
            {
                var order = _orderService.GetAll();
                return Ok(order);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });

            }
        }
    }
}
