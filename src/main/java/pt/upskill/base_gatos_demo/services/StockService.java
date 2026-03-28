package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Stock;
import pt.upskill.base_gatos_demo.repositories.StockRepository;

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

    /*public void updateStock(UpdateStockModel model) {
        Stock stock = getById(model.getId());
        stock.setQuantity(model.getQuantity());
        stockRepository.save(stock);
    }

    public void deleteCat(StockModel model) {
        Stock stock = getById(model.getId());
        stockRepository.delete(stock);
    }

    public void createStock(StockModel model) {
        Stock stock = new Stock();
        stock.setName(model.getName());
        stockRepository.save(stock);
    }

    public void addStock(StockModel model) {
        Stock stock = getById(model.getId());
        stock.getQuantity();
    }*/
}
