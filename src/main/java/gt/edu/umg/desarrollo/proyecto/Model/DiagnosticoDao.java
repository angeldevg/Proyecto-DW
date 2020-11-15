package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DiagnosticoDao implements IDiagnosticoDao{
    
    
    
    Conexion conexion;
    ResultSet consulta;
    PreparedStatement parametro;  
    
    

    @Override
    public int AddDescription(DiagnosticoEntity diag) {
   
        int retorno = 0;

        conexion = new Conexion();

        try {
            String query = "insert into diagnosticos(id_paciente, descripcion, id_medicina, fecha_diagnostico) values (?, ?, ?, ?);";

            conexion.OpenConnection();

            parametro = conexion.conexionBD.prepareStatement(query);

            parametro.setInt(1, diag.getIdPaciente());
            parametro.setString(2, diag.getDescripcion());
            parametro.setInt(3, diag.getIdMedicina());
            parametro.setString(4, diag.getFecha());
            retorno = parametro.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;

   
    }
    
    
    
}
