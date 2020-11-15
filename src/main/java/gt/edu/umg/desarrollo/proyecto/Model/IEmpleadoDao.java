
package gt.edu.umg.desarrollo.proyecto.Model;

import javax.swing.table.DefaultTableModel;


public interface IEmpleadoDao {
    
    public int AddEmpleado(EmpleadoEntity empleado);
    public DefaultTableModel GetEmployee();
    public int UpdateEmployee(EmpleadoEntity empleado);
    public int DeleteEmployee(int idEmpleado);
    
}
