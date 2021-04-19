using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment.ViewModel
{
    public class DepartmentVM
    {
        public int Serial { get; set; }
        public int DepartmentId { get; set; }
        [Required]
        public string DepartmentName { get; set; }
    }
}
