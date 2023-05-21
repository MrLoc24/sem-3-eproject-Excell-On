using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Banking
    {
        public int Id { get; set; }
        public DateTime? DateCreate { get; set; }
        public double? Money { get; set; }
        public bool? Deleted { get; set; }
        public bool? Status { get; set; }
        public int? OrderId { get; set; }
        public int? CustomerId { get; set; }

        public virtual Customer? Customer { get; set; }
        public virtual Order? Order { get; set; }
    }
}
