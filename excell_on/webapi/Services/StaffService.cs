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
        void Delete(string id);
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
            if (_context.staff.Any(x => x.StaffEmail == staff.StaffEmail))
            {
                throw new AppException("User with email address: " + staff.StaffEmail + "already exists");
            }
            if (_context.staff.Any(x => x.StaffFullName == staff.StaffFullName))
            {
                throw new AppException("User with user name: " + staff.StaffFullName + "already exists");
            }
            _context.staff.Add(staff);
            _context.SaveChanges();
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
            return _context.staff.Include(d => d.Department).Include(s => s.Service).Include(s => s.StaffOrderDetails).FirstOrDefault(c => c.Id.Equals(id));
        }

        public void UpdateAvatar(string id, string url)
        {
            throw new NotImplementedException();
        }

        public void UpdateProfile(staff staffs)
        {
            staff foundStaff = GetById(staffs.Id) ?? throw new Exception("Staff not found"); ;
            foundStaff.StaffGender = staffs.StaffGender;
            foundStaff.StaffAddress = staffs.StaffAddress;
            foundStaff.StaffAge = staffs.StaffAge;
            foundStaff.ServiceId = staffs.ServiceId;
            foundStaff.StaffEmail = staffs.StaffEmail;
            foundStaff.StaffPhone = staffs.StaffPhone;
            foundStaff.DepartmentId = staffs.DepartmentId;
            foundStaff.StaffFullName = staffs.StaffFullName;
            _context.staff.Update(foundStaff);
            _context.SaveChanges();
        }
        public void Delete(string id)
        {
            staff staff = _context.staff.Find(int.Parse(id));
            try
            {
                if (staff != null)
                {
                    staff.Deleted = true;
                    _context.staff.Update(staff);
                    _context.SaveChanges();
                }

            }
            catch (Exception)
            {

                throw new Exception("Staff not found");
            }


        }
    }
}
