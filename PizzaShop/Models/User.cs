﻿using System.Security.Policy;
using MySql.Data.EntityFrameworkCore.DataAnnotations;

namespace PizzaShop.Models
{
    [MySqlCharset("utf8")]
    public class User
    {
        public int Id { get; set; }
        public  string Name { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }
        public Role Role { get; set; }
    }
}