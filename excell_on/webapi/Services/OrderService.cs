using Microsoft.EntityFrameworkCore;
using webapi.Models;

namespace webapi.Services
{
    public interface IOrderService
    {
        IEnumerable<Order> GetAll();
        void AddNewOrder(int customerId);

        Order PendingOrder(string customerId);

        void AddNewOrderDetails(IEnumerable<OrderDetail> orderDetails, double totalCost, string customerId);

        void DeleteOrder(string Id);
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
            return _context.Orders.Include(o => o.OrderDetails).Include(c => c.Customer).Include(b => b.Bankings).ToList();
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
            var order = PendingOrder(customerId);
            foreach (var detail in orderDetails)
            {
                var od = new OrderDetail
                {
                    DerpartmentId = detail.DerpartmentId,
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
            _context.Orders.Update(order);
            _context.SaveChanges();
        }

        public void DeleteOrder(string id)
        {
            var order = _context.Orders.FirstOrDefault(i => i.Id == int.Parse(id));
            order.OrderStatus = 3;
            _context.Orders.Update(order);
            _context.SaveChanges();
        }
    }
}
