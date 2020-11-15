package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class InventoryDao implements IInventoryDao {
    
    PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;


    @Override
    public int AddMedicine(MedicineEntity medicina) {
        
        int retorno = 0;

        conexion = new Conexion();

        try {
            String query = "insert into lote_medicina(proveedor, existencias, fecha_vencimiento, fecha_ingreso, id_medicina) values (?, ?, ?, CURDATE(), ?);";

            conexion.OpenConnection();

            parametro = conexion.conexionBD.prepareStatement(query);

            parametro.setString(1, medicina.getProveedor());
            parametro.setInt(2, medicina.getCantidad());
            parametro.setString(3, medicina.getFechaVencimiento());
            parametro.setInt(4, medicina.getIdMedicine());


            retorno = parametro.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return retorno;
    }

    @Override
    public DefaultTableModel GetMedicine() {
        
        DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select  l.id_lote as id, m.nombre, l.proveedor, l.existencias, l.fecha_vencimiento, l.fecha_ingreso, m.id_medicina from lote_medicina as l inner join medicinas as m on l.id_medicina = m.id_medicina order by l.id_lote desc;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre", "proveedor", "existencias", "fecha_vencimiento", "fecha_ingreso", "id_medicina"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[7];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre");
                datos[2] = consulta.getString("proveedor");
                datos[3] = consulta.getString("existencias");
                datos[4] = consulta.getString("fecha_vencimiento");
                datos[5] = consulta.getString("fecha_ingreso");
                datos[6] = consulta.getString("id_medicina");

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
    public int UpdateMedicine(MedicineEntity medicina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int DeleteMedicine(int idInventario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    

    @Override
    public DefaultTableModel GetInventory(){
        
        
         DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select m.id_medicina id, m.nombre, l.proveedor, l.fecha_vencimiento, sum(l.existencias)existencias, m.imagen from medicinas m, lote_medicina l where m.id_medicina =  l.id_medicina group by m.id_medicina, m.nombre;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id","nombre", "proveedor", "fecha_vencimiento", "existencias", "imagen"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[6];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre");
                datos[2] = consulta.getString("proveedor");
                datos[3] = consulta.getString("fecha_vencimiento");
                datos[4] = consulta.getString("existencias");
                datos[5] = consulta.getString("imagen");
              

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

}
