using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace webapi.Models
{
    public partial class UserInFo
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public string? UserPassword { get; set; }
        public string? UserEmail { get; set; }
        public int? UserAge { get; set; }
        public string? UserPhone { get; set; }
        public string? UserAddress { get; set; }
        public string? UserAvatar { get; set; }
        public string? UserFullName { get; set; }
        public string? Role { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; }

        public virtual Role? RoleNavigation { get; set; }
    }
}
