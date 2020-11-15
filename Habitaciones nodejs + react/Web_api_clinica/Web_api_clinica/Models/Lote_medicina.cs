using System.ComponentModel.DataAnnotations;
namespace Web_api_clinica.Models
{
    public class Lote_medicina
    {
        [Key]
        public int id_lote { get; set; }
        public string proveedor { get; set; }
    }
}