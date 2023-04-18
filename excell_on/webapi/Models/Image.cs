using System;
using System.Collections.Generic;

namespace webapi.Models
{
    public partial class Image
    {
        public int Id { get; set; }
        public string? ImageLink { get; set; }
        public int? ServiceId { get; set; }

        public virtual Service? Service { get; set; }
    }
}
