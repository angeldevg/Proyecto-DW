using System.ComponentModel.DataAnnotations;

namespace Web_api_clinica.Models
{
    public class Pacientes
    {
        [Key]
        public int id_paciente { get; set; }
        public string no_carne { get; set; }
        public string nombre_paciente { get; set; }
        public int cui { get; set; }
        public int telefono_paciente { get; set; }
        public int telefono_familiar { get; set; }
        public string direccion { get; set; }    
        public string fecha_nacimiento { get; set; }
       
    }
}