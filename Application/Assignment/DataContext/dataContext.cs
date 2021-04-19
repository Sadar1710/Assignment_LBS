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
    }
}
