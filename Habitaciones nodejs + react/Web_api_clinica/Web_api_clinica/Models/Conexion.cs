using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;
using Web_api_clinica.Models;

namespace Web_api_clinica.Models
{
    class Conexion : DbContext
    {
        public Conexion(DbContextOptions<Conexion> options) : base(options) { }

        public DbSet<Medicina> Medicina { get; set; }
        public DbSet<Lote_medicina> Lote_medicina { get; set; }
        public DbSet<Pacientes> Pacientes { get; set; }
        public DbSet<Habitaciones> Habitaciones { get; set; }
        public DbSet<Paciente_habitacion> Paciente_habitacion { get; set; }
        public DbSet<Prueba> Prueba { get; set; }


    }
    class Conectar
    {
        private const string cadenaConexion = "server=localhost;port=3306;database=db_clinica;userid=usr_clinica;pwd=Clinic@123";
        public static Conexion Create()
        {
            var constructor = new DbContextOptionsBuilder<Conexion>();
            constructor.UseMySQL(cadenaConexion);
            var Conexion = new Conexion(constructor.Options);
            return Conexion;
        }
    }
}
