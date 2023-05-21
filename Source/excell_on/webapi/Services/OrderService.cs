using Microsoft.EntityFrameworkCore;
using webapi.Models;

namespace webapi.Services
{
    public interface IOrderService
    {
        IEnumerable<Order> GetAll();

        IEnumerable<Order> GetById(string customerId);

        IEnumerable<OrderDetail> GetOrderDetailById(string orderId);

        Order GetSingleById(int id);

        void AddNewOrder(int customerId);

        Order PendingOrder(string customerId);

        void AddNewOrderDetails(IEnumerable<OrderDetail> orderDetails, double totalCost, string customerId);

        void DeleteOrder(int Id);
    }
    public class OrderService : IOrderService
    {
        private readonly ExcellOnDbContext _context;

        public OrderService(ExcellOnDbContext context)
        {
            _context = context;

        }
        public IEnumerable<Order> GetAll()
        {
            return _context.Orders.Include(o => o.OrderDetails).ThenInclude(d => d.Department).Include(c => c.Customer).Include(b => b.Bankings).ToList();
        }
        //For customer order history
        public IEnumerable<Order> GetById(string customerId)
        {
            var order = _context.Orders.Include(o => o.OrderDetails).ThenInclude(d => d.Department).Include(o => o.OrderDetails).ThenInclude(d => d.Service).Include(c => c.Customer).Where(c => c.CustomerId == int.Parse(customerId) && c.OrderStatus != 0).ToList();
            return order;
        }

        public Order GetSingleById(int id)
        {
            var order = _context.Orders.Include(o => o.OrderDetails).ThenInclude(d => d.Department).Include(o => o.OrderDetails).ThenInclude(d => d.Service).Include(c => c.Customer).FirstOrDefault(c => c.Id == id);
            return order;
        }

        public void AddNewOrder(int customerId)
        {
            DateTime dateTime = DateTime.Now;
            var order = new Order
            {
                OrderDateCreate = dateTime.ToString("dd/MM/yyyy"),
                CustomerId = customerId,
                OrderDescription = string.Empty,
                OrderTotalCost = 0,
                OrderStatus = 0
            };
            _context.Orders.Add(order);
            _context.SaveChanges();
        }

        public Order PendingOrder(string customerId)
        {
            var order = _context.Orders.Where(c => c.CustomerId == int.Parse(customerId) && c.OrderStatus == 0).FirstOrDefault();
            return order;
        }

        public void AddNewOrderDetails(IEnumerable<OrderDetail> orderDetails, double totalCost, string customerId)
        {
            DateTime dateTime = DateTime.Now;
            var order = PendingOrder(customerId);
            foreach (var detail in orderDetails)
            {
                var od = new OrderDetail
                {
                    DepartmentId = detail.DepartmentId,
                    ServiceId = detail.ServiceId,
                    OrderDetailDateStart = detail.OrderDetailDateStart,
                    OrderDetailDateEnd = detail.OrderDetailDateEnd,
                    OrderDetailNumberOfPeople = detail.OrderDetailNumberOfPeople,
                    OrdersId = order.Id,
                    OrderDetailStatus = 1
                };
                _context.OrderDetails.Add(od);
                _context.SaveChanges();
            }
            order.OrderStatus = 1;
            order.OrderTotalCost = totalCost;
            order.OrderDateCreate = dateTime.ToString("G");
            _context.Orders.Update(order);
            _context.SaveChanges();
        }

        public void DeleteOrder(int id)
        {
            var order = _context.Orders.FirstOrDefault(i => i.Id == id);
            order.OrderStatus = 3;
            _context.Orders.Update(order);
            _context.SaveChanges();
        }

        public IEnumerable<OrderDetail> GetOrderDetailById(string orderId)
        {
            return _context.OrderDetails.Where(o => o.OrdersId == int.Parse(orderId)).Include(d => d.Department).Include(s => s.Service).ToList();
        }
    }
}
