using Microsoft.EntityFrameworkCore;
using  System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using  PizzaShop.Models;

namespace PizzaShop.Services
{
    public class PizzaShopContext: DbContext
    {
        public DbSet<Pizza> Pizzas { get; set; } 
        public DbSet<Diameter> Diameters { get; set; }
        public DbSet<PizzaDiameter> PizzaDiameters { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Cart> Carts { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<PizzaDiameter>().HasKey(u => new { u.DiameterId, u.PizzaId});
            modelBuilder.Entity<Pizza>(eb =>eb.Property(b => b.Name).HasColumnType("varchar(200)"));
            modelBuilder.Entity<User>(eb => eb.Property(b => b.Password).HasColumnType("varchar(255)"));
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL("server=localhost;port=3306;database=pizzashop;uid=root;password=root;charset=utf8");
        }
    }
}