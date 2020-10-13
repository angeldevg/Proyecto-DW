package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacienteDao implements IPacienteDao {

    PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;

    @Override
    public int AddPaciente(PacienteEntity paciente) {

        int retorno = 0;

        conexion = new Conexion();

        try {

            String query = "insert into pacientes (no_carne, nombre_paciente, cui, telefono_paciente, telefono_familiar, direccion, fecha_nacimiento) values (?, ?, ?, ?, ?, ?, ?);";

            conexion.OpenConnection();
            
            parametro = (PreparedStatement) conexion.conexionBD.prepareStatement(query);
            
            parametro.setString(1, paciente.getCarne());
            parametro.setString(2, paciente.getNombre());
            parametro.setLong(3, paciente.getDpi());
            parametro.setInt(4, paciente.getTelefono());
            parametro.setInt(5, paciente.getTlefonoFamiliar());
            parametro.setString(6, paciente.getDireccion());
            parametro.setString(7, paciente.getFechaNacimiento());
            
            retorno = parametro.executeUpdate();
            
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally{
            conexion.Closeconnection();
        }

        return retorno;

    }

}
