using webapi.Models;

namespace webapi.Services
{
    public interface IServiceService
    {
        IEnumerable<Service> GetAll();
        Service GetById(int id);

        void Create(Service service);
    }
    public class ServiceService : IServiceService
    {
        private readonly ExcellOnDbContext _excellOnDbContext;

        public ServiceService(ExcellOnDbContext excellOnDbContext)
        {
            _excellOnDbContext = excellOnDbContext;
        }

        public IEnumerable<Service> GetAll()
        {
            return _excellOnDbContext.Services;
        }

        public Service GetById(int id)
        {
            return _excellOnDbContext.Services.FirstOrDefault(s => s.Id == id);
        }

        public void Create(Service service)
        {
            _excellOnDbContext.Services.Add(service);
            _excellOnDbContext.SaveChanges();

        }
    }
}
