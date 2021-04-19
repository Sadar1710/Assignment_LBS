using Assignment.DataContext;
using Assignment.Models;
using Assignment.ViewModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting.Internal;
using Microsoft.Extensions.Logging;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using X.PagedList;

namespace Assignment.Controllers
{
    public class HomeController : Controller
    {
        private readonly dataContext _context;
        [Obsolete]
        private readonly IHostingEnvironment hostingEnvironment;

        private readonly ILogger<HomeController> _logger;

        [Obsolete]
        public HomeController(ILogger<HomeController> logger, dataContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            this.hostingEnvironment = hostingEnvironment;
            _logger = logger;
        }

        public IActionResult Index()
        {
            ViewBag.Department = new SelectList(_context.Department.AsNoTracking().
              ToList(), "DepartmentId", "DepartmentName");
            return View();
        }
        [HttpPost]
        [Obsolete]
        public IActionResult Index(EmployeeVM employeeVM)
        {
            string uniqueFileName = UploadedFile(employeeVM);
            Employee e = new Employee()
            {
                Name = employeeVM.Name,
                Address = employeeVM.Address,
                DepartmentId = employeeVM.DeptId,
                Residency = employeeVM.Residency,
                Gender = employeeVM.Gender,
                Birthdate = employeeVM.Birthdate,
                Phone = employeeVM.Phone,
                Photo = uniqueFileName
            };
            _context.Employee.Add(e);
            _context.SaveChanges();
            ViewBag.Alert = "alert";
            ModelState.Clear();
            ViewBag.Department = new SelectList(_context.Department.AsNoTracking().
             ToList(), "DepartmentId", "DepartmentName");
            return View();
        }
        [Obsolete]
        private string UploadedFile(EmployeeVM model)
        {
            string uniqueFileName = null;
            if (model.Photo != null)
            {
                string uploadsFolder = Path.Combine(hostingEnvironment.WebRootPath, "images");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Photo.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.Photo.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }
        public IActionResult List(string success,int Page = 1)
        {
            ViewBag.success = success;
            var list = _context.Employee.Include(s => s.Department).ToList();
            var aa = new List<EmployeeVM>();
            int c = 1;
            foreach (var item in list)
            {
                //var d = _context.Department.AsNoTracking().Where(s => s.DeptId == item.DeptId).FirstOrDefault();
                EmployeeVM ab = new EmployeeVM()
                {
                    Id=item.Id,
                    Name = item.Name,
                    Address = item.Address,
                    Department = item.Department.DepartmentName,
                    Residency = item.Residency,
                    Gender = item.Gender,
                    Birthdate = item.Birthdate,
                    Phone = item.Phone,
                    PhotoPath=item.Photo
                };
                aa.Add(ab);
            }
            var lst = aa.ToPagedList(Page, 6);
            return View(lst);
        }       
        public IActionResult UpdateEmployee(int id)
        {
            var data = _context.Employee.AsNoTracking()
                 .Where(t => t.Id == id).FirstOrDefault();
            ViewBag.Gender = data.Gender;
            EmployeeVM m = new EmployeeVM()
            {
                Id=data.Id,
                Name = data.Name,
                Address = data.Address,
                DeptId = data.DepartmentId,
                Residency = data.Residency,
                Birthdate = data.Birthdate,
                Phone = data.Phone,
                PhotoPath = data.Photo
            };
            ViewBag.Department = new SelectList(_context.Department.AsNoTracking().
             ToList(), "DepartmentId", "DepartmentName");
            return View(m);
        }
        [HttpPost]
        [Obsolete]
        public IActionResult UpdateEmployee(EmployeeVM a)
        {
            Employee employee = _context.Employee.AsNoTracking()
                .Where(b => b.Id == a.Id).FirstOrDefault();
            employee.Name = a.Name;
            employee.Address = a.Address;
            employee.DepartmentId = a.DeptId;
            employee.Residency = a.Residency;
            employee.Birthdate = a.Birthdate;
            employee.Phone = a.Phone;
            employee.Gender = a.Gender;
            if (a.Photo != null)
            {
                if (a.PhotoPath != null)
                {
                    string filePath = Path.Combine(hostingEnvironment.WebRootPath,
                                      "images", a.PhotoPath);
                    System.IO.File.Delete(filePath);
                }
                employee.Photo = UploadedFile(a);
            }
            _context.Employee.Update(employee);
            _context.SaveChanges();
            ModelState.Clear();
            return RedirectToAction("List", new { success = "Successfully Updated." });
        }
        public IActionResult DeleteEmployee(int id)
        {
            var delete = _context.Employee.AsNoTracking().Where(t => t.Id == id).FirstOrDefault();
            _context.Employee.Remove(delete);
            _context.SaveChanges();
            return RedirectToAction("List");
        }
        public IActionResult AddDepartment()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddDepartment(DepartmentVM departmentVM)
        {
            var valid = _context.Department.AsNoTracking().
                Where(t => t.DepartmentName == departmentVM.DepartmentName).FirstOrDefault();
            if (valid != null)
            {
                ViewBag.Validation = "You have already added " + departmentVM.DepartmentName + ".";
                return View();
            }
            Department m = new Department()
            {
                DepartmentId = 0,
                DepartmentName = departmentVM.DepartmentName
            };
            _context.Department.Add(m);
            _context.SaveChanges();
            ViewBag.Success = "You have succesfully added " + departmentVM.DepartmentName + ".";
            ModelState.Clear();
            return View();
        }
        public IActionResult DepartmentList(string success)
        {
            ViewBag.success = success;
            var list = _context.Department.AsNoTracking().ToList();
            var a = new List<DepartmentVM>();
            int c = 1;
            foreach (var item in list)
            {
                DepartmentVM d = new DepartmentVM()
                {
                    Serial = c,
                    DepartmentId = item.DepartmentId,
                    DepartmentName = item.DepartmentName
                };
                a.Add(d);
                c++;
            }
            return View(a);
        }
        public IActionResult DeleteDepartment(int id)
        {
            var data = _context.Department.AsNoTracking()
                    .Where(t => t.DepartmentId == id).FirstOrDefault();
            _context.Department.Remove(data);
            _context.SaveChanges();
            return RedirectToAction("DepartmentList");
        }
        public IActionResult UpdateDepartment(int id)
        {

            var mealhourVm = _context.Department.AsNoTracking()
                 .Where(t => t.DepartmentId == id).FirstOrDefault();
            DepartmentVM m = new DepartmentVM()
            {
                DepartmentId = mealhourVm.DepartmentId,
                DepartmentName = mealhourVm.DepartmentName

            };
            return View(m);
        }
        [HttpPost]
        public IActionResult UpdateDepartment(DepartmentVM departmentVM)
        {
            var valid = _context.Department.AsNoTracking().
                Where(t => t.DepartmentName == departmentVM.DepartmentName).FirstOrDefault();
            if (valid != null)
            {
                ViewBag.Validation = "You have already added.";
                return View();
            }
            Department m = new Department()
            {
                DepartmentId = departmentVM.DepartmentId,
                DepartmentName = departmentVM.DepartmentName
            };
            _context.Department.Update(m);
            _context.SaveChanges();
            //ViewBag.success = "Updated Succesfully.";
            ModelState.Clear();           
            return RedirectToAction("DepartmentList", new { success = "Successfully Updated." });
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
