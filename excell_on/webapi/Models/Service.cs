using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Service
    {
        public Service()
        {
            Images = new HashSet<Image>();
            OrderDetails = new HashSet<OrderDetail>();
            staff = new HashSet<staff>();
        }

        public int Id { get; set; }
        public string? ServiceName { get; set; }
        public double? ServicePrice { get; set; }
        public string? ServiceDescription { get; set; }
        public int? ServiceSaleStatus { get; set; }
        public string? ServiceImage { get; set; }
        public double? ServicePriceSale { get; set; }
        public int? Deleted { get; set; }

        public virtual ICollection<Image> Images { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<staff> staff { get; set; }
    }
}
