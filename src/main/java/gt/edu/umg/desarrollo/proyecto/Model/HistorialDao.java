
package gt.edu.umg.desarrollo.proyecto.Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


public class HistorialDao implements IHistorialDao{
    
        PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;

    @Override
    public DefaultTableModel GetHistorial() {
         DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select p.id_paciente id, p.nombre_paciente, t.tipo_examen, d.descripcion, m.nombre from pacientes p, tipo_examenes t, tipo_atenciones te, diagnosticos d, medicinas m group by p.nombre_paciente;";
            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre_paciente", "tipo_examen","descripcion", "nombre"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[6];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre_paciente");
                datos[2] = consulta.getString("tipo_examen");
                datos[3] = consulta.getString("descripcion");
                datos[4] = consulta.getString("nombre");
              

                table.addRow(datos);

              

            }

        } catch (SQLException e) {
            System.out.println("Error!!:" + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return table;
    
    }

    
    
    
}
