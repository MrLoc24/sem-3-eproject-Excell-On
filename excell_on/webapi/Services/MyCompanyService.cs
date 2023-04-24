using webapi.Models;

namespace webapi.Services
{
    public interface IMyCompanyService
    {
        IEnumerable<MyCompany> Get();
    }
    public class MyCompanyService : IMyCompanyService
    {
        private readonly ExcellOnDbContext _excellOnDbContext;

        public MyCompanyService(ExcellOnDbContext excellOnDbContext)
        {
            _excellOnDbContext = excellOnDbContext;
        }

        public IEnumerable<MyCompany> Get()
        {
            return _excellOnDbContext.MyCompanies;
        }
    }
}
