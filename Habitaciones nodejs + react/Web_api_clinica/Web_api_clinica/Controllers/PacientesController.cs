using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using Web_api_clinica.Models;

namespace Web_api_clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacientesController : ControllerBase
    {

        private Conexion dbConexion;

        public PacientesController()
        {
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Pacientes>>> GetPacientes()
        {


            return await dbConexion.Pacientes.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Pacientes>> GetPacientes(int id)
        {
            var pacientes = await dbConexion.Pacientes.FindAsync(id);

            if (pacientes == null)
            {
                return NotFound();
            }

            return pacientes;
        }

        [HttpPost]
        public async Task<ActionResult<Pacientes>> PostPacientes(Pacientes pacientes)
        {
            dbConexion.Pacientes.Add(pacientes);
            await dbConexion.SaveChangesAsync();

            //return CreatedAtAction("GetTodoItem", new { id = todoItem.Id }, todoItem);
            return CreatedAtAction(nameof(GetPacientes), new { id = pacientes.id_paciente }, pacientes);
        }
    }
}
