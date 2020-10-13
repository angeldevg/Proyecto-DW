
package gt.edu.umg.desarrollo.proyecto.Model;

public class PacienteEntity extends AbstractPerson{
    
    private int idPaciente;
    private String carne;
    private int tlefonoFamiliar;

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public int getTlefonoFamiliar() {
        return tlefonoFamiliar;
    }

    public void setTlefonoFamiliar(int tlefonoFamiliar) {
        this.tlefonoFamiliar = tlefonoFamiliar;
    }
    
    
    
    
    
}
