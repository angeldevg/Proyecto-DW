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
    public class Paciente_habitacionController : ControllerBase
    {
        private Conexion dbConexion;
        
        public Paciente_habitacionController()
        {
            dbConexion = Conectar.Create();
        }

        
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Paciente_habitacion>>> GetPaciente_habitacion()
        {
            var pacienteNombre =  dbConexion.Paciente_habitacion.GroupJoin(dbConexion.Pacientes, per => per.id_paciente,
                dir => dir.id_paciente, (per, dir) => new { per, dir }).ToListAsync();

            return await dbConexion.Paciente_habitacion.ToListAsync();
            
        }

      /*  public ActionResult Index() {
            var pacienteNombre = dbConexion.Paciente_habitacion.GroupJoin(dbConexion.Pacientes, per => per.id_paciente,
              dir => dir.id_paciente, (per, dir) => new { per, dir });

            return dbConexion.Paciente_habitacion.ToList();
        }*/

        /*
         
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Paciente_habitacion>>> GetPaciente_habitacion()
        {
            return await dbConexion.Paciente_habitacion.ToListAsync();
        }

        */


        [HttpGet("{id}")]
        public async Task<ActionResult<Paciente_habitacion>> GetPaciente_habitacion(int id)
        {
            var paciente_habitacion = await dbConexion.Paciente_habitacion.FindAsync(id);

            if (paciente_habitacion == null)
            {
                return NotFound();
            }

            return paciente_habitacion;
        }

        [HttpPost]
        public async Task<ActionResult<Paciente_habitacion>> PostPaciente_habitacion(Paciente_habitacion paciente_habitacion)
        {
            dbConexion.Paciente_habitacion.Add(paciente_habitacion);
            await dbConexion.SaveChangesAsync();

            //return CreatedAtAction("GetTodoItem", new { id = todoItem.Id }, todoItem);
            return CreatedAtAction(nameof(GetPaciente_habitacion), new { id = paciente_habitacion.id }, paciente_habitacion);
        }
    }
}
