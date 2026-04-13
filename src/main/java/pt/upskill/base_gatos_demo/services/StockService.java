package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Stock;
import pt.upskill.base_gatos_demo.models.CreateStockModel;
import pt.upskill.base_gatos_demo.models.EditStockModel;
import pt.upskill.base_gatos_demo.repositories.StockRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class StockService {

    @Autowired
    StockRepository stockRepository;

    public Stock getById(Long id) {
        return stockRepository.getReferenceById(id);
    }

    public int countLowStockItems() {
        int lowStockItems = 0;
        for(Stock item : stockRepository.findAll()) {
            if(item.isLowStock()) {
                lowStockItems++;
            }
        }
        return lowStockItems;
    }

    public List<Stock> getAllProducts() {
        return stockRepository.findAll();
    }

    public void updateStock(EditStockModel model) {
        Stock stock = getById(model.getId());
        stock.setProductType(model.getProductType());
        stock.setCurrentQuantity(model.getCurrentQuantity());
        stock.setStockNote(model.getStockNote());
        stock.setTag(model.getTag());
        stock.setMeasureUnit(model.getMeasureUnit());
        stock.setLowQuantity(model.getLowQuantity());
        stock.setUpdatedAt(LocalDateTime.now());
        stock.setLowStock(stock.isLowStock());
        stockRepository.save(stock);
    }

    public void deleteStock(Long id) {
        stockRepository.deleteById(id);
    }

    public void createStock(CreateStockModel model) {
        Stock stock = new Stock();
        stock.setProductType(model.getProductType());
        stock.setCurrentQuantity(model.getCurrentQuantity());
        stock.setLowQuantity(model.getLowQuantity());
        stock.setStockNote(model.getStockNote());
        stock.setMeasureUnit(model.getMeasureUnit());
        stock.setTag(model.getTag());
        stock.setLowStock(stock.isLowStock());
        stockRepository.save(stock);
    }

    public void removeStock(Long id, int value) {
        Stock stock = getById(id);
        stock.setCurrentQuantity(stock.getCurrentQuantity() - value);
        stock.setUpdatedAt(LocalDateTime.now());
        stock.setLowStock(stock.isLowStock());
        stockRepository.save(stock);
    }
}
