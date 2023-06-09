﻿using webapi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System.Linq;
using System.Threading.Tasks;
using webapi.Authorization;
using webapi.Helpers;

namespace webapi.Authorization
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly AppSettings _appSettings;

        public JwtMiddleware(RequestDelegate next, IOptions<AppSettings> appSettings)
        {
            _next = next;
            _appSettings = appSettings.Value;
        }

        public async Task Invoke(HttpContext context, IUserService userService, ICustomerService customerService, IJwtUtils jwtUtils, IJwtUtilsCus jwtUtilsCus)
        {
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            var customerId = jwtUtilsCus.ValidateJwtTokenCus(token);
            var userId = jwtUtils.ValidateJwtToken(token);
            if (customerId != null)
            {
                // attach user to context on successful jwt validation
                context.Items["Customer"] = customerService.GetById(customerId);
            }
            if (userId != null)
            {
                context.Items["User"] = userService.GetById(userId);
            }
            await _next(context);


        }
    }
}
