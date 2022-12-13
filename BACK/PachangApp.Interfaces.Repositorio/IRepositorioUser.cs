namespace PachangApp.Interfaces.Repositorio
{
    public interface IRepositorioUser<T>
    {
        IEnumerable<T> GetUsers();
        T GetUserByEmail();
        bool AddUser(T newUser);

    }
}
