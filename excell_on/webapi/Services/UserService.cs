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

        UserInFo GetById(string UserName);
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
            return _context.UserInFos;
        }

        public UserInFo GetById(string id)
        {
            var user = _context.UserInFos.FirstOrDefault(c => c.Id == int.Parse(id));
            return user == null ? throw new KeyNotFoundException("User not found") : user;
        }

    }
}
