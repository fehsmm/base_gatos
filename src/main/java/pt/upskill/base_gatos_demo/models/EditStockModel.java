package pt.upskill.base_gatos_demo.models;

public class EditStockModel {

    private long id;

    private String name;
    private int quantity;
    private static int lowStock;
    private String note;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public static int getLowStock() {
        return lowStock;
    }

    public static void setLowStock(int lowStock) {
        EditStockModel.lowStock = lowStock;
    }
}
