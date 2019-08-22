using MySql.Data.EntityFrameworkCore.DataAnnotations;

namespace PizzaShop.Models
{
    [MySqlCharset("utf8")]
    public class Cart
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public Order Order { get; set; }
        public int PizzaDiameterId { get; set; }
        public PizzaDiameter PizzaDiameter { get; set; }
        public int Quantity { get; set; }
    }
}