using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Bankings = new HashSet<Banking>();
            CardPayments = new HashSet<CardPayment>();
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerPhone { get; set; }
        public string? CustomerEmail { get; set; }
        public string? CustomerUserName { get; set; }
        public string? CustomerPassword { get; set; }
        public string? CustomerAvatar { get; set; }
        public int? Deleted { get; set; }

        public virtual ICollection<Banking> Bankings { get; set; }
        public virtual ICollection<CardPayment> CardPayments { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
