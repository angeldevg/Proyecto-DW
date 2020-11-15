using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_api_clinica.Models;

namespace Web_api_clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class PruebaController : ControllerBase{
        private Conexion dbConexion;

        public PruebaController()
        {
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Prueba>>> GetPrueba()
        {
            return await dbConexion.Prueba.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Prueba>> GetPrueba(int id)
        {
            var prueba = await dbConexion.Prueba.FindAsync(id);

            if (prueba == null)
            {
                return NotFound();
            }

            return prueba;
        }

        [HttpPost] // INSERTAR
        public async Task<ActionResult<Prueba>> PostPrueba(Prueba prueba)
        {
            dbConexion.Prueba.Add(prueba);
            await dbConexion.SaveChangesAsync();

            //return CreatedAtAction("GetTodoItem", new { id = todoItem.Id }, todoItem);
            return CreatedAtAction(nameof(GetPrueba), new { id = prueba.id }, prueba);
        }

    }
}
