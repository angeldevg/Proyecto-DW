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

    public class Lote_medicinaController : ControllerBase
    {
        private Conexion dbConexion;

        public Lote_medicinaController()
        {
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Lote_medicina>>> GetLote_medicina()
        {
            return await dbConexion.Lote_medicina.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Lote_medicina>> GetLote_medicina(int id)
        {
            var lote_medicina = await dbConexion.Lote_medicina.FindAsync(id);

            if (lote_medicina == null)
            {
                return NotFound();
            }

            return lote_medicina;
        }

        [HttpPost] // INSERTAR
        public async Task<ActionResult<Lote_medicina>> PostLote_medicina(Lote_medicina lote_medicina)
        {
            dbConexion.Lote_medicina.Add(lote_medicina);
            await dbConexion.SaveChangesAsync();

            return CreatedAtAction(nameof(GetLote_medicina), new { id = lote_medicina.id_lote }, lote_medicina);
        }

        [HttpPut("{id}")] // ACTUALIZAR
        public async Task<IActionResult> PutLote_medicina(int id, Lote_medicina lote_medicina)
        {
            if (id != lote_medicina.id_lote)
            {
                return BadRequest();
            }

            dbConexion.Entry(lote_medicina).State = EntityState.Modified;

            try
            {
                await dbConexion.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Lote_medicinaExists(id))
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
        public async Task<ActionResult<Lote_medicina>> Lote_medicina(int id)
        {
            var lote_medicina = await dbConexion.Lote_medicina.FindAsync(id);
            if (lote_medicina == null)
            {
                return NotFound();
            }

            dbConexion.Lote_medicina.Remove(lote_medicina);
            await dbConexion.SaveChangesAsync();

            return lote_medicina;
        }

        private bool Lote_medicinaExists(int id)
        {
            return dbConexion.Lote_medicina.Any(e => e.id_lote == id);
        }

    }
 
}