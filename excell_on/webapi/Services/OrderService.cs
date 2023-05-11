using Microsoft.EntityFrameworkCore;
using webapi.Models;

namespace webapi.Services
{
    public interface IOrderService
    {
        IEnumerable<Order> GetAll();
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
    }
}
