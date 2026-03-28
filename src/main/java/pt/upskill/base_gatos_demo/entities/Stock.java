package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Stock {
    @Id
    @GeneratedValue
    private long id;

    private String name;
    private int currentQuantity;
    private int lowQuantity;
    private String note; //ver se é preciso/se está no formulário
    private boolean lowStock = isLowStock();

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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getCurrentQuantity() {
        return currentQuantity;
    }

    public void setCurrentQuantity(int currentQuantity) {
        this.currentQuantity = currentQuantity;
    }

    public int getLowQuantity() {
        return lowQuantity;
    }

    public void setLowQuantity(int lowQuantity) {
        this.lowQuantity = lowQuantity;
    }

    public boolean isLowStock() {
        if(currentQuantity <= lowQuantity){
            return true;
        } else {
            return false;
        }
    }

    public void setLowStock(boolean lowStock) {
        this.lowStock = lowStock;
    }
}
