package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

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
        } finally {
            conexion.Closeconnection();
        }

        return retorno;

    }

    @Override
    public DefaultTableModel GetPatient() {
        DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select id_paciente as id, nombre_paciente,  cui, direccion, telefono_paciente, telefono_familiar, fecha_nacimiento, no_carne from pacientes;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre_paciente", "cui", "direccion", "telefono_paciente", "telefono_familiar", "fecha_nacimineto", "no_carne"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[8];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre_paciente");
                datos[2] = consulta.getString("cui");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono_paciente");
                datos[5] = consulta.getString("telefono_familiar");
                datos[6] = consulta.getString("fecha_nacimiento");
                datos[7] = consulta.getString("no_carne");

                table.addRow(datos);

                System.out.println(consulta.getString("id"));

            }

        } catch (SQLException e) {
            System.out.println("Error!!:" + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return table;
    }
    
    

    @Override
    public int UpdatePatient(PacienteEntity paciente) {
    
        int retorno = 0;

        conexion = new Conexion();

        try {

            String query = "update pacientes set no_carne = ?, nombre_paciente = ?, cui = ?, telefono_paciente = ?, telefono_familiar = ?, direccion = ?, fecha_nacimiento = ? where id_paciente = ?;";

            conexion.OpenConnection();

            parametro = (PreparedStatement) conexion.conexionBD.prepareStatement(query);

            parametro.setString(1, paciente.getCarne());
            parametro.setString(2, paciente.getNombre());
            parametro.setLong(3, paciente.getDpi());
            parametro.setInt(4, paciente.getTelefono());
            parametro.setInt(5, paciente.getTlefonoFamiliar());
            parametro.setString(6, paciente.getDireccion());
            parametro.setString(7, paciente.getFechaNacimiento());
            parametro.setInt(8, paciente.getIdPaciente());
            
            //-----------------------------------------------
            //Debuggin
            retorno = parametro.executeUpdate();
            
            System.out.println(retorno);
            System.out.println(paciente.getCarne());
            System.out.println(paciente.getNombre());
            System.out.println(paciente.getDpi());
            System.out.println(paciente.getTelefono());
            System.out.println(paciente.getTlefonoFamiliar());
            System.out.println(paciente.getDireccion());
            System.out.println(paciente.getFechaNacimiento());
            System.out.println(paciente.getIdPaciente());
            
            //----------------------------------------------------------
            

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;
    }
    
    

    @Override
    public int DeletePatient(int idPaciente) {
        
        int retorno = 0;

        try {
            conexion = new Conexion();
            
            String query = "delete from pacientes where id_paciente = ? ;";
            
            conexion.OpenConnection();
            
            parametro = (PreparedStatement)conexion.conexionBD.prepareStatement(query);
            
            parametro.setInt(1, idPaciente);
            
            retorno = parametro.executeUpdate();

            System.out.println(retorno);

        } catch (SQLException e) {
            System.out.println("Error!!!: " + e.getMessage());
        }finally{
            conexion.Closeconnection();
        }
        
        return retorno;
        

    }
    
    

}
