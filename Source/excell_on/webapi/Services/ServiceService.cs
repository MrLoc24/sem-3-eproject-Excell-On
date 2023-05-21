using Microsoft.EntityFrameworkCore;
using webapi.Models;

namespace webapi.Services
{
    public interface IServiceService
    {
        IEnumerable<Service> GetAll();
        Service GetById(int id);

        void Create(Service service);
        void Update(int id, Service service);
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

        public void Update(int id, Service service)
        {
            try
            {
                var foundService = GetById(id);
                if (foundService != null)
                {
                    foundService = service;
                }
                _excellOnDbContext.Services.Update(foundService);
                _excellOnDbContext.SaveChanges();
            }
            catch (Exception e)
            {
                // handle correct exception
                // log error
                Console.WriteLine(e.Message);
            }

        }
    }
}
