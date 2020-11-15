
package gt.edu.umg.desarrollo.proyecto.Model;

public class DiagnosticoEntity {
    

    private int idPaciente;
    private String descripcion;
    private int idMedicina;
    private String fecha;


    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdMedicina() {
        return idMedicina;
    }

    public void setIdMedicina(int idMedicina) {
        this.idMedicina = idMedicina;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    

}