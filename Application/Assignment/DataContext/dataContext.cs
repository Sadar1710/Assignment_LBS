using Assignment.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assignment.DataContext
{
    public class dataContext:DbContext
    {
        public dataContext(DbContextOptions<dataContext> options)
           : base(options)
        {
        }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Department>Department { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<Department>().HasData(new Department
            {
                DepartmentId = 1,
                DepartmentName = "CSE"
            });
            builder.Entity<Department>().HasData(new Department
            {
                DepartmentId = 2,
                DepartmentName = "EEE"
            });
            builder.Entity<Department>().HasData(new Department
            {
                DepartmentId = 3,
                DepartmentName = "BBA"
            });
        }
    }
}
