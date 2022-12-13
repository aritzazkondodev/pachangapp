using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PachangApp.Core;

namespace PachangApp.Repositorio.EntityConfigurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("Users");

            //Propiedades
            builder
                .Property(d => d.Id)
                .IsRequired();

            builder
                .Property(d => d.Name)
                .IsRequired();

            builder
               .Property(d => d.LastName)
               .IsRequired();

            builder
               .Property(d => d.BirthDay)
               .IsRequired();

            builder
               .Property(d => d.PhoneNumber);

            builder
                .Property(d => d.Email)
                .IsRequired();

            builder
                .Property(d => d.Password)
                .IsRequired();


            //Claves
            builder.HasKey(d => d.Id);

            //Relaciones

        }
    }
}
