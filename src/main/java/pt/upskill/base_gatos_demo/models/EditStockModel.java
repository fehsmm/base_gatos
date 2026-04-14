package pt.upskill.base_gatos_demo.models;

import java.time.LocalDateTime;

public class EditStockModel {

    private Long id;

    private String productType;
    private int currentQuantity;
    private int lowQuantity;
    private String stockNote; //ver se é preciso/se está no formulário
    private String measureUnit;
    private String tag;
    private LocalDateTime updatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
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
