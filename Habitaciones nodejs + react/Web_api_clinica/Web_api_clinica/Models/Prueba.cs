using System.ComponentModel.DataAnnotations;

namespace Web_api_clinica.Models
{
    public class Prueba
    {
        [Key]
        public int id { get; set; }
        public string descripcion { get; set; }
        public int id_prueba { get; set; }
    }
}