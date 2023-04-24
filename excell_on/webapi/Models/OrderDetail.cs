using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            StaffOrderDetails = new HashSet<StaffOrderDetail>();
        }

        public int Id { get; set; }
        public DateTime? OrderDetailDateStart { get; set; }
        public DateTime? OrderDetailDateEnd { get; set; }
        public int? OrderDetailStatus { get; set; }
        public int? OrderDetailNumberOfPeople { get; set; }
        public int? ServiceId { get; set; }
        public int? OrdersId { get; set; }
        public int? DerpartmentId { get; set; }

        public virtual Department? Derpartment { get; set; }
        public virtual Order? Orders { get; set; }
        public virtual Service? Service { get; set; }
        public virtual ICollection<StaffOrderDetail> StaffOrderDetails { get; set; }
    }
}
