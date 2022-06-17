package service;

import model.Category;
import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Category> selectAllCategory() {
        return productRepository.selectAllCategory();
    }

    @Override
    public List<Product> selectAllProduct() {
        return productRepository.selectAllProduct();
    }

    @Override
    public boolean insertProduct(Product product) {
        return productRepository.insertProduct(product);
    }

    @Override
    public Product selectProduct(int id) {
        return productRepository.selectProduct(id);
    }

    @Override
    public boolean updateProduct(Product product) {
        return productRepository.updateProduct(product);
    }

    @Override
    public List<Product> searchProduct(String name) {
        return productRepository.searchProduct(name);
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return productRepository.deleteProduct(id);
    }
}
