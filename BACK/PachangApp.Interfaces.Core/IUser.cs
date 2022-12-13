using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PachangApp.Interfaces.Core
{
    public interface IUser
    {
        int Id { get; set; }
        string Name { get; set; }
        string LastName { get; set; }
        DateTime? BirthDay { get; set; }
        int? PhoneNumber { get; set; }
        string Email { get; set; }
        string Password { get; set; }
    }
}
