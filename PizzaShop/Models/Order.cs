using System;
using MySql.Data.EntityFrameworkCore.DataAnnotations;

namespace PizzaShop.Models
{
    [MySqlCharset("utf8")]
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public DateTime OrderDate { get; set; }
        public int FinalPrice { get; set; }
        public bool Confirmed { get; set; }
    }
}