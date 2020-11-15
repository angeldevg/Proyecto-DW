
package gt.edu.umg.desarrollo.proyecto.Model;

import java.util.HashMap;
import javax.swing.table.DefaultTableModel;


public interface IExamenDao {
    
    public int SaveExamen(ExamenEntity examen);
    public HashMap GetEmployee();
    public HashMap GetExament();
    public HashMap GetClinic();
    public HashMap GetPaciente();
     public DefaultTableModel GetPrescripcion();
    
    
}
