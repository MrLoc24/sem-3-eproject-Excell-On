﻿using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class staff
    {
        public staff()
        {
            StaffOrderDetails = new HashSet<StaffOrderDetail>();
        }

        public int Id { get; set; }
        public string? StaffEmail { get; set; }
        public int? StaffGender { get; set; }
        public int? StaffAge { get; set; }
        public int? StaffStatus { get; set; }
        public string? StaffPhone { get; set; }
        public string? StaffAddress { get; set; }
        public string? StaffAvatar { get; set; }
        public string? StaffFullName { get; set; }
        public int? ServiceId { get; set; }
        public bool? Deleted { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department? Department { get; set; }
        public virtual Service? Service { get; set; }
        public virtual ICollection<StaffOrderDetail> StaffOrderDetails { get; set; }
    }
}
