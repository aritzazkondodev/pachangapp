using PachangApp.Interfaces.Core;
using System.ComponentModel.DataAnnotations;

namespace PachangApp.Core
{
    public class User : IUser
    {
        #pragma warning disable CS8618 // Un campo que no acepta valores NULL debe contener un valor distinto de NULL al salir del constructor. Considere la posibilidad de declararlo como que admite un valor NULL.
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public DateTime? BirthDay { get; set; }
        public int? PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        #pragma warning restore CS8618 // Un campo que no acepta valores NULL debe contener un valor distinto de NULL al salir del constructor. Considere la posibilidad de declararlo como que admite un valor NULL.

    }
}