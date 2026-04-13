package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

@Entity
public class Stock {
    @Id
    @GeneratedValue
    private long id;

    private String productType;
    private int currentQuantity;
    private int lowQuantity;
    private String stockNote; //ver se é preciso/se está no formulário
    private boolean lowStock = isLowStock();
    private String measureUnit; //litros, kg, sacos, doses, etc.
    private String tag;
    private LocalDateTime updatedAt;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String name) {
        this.productType = productType;
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

    public String getStockNote() {
        return stockNote;
    }

    public void setStockNote(String stockNote) {
        this.stockNote = stockNote;
    }

    public String getMeasureUnit() {
        return measureUnit;
    }

    public void setMeasureUnit(String measureUnit) {
        this.measureUnit = measureUnit;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
