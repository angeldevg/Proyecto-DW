package gt.edu.umg.desarrollo.proyecto.Model;

import javax.swing.table.DefaultTableModel;


public interface IInventoryDao {
    
    public int AddMedicine(MedicineEntity medicina);
    public DefaultTableModel GetMedicine();
    public int UpdateMedicine(MedicineEntity medicina);
    public int DeleteMedicine(int idInventario);
    public DefaultTableModel GetInventory();
    
}
