﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using PizzaShop.Services;

namespace PizzaShop.Migrations
{
    [DbContext(typeof(PizzaShopContext))]
    [Migration("20190822182406_DeletePizzaDiametersTable")]
    partial class DeletePizzaDiametersTable
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.11-servicing-32099");

            modelBuilder.Entity("PizzaShop.Models.Diameter", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("DiameterValue");

                    b.HasKey("Id");

                    b.ToTable("Diameters");

                    b.HasAnnotation("MySQL:Charset", "utf8");
                });

            modelBuilder.Entity("PizzaShop.Models.Pizza", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Name")
                        .HasColumnType("varchar(200)");

                    b.HasKey("Id");

                    b.ToTable("Pizzas");

                    b.HasAnnotation("MySQL:Charset", "utf8");
                });

            modelBuilder.Entity("PizzaShop.Models.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Name");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("PizzaShop.Models.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Login");

                    b.Property<string>("Name");

                    b.Property<string>("Password")
                        .HasColumnType("varchar(255)");

                    b.Property<int>("RoleId");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("Users");

                    b.HasAnnotation("MySQL:Charset", "utf8");
                });

            modelBuilder.Entity("PizzaShop.Models.User", b =>
                {
                    b.HasOne("PizzaShop.Models.Role", "Role")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
