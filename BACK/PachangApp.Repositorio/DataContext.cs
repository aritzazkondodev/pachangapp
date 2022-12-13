namespace PachangApp.Repositorio
{

    using Microsoft.EntityFrameworkCore;
    using PachangApp.Core;
    using PachangApp.Repositorio.EntityConfigurations;

    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options){}


        public DbSet<User> Users { get; set; }

       

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
        }

        

    }
}
