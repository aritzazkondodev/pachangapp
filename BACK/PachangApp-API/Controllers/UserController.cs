using Microsoft.AspNetCore.Mvc;
using PachangApp.Core;
using PachangApp.Repositorio;

namespace PachangApp_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {

        private readonly DataContext _context;

        public UserController(ILogger<UserController> logger, DataContext context)
        {
            _context = context;
        }

        [HttpGet(Name = "GetUser")]


        [HttpPost(Name = "AddUser")]
        public void Add(string name, string lastName, string? birthDay, int? phoneNumber, string email, string password)
        {
            User u = new User(); 

            DateTime myDate;
            if (birthDay!= null)
            {
                myDate = DateTime.Parse(birthDay);

                u.BirthDay = myDate;
            }
            else
            {
                u.BirthDay = null;
            }
            
            u.Name = name;
            u.LastName = lastName;
            
            u.PhoneNumber = phoneNumber;
            u.Email = email;
            u.Password = password;

            _context.Users.Add(u);
            _context.SaveChanges();

        }
    }
}