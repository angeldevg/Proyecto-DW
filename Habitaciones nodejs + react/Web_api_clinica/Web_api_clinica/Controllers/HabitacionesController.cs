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
    public class HabitacionesController : ControllerBase
    {
        private Conexion dbConexion;

        public HabitacionesController()
        {
            dbConexion = Conectar.Create();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Habitaciones>>> GetHabitaciones()
        {
            return await dbConexion.Habitaciones.ToListAsync();
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Habitaciones>> GetHabitaciones(int id)
        {
            var habitaciones = await dbConexion.Habitaciones.FindAsync(id);

            if (habitaciones == null)
            {
                return NotFound();
            }

            return habitaciones;
        }

        [HttpPost]
        public async Task<ActionResult<Habitaciones>> PostHabitaciones(Habitaciones habitaciones)
        {
            dbConexion.Habitaciones.Add(habitaciones);
            await dbConexion.SaveChangesAsync();

            //return CreatedAtAction("GetTodoItem", new { id = todoItem.Id }, todoItem);
            return CreatedAtAction(nameof(GetHabitaciones), new { id = habitaciones.id_habitacion }, habitaciones);
        }

    }
}
