using System.ComponentModel.DataAnnotations;

namespace Web_api_clinica.Models
{
    public class Habitaciones
    {
        [Key]
        public int id_habitacion { get; set; }
        public int no_habitacion { get; set; }
        public string descripcion { get; set; }
        public int no_paciente_habitacion { get; set; }
        
    }
}
