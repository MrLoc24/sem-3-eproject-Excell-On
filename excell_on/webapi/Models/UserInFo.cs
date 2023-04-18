using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class UserInFo
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? UserPassword { get; set; }
        public string? UserEmail { get; set; }
        public int? UserGender { get; set; }
        public int? UserAge { get; set; }
        public string? UserPhone { get; set; }
        public string? UserAddress { get; set; }
        public string? UserAvatar { get; set; }
        public string? UserFullName { get; set; }
        public string? UserAboutMe { get; set; }
        public string? Role { get; set; }

        public virtual Role? RoleNavigation { get; set; }
    }
}
