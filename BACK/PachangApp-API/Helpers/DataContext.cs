namespace PachangApp_API.Helpers
{

    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using PachangApp_API.EntityConfigurations;
    using PachangApp_API.Models;

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
