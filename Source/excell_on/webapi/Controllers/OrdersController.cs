
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
                return Ok(new { responseObject = order });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });

            }

        }
        [HttpGet("allOrder/{id}"), Authorize]
        //Customer Order History
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
        [HttpGet("order/{id}"), Authorize("Admin")]
        public ActionResult GetSingleById(int id)
        {
            try
            {
                var order = _orderService.GetSingleById(id);
                return Ok(new { responseObject = order });
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
        [HttpPut("delete/{id}")]
        public ActionResult DeleteOrder(int id)
        {
            try
            {
                _orderService.DeleteOrder(id);
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }
            return Ok(new { message = "Delete success" });
        }
        [HttpGet("orderDetail/{id}")]
        public ActionResult GetOrderDetailById(string id)
        {
            try
            {
                var order = _orderService.GetOrderDetailById(id);
                return Ok(new { responseObject = order });
            }
            catch (Exception e)
            {
                return BadRequest(new { message = e.Message });
            }

        }
    }
}
