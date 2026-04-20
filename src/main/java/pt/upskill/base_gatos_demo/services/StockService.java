package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Stock;
import pt.upskill.base_gatos_demo.models.CreateStockModel;
import pt.upskill.base_gatos_demo.models.EditStockModel;
import pt.upskill.base_gatos_demo.repositories.StockRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

    public List<Stock> getLowStockItems() {
        List<Stock> lowStockItems = new ArrayList<>();
        for (Stock item : stockRepository.findAll()) {
            if(item.isLowStock()) {
                lowStockItems.add(item);
            }
        }
        return lowStockItems;
    }

    public List<Stock> getPendingRequests() {  // Fernanda add para aparecer o stock q os Voluntários solicitaram
        return stockRepository.findAll().stream()
                .filter(item -> item.getStockNote() != null && item.getStockNote().startsWith("PEDIDO DE REPOSIÇÃO:"))
                .collect(Collectors.toList());
    }

    public List<Stock> getAllProducts(String productTypeFilter, String tagFilter) {
        List<Stock> allProducts = new ArrayList<>();
        if((productTypeFilter == null || productTypeFilter.isEmpty()) && (tagFilter == null || tagFilter.isEmpty())) {
            allProducts = stockRepository.findAll();
        } else if ((productTypeFilter == null || productTypeFilter.isEmpty()) && tagFilter != null && !tagFilter.isEmpty()) {
            allProducts = stockRepository.findByTag(tagFilter);
        } else if (productTypeFilter != null && !productTypeFilter.isEmpty() && tagFilter != null && !tagFilter.isEmpty()) {
            allProducts = stockRepository.findByProductTypeContainingIgnoreCaseAndTag(productTypeFilter, tagFilter);
        } else if (productTypeFilter != null && !productTypeFilter.isEmpty() && (tagFilter == null || tagFilter.isEmpty())) {
            allProducts = stockRepository.findByProductTypeContainingIgnoreCase(productTypeFilter);
        }
        return allProducts;
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

    public void useStock(Long id, int value) {
        Stock stock = getById(id);
        if (value <= 0) {
            throw new IllegalArgumentException("Valor inválido");
        }
        if (stock.getCurrentQuantity() - value < 0) {
            throw new IllegalArgumentException("Stock insuficiente");
        }
        stock.setCurrentQuantity(stock.getCurrentQuantity() - value);
        stock.setUpdatedAt(LocalDateTime.now());
        stock.setLowStock(stock.isLowStock());
        stockRepository.save(stock);
    }

    public List<String> getTags() {
        List<String> tags = new ArrayList<>();
        for(Stock stock : stockRepository.findAll()) {
            if(!tags.contains(stock.getTag())) {
                tags.add(stock.getTag());
            }
        }
        return tags;
    }

    public void requestStock(String productType, int quantity, String observations) {
        List<Stock> products = stockRepository.findByProductTypeContainingIgnoreCase(productType);

        if (!products.isEmpty()) {
            Stock stock = products.get(0);
            String notaFormatada = "PEDIDO DE REPOSIÇÃO: " + quantity + " unidades. Motivo: " + observations;

            stock.setStockNote(notaFormatada);
            stock.setUpdatedAt(LocalDateTime.now());

            stockRepository.save(stock);
        }
    }
}
