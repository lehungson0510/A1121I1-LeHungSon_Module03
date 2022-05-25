package model.service.impl;

import model.bean.Product;
import model.repository.impl.IProductRepository;
import model.repository.impl.impl.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    public static IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product customer) {
        productRepository.save(customer);
    }

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(int id, Product customer) {
        productRepository.update(id, customer);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }
}
