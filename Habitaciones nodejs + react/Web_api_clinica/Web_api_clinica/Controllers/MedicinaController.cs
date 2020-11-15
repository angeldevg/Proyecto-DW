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
    public class MedicinaController : ControllerBase{
        private Conexion dbConexion;

        public MedicinaController()
        {
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Medicina>>> GetMedicina()
        {
            return await dbConexion.Medicina.ToListAsync();
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Medicina>> GetMedicina(int id)
        {
            var medicina = await dbConexion.Medicina.FindAsync(id);

            if (medicina == null)
            {
                return NotFound();
            }

            return medicina;
        }

        [HttpPost] // INSERTAR
        public async Task<ActionResult<Medicina>> PostEmpleados(Medicina medicina)
        {
            dbConexion.Medicina.Add(medicina);
            await dbConexion.SaveChangesAsync();

            //return CreatedAtAction("GetTodoItem", new { id = todoItem.Id }, todoItem);
            return CreatedAtAction(nameof(GetMedicina), new { id = medicina.id_medicina }, medicina);
        }

        [HttpPut("{id}")] // ACTUALIZAR
        public async Task<IActionResult> PutMedicina(int id, Medicina medicina)
        {
            if (id != medicina.id_medicina)
            {
                return BadRequest();
            }

            dbConexion.Entry(medicina).State = EntityState.Modified;

            try
            {
                await dbConexion.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MedicinaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        [HttpDelete("{id}")] //ELIMINAR
        public async Task<ActionResult<Medicina>> Medicina(int id)
        {
            var medicina = await dbConexion.Medicina.FindAsync(id);
            if (medicina == null)
            {
                return NotFound();
            }

            dbConexion.Medicina.Remove(medicina);
            await dbConexion.SaveChangesAsync();

            return medicina;
        }

        private bool MedicinaExists(int id)
        {
            return dbConexion.Medicina.Any(e => e.id_medicina == id);
        }
    }
}
