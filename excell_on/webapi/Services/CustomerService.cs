using Microsoft.Extensions.Options;
using webapi.Authorization;
using webapi.Helpers;
using webapi.Models;

namespace webapi.Services
{
    public interface ICustomerService
    {
        AuthenticateResponseCustomer Authenticate(AuthenticateRequest model);

        IEnumerable<Customer> GetAll();

        Customer GetById(string Id);

        void CreateCustomer(Customer customer);
    }

    public class CustomerService : ICustomerService
    {
        private readonly ExcellOnDbContext _context;
        private readonly IJwtUtilsCus _jwtUtils;
        private readonly AppSettings _appSettings;

        public CustomerService(
            ExcellOnDbContext context,
            IJwtUtilsCus jwtUtils,
            IOptions<AppSettings> appSettings)
        {
            _context = context;
            _jwtUtils = jwtUtils;
            _appSettings = appSettings.Value;
        }


        public AuthenticateResponseCustomer Authenticate(AuthenticateRequest model)
        {
            var customer = _context.Customers.FirstOrDefault(c => c.CustomerName.Equals(model.UserName));
            Console.WriteLine(customer);
            // validate
            if (customer == null || !BCrypt.Net.BCrypt.Verify(model.Password, customer.CustomerPassword))
            {
                throw new KeyNotFoundException("User not found");
            }
            // authentication successful so generate jwt token
            var jwtToken = _jwtUtils.GenerateJwtTokenCus(customer);
            return jwtToken == null ? throw new KeyNotFoundException("JWT Null") : new AuthenticateResponseCustomer(customer, jwtToken);
        }

        public IEnumerable<Customer> GetAll()
        {
            return _context.Customers.ToList();
        }

        public Customer GetById(string id)
        {
            var customer = _context.Customers.FirstOrDefault(c => c.Id == int.Parse(id));
            return customer == null ? throw new KeyNotFoundException("Customer not found") : customer;
        }

        public void CreateCustomer(Customer customer)
        {
            if (_context.Customers.Any(x => x.CustomerEmail == customer.CustomerEmail))
            {
                throw new AppException("User with email address: " + customer.CustomerEmail + "already exists");
            }
            if (_context.Customers.Any(x => x.CustomerName == customer.CustomerName))
            {
                throw new AppException("User with user name: " + customer.CustomerName + "already exists");
            }
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(customer.CustomerPassword);
            customer.CustomerPassword = hashedPassword;
            _context.Customers.Add(customer);
            _context.SaveChanges();
        }
    }
}
