package pt.upskill.base_gatos_demo.models;

import pt.upskill.base_gatos_demo.entities.Stock;

public class CreateStockModel {

    private String name;
    private int quantity;
    private static int lowStock;
    private String note;

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
        CreateStockModel.lowStock = lowStock;
    }
}
