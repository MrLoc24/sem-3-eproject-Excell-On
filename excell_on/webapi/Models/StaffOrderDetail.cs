using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class StaffOrderDetail
    {
        public int Id { get; set; }
        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }
        public int? StaffId { get; set; }
        public int? OrderDetailId { get; set; }

        public virtual OrderDetail? OrderDetail { get; set; }
        public virtual staff? Staff { get; set; }
    }
}
