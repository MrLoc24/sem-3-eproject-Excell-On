using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Role
    {
        public Role()
        {
            UserInFos = new HashSet<UserInFo>();
        }

        public int Id { get; set; }
        public string Role1 { get; set; } = null!;

        public virtual ICollection<UserInFo> UserInFos { get; set; }
    }
}
