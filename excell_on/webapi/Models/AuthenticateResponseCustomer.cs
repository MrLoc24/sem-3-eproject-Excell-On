namespace webapi.Models
{
    public class AuthenticateResponseCustomer
    {
        public int Id { get; set; }
        public string? CustomerName { get; set; }
        public string Token { get; set; }

        public AuthenticateResponseCustomer(Customer customer, string token)
        {
            Id = customer.Id;
            CustomerName = customer.CustomerName;
            Token = token;
        }
    }
}
