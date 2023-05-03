using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using webapi.Authorization;
using webapi.Helpers;
using webapi.Models;
using static System.Net.Mime.MediaTypeNames;

namespace webapi.Services
{
    public interface IUserService
    {
        AuthenticateResponse Authenticate(AuthenticateRequest model);
        IEnumerable<UserInFo> GetAll();

        IEnumerable<Role> GetAllRoles();

        UserInFo GetById(string UserName);

        void ChangePassword(string id, string newPassword);

        void UpdateProfile(UserInFo userInFo);

        void UpdateAvatar(string id, string url);

        void AddNewUser(UserInFo user);
    }

    public class UserService : IUserService
    {
        private readonly ExcellOnDbContext _context;
        private readonly IJwtUtils _jwtUtils;
        private readonly AppSettings _appSettings;

        public UserService(
            ExcellOnDbContext context,
            IJwtUtils jwtUtils,
            IOptions<AppSettings> appSettings)
        {
            _context = context;
            _jwtUtils = jwtUtils;
            _appSettings = appSettings.Value;
        }


        public AuthenticateResponse Authenticate(AuthenticateRequest model)
        {
            var user = _context.UserInFos.FirstOrDefault(c => c.UserName.Equals(model.UserName));
            Console.WriteLine(user);
            // validate
            if (user == null || !BCrypt.Net.BCrypt.Verify(model.Password, user.UserPassword))
            {
                throw new KeyNotFoundException("User not found");
            }
            // authentication successful so generate jwt token
            var jwtToken = _jwtUtils.GenerateJwtToken(user);
            return jwtToken == null ? throw new KeyNotFoundException("JWT Null") : new AuthenticateResponse(user, jwtToken);
        }

        public IEnumerable<UserInFo> GetAll()
        {
            return (IEnumerable<UserInFo>)_context.UserInFos.Include(s => s.RoleNavigation).Select(s => new UserInFo { Id = s.Id, UserPhone = s.UserPhone, UserName = s.UserName, UserFullName = s.UserFullName, UserEmail = s.UserEmail, UserAddress = s.UserAddress, UserAge = s.UserAge, UserAvatar = s.UserAvatar, Role = s.RoleNavigation.Role1 }).ToList();
        }

        public IEnumerable<Role> GetAllRoles()
        {
            return _context.Roles.ToList();
        }

        public UserInFo GetById(string id)
        {
            var user = _context.UserInFos.FirstOrDefault(c => c.Id == int.Parse(id));
            return user == null ? throw new KeyNotFoundException("User not found") : user;
        }

        public void ChangePassword(string id, string newPassword)
        {
            UserInFo foundUser = GetById(id);
            if (BCrypt.Net.BCrypt.Verify(newPassword, foundUser.UserPassword))
            {
                throw new Exception("Same old thing!!!");
            }
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);
            foundUser.UserPassword = hashedPassword;
            _context.UserInFos.Update(foundUser);
            _context.SaveChanges();
        }

        public void UpdateProfile(UserInFo user)
        {
            UserInFo foundUser = GetById(user.Id.ToString());
            foundUser.UserPhone = user.UserPhone;
            foundUser.UserEmail = user.UserEmail;
            foundUser.UserAge = user.UserAge;
            foundUser.UserName = user.UserName;
            foundUser.UserFullName = user.UserFullName;
            foundUser.UserAddress = user.UserAddress;
            _context.UserInFos.Update(foundUser);
            _context.SaveChanges();
        }

        public void UpdateAvatar(string id, string url)
        {
            UserInFo foundUser = GetById(id);
            foundUser.UserAvatar = url;
            _context.UserInFos.Update(foundUser);
            _context.SaveChanges();
        }

        public void AddNewUser(UserInFo user)
        {
            if (_context.UserInFos.Any(x => x.UserEmail == user.UserEmail))
            {
                throw new AppException("User with email address: " + user.UserEmail + "already exists");
            }
            if (_context.UserInFos.Any(x => x.UserName == user.UserName))
            {
                throw new AppException("User with user name: " + user.UserName + "already exists");
            }
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword("12345");
            user.UserPassword = hashedPassword;
            _context.UserInFos.Add(user);
            _context.SaveChanges();
        }
    }
}
