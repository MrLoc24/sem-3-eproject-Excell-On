using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class MyCompany
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        public string? Image { get; set; }
        public string? Description { get; set; }
        public string? Address { get; set; }
        public string? TaxIdentificationNumber { get; set; }
        public string? MyMission { get; set; }
        public string? MyVision { get; set; }
        public string? MyTarget { get; set; }
    }
}
