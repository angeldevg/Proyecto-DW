
package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class MedicineDao implements IMedicineDao{
    
    Conexion conexion;
    ResultSet consulta;

    @Override
    public HashMap Getmedicine() {
        
        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select id_medicina id, nombre from medicinas order by nombre asc;";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("id"), consulta.getString("nombre"));
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }finally{
            conexion.Closeconnection();
        }

        return drop;
    }
        
        
    }

    
    

