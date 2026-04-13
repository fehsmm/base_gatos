package pt.upskill.base_gatos_demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.base_gatos_demo.entities.Stock;

import java.util.List;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

    List<Stock> findByProductTypeContainingIgnoreCase (String productType);

    List<Stock> findByProductTypeContainingIgnoreCaseAndTag (String productType, String tag);

    List<Stock> findByTag (String tag);



}
