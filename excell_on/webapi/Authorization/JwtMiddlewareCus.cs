using Microsoft.Extensions.Options;
using webapi.Helpers;
using webapi.Services;

namespace webapi.Authorization
{
    public class JwtMiddlewareCus
    {
        private readonly RequestDelegate _next;
        private readonly AppSettings _appSettings;

        public JwtMiddlewareCus(RequestDelegate next, IOptions<AppSettings> appSettings)
        {
            _next = next;
            _appSettings = appSettings.Value;
        }

        public async Task Invoke(HttpContext context, ICustomerService customerService, IJwtUtilsCus jwtUtils)
        {
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            var userName = jwtUtils.ValidateJwtTokenCus(token);
            if (userName != null)
            {
                // attach user to context on successful jwt validation
                context.Items["Customer"] = customerService.GetById(userName);
            }
            await _next(context);
        }
    }
}
