package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class PuestoDao implements IPuestoDao{
    
    Conexion conexion;
    ResultSet consulta;
    
    @Override
    public HashMap ReadPuesto() {
        
        HashMap<String, String> drop =  new HashMap();
        
        try {
            conexion = new Conexion();
            
            String query = "select id_tipo_empleado as id, puesto from tipo_empleados;"; 
            
            conexion.OpenConnection();
            
            consulta = conexion.conexionBD.createStatement().executeQuery(query);
            
            while(consulta.next()) {
                
                drop.put(consulta.getString("id"), consulta.getString("puesto"));
            }
            
        } catch (SQLException ex){
            System.out.println("Errro: " + ex.getMessage());
        }finally{
            conexion.Closeconnection();
        }

        return drop;
    }
    
    

}
