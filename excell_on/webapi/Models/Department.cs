using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Department
    {
        public Department()
        {
            OrderDetails = new HashSet<OrderDetail>();
            staff = new HashSet<staff>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<staff> staff { get; set; }
    }
}
