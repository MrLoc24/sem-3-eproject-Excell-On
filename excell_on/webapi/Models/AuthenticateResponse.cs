namespace webapi.Models
{
    public class AuthenticateResponse
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? Role { get; set; }
        public string Token { get; set; }

        public AuthenticateResponse(UserInFo user, string token)
        {
            Id = user.Id;
            UserName = user.UserName;
            Role = user.Role;
            Token = token;
        }
    }
}
