using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PizzaShop.Models;
using PizzaShop.Services;
using Microsoft.EntityFrameworkCore;

namespace PizzaShop.Controllers
{
    public class ApiController
    {
        [HttpGet]
        public async Task<IActionResult> GetPizzas()
        {
            var psContext = new PizzaShopContext();
            var pizzas = await psContext.PizzaDiameters.Include(pd => pd.Pizza).Include(pd => pd.Diameter)
                .ToListAsync();
            if (pizzas.Count == 0)
                return new NotFoundResult();
            else 
                return new OkObjectResult(pizzas);

        }
    }
}