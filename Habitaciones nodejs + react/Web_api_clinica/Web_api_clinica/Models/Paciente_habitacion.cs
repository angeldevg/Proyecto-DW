using System.ComponentModel.DataAnnotations;

namespace Web_api_clinica.Models
{
    public class Paciente_habitacion
    {
        [Key]
        public int id { get; set; }
        public int id_paciente { get; set; }
        public int id_habitacion { get; set; }
        public int dias { get; set; }
        public string descripcion { get; set; }
       
    }
}