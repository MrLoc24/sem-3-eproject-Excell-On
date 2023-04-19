using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class CardPayment
    {
        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public int? CardNumber { get; set; }
        public int? Cvv { get; set; }
        public DateTime? DateExpired { get; set; }

        public virtual Customer? Customer { get; set; }
    }
}
