using System;
using System.ComponentModel.DataAnnotations;
namespace Web_api_clinica.Models
{
    public class Medicina{
        [Key]
        public int id_medicina { get; set; }
        public string nombre { get; set; }
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
        public string fecha_entrada { get; set; }
        public string fecha_vencimiento { get; set; }
        public int id_lote { get; set; }        
    }
}