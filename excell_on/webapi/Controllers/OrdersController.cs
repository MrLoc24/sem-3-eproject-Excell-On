
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using webapi.Authorization;
using webapi.Models;
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
        [HttpGet("allOrder/{id}"), Authorize]
        public ActionResult GetById(string id)
        {
            try
            {
                var order = _orderService.GetById(id);
                return Ok(order);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }

        }
        [HttpGet("order/{id}"), Authorize]
        public ActionResult GetSingleById(string id)
        {
            try
            {
                var order = _orderService.GetSingleById(int.Parse(id));
                return Ok(order);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }

        }
        [HttpPost]
        public ActionResult AddNewOrder(int id)
        {
            try
            {
                _orderService.AddNewOrder(id);

            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok();
        }
        [HttpGet("pending/{id}"), AllowAnonymous]

        public ActionResult PendingOrder(string id)
        {
            try
            {
                var order = _orderService.PendingOrder(id);
                return Ok(order);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
        }
        [HttpPost("newOrder"), AllowAnonymous]
        public ActionResult AddNewOrderDetail(IEnumerable<OrderDetail> orders, double totalCost, string id)
        {
            try
            {
                _orderService.AddNewOrderDetails(orders, totalCost, id);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "Add Success" });
        }
    }
}
