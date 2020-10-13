package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmpleadoDao implements IEmpleadoDao {

    PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;

    @Override
    public int AddEmpleado(EmpleadoEntity empleado){

        int retorno = 0;
        
        conexion = new Conexion();
        
        try {
            String query = "insert into empleados(nombre, direccion, telefono, fecha_nacimiento, cui, id_tipo_empleado) values (?, ?, ?, ?, ?, ?);";           
            
            conexion.OpenConnection();
            
            parametro = conexion.conexionBD.prepareStatement(query);
            
            parametro.setString(1, empleado.getNombre());
            parametro.setString(2, empleado.getDireccion());
            parametro.setInt(3, empleado.getTelefono());
            parametro.setString(4, empleado.getFechaNacimiento());
            parametro.setLong(5, empleado.getDpi());
            parametro.setInt(6, empleado.getIdTipoEmpleado());

            
            retorno = parametro.executeUpdate();
            
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage() );
        }finally {
            conexion.Closeconnection();
        }

        return retorno;
    }

}
