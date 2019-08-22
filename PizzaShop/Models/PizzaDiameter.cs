using System.ComponentModel.DataAnnotations;
using MySql.Data.EntityFrameworkCore.DataAnnotations;

namespace PizzaShop.Models
{
    [MySqlCharset("utf8")]
    public class PizzaDiameter
    {
        [Key]
        public int Id { get; set; }
        public int DiameterId { get; set; }
        public Diameter Diameter { get; set; }
        public int PizzaId { get; set; }
        public Pizza Pizza { get; set; }
        public int Price { get; set; }
    }
}