using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Company
    {
        public Company()
        {
            Customers = new HashSet<Customer>();
        }

        public int Id { get; set; }
        public string? CompanyName { get; set; }
        public string? CompanyPhone { get; set; }
        public string? CompanyAddress { get; set; }
        public string? CompanyEmail { get; set; }
        public string? CompanyDescription { get; set; }
        public int? Deleted { get; set; }

        public virtual ICollection<Customer> Customers { get; set; }
    }
}
