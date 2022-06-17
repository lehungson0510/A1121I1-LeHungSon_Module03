package service;

import model.Category;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    public List<Category> selectAllCategory();
    public List<Product> selectAllProduct();
    public boolean insertProduct(Product product);
    public Product selectProduct(int id);
    public boolean updateProduct(Product product);
    public List<Product> searchProduct(String name);
    public boolean deleteProduct(int id) throws SQLException;
}
