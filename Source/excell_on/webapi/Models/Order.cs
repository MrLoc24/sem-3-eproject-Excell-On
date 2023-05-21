using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Order
    {
        public Order()
        {
            Bankings = new HashSet<Banking>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public string? OrderDateCreate { get; set; }
        public string? OrderDescription { get; set; }
        public double? OrderTotalCost { get; set; }
        public int? OrderStatus { get; set; }
        public int CustomerId { get; set; }

        public virtual Customer Customer { get; set; } = null!;
        public virtual ICollection<Banking> Bankings { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
