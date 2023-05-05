using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using webapi.Authorization;
using webapi.Helpers;
using webapi.Models;

namespace webapi.Services
{
    public interface IStaffService
    {
        IEnumerable<staff> GetAll();
        IEnumerable<Department> GetAllDepartments();
        staff GetById(int id);
        void UpdateProfile(staff staff);
        void UpdateAvatar(string id, string url);
        void AddNewStaff(staff staff);
    }
    public class StaffService : IStaffService
    {
        private readonly ExcellOnDbContext _context;


        public StaffService(ExcellOnDbContext context)
        {
            _context = context;

        }
        public void AddNewStaff(staff staff)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<staff> GetAll()
        {
            return _context.staff.Include(s => s.Department).Include(c => c.Service).Include(x => x.StaffOrderDetails).ToList();
        }

        public IEnumerable<Department> GetAllDepartments()
        {
            return _context.Departments.ToList();
        }

        public staff GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void UpdateAvatar(string id, string url)
        {
            throw new NotImplementedException();
        }

        public void UpdateProfile(staff staff)
        {
            throw new NotImplementedException();
        }
    }
}
