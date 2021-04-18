using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment.ViewModel
{
    public class EmployeeVM
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        public int DeptId { get; set; }
        public string Department { get; set; }
        public string Residency { get; set; }
        public string Gender { get; set; }
        [Required]
        public DateTime Birthdate { get; set; }      
        public IFormFile Photo { get; set; }
        public string PhotoPath { get; set; }
        [Required]
        [RegularExpression(@"[0][1][3-9]{1}[0-9]{8}", ErrorMessage = "Please provide valid Mobile Number")]
        public string Phone { get; set; }
    }
}
