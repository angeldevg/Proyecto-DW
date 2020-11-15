package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class MenuDao implements IMenuDao{

    Conexion conexion;
    ResultSet consulta;

    
    //Menu Acceso a Datos
    @Override
    public HashMap ReadMEnu() {

        HashMap<String, String> drop = new HashMap();

        try {
            conexion = new Conexion();

            String query = "select ruta, nombre from menu";

            conexion.OpenConnection();

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            while (consulta.next()) {

                drop.put(consulta.getString("ruta"), consulta.getString("nombre"));
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }finally{
            conexion.Closeconnection();
        }

        return drop;
    }


}
