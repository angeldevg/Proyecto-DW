
package gt.edu.umg.desarrollo.proyecto.Model;

import javax.swing.table.DefaultTableModel;

public interface IPacienteDao {
    
    public int AddPaciente(PacienteEntity paciente);
    public DefaultTableModel GetPatient();
    public int UpdatePatient(PacienteEntity paciente);
    public int DeletePatient(int idPaciente);
}
