package model.repository.impl.impl;

import model.bean.Product;
import model.repository.impl.IProductRepository;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    public static List<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Apple pie", 50, 1));
        products.add(new Product(2, "Cheesecake", 60, 2));
        products.add(new Product(3, "Ice-scream", 70, 5));
        products.add(new Product(4, "Cocktail", 450, 3));
        products.add(new Product(5, "Juice", 35, 4));
        products.add(new Product(6, "Tea", 200, 8));

    }


    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public Product findByName(String name) {
        for (int i = 0; i < products.size(); i++) {
            if (name.equalsIgnoreCase(products.get(i).getName())) {
                return products.get(i);
            }
        }
        return null;
    }

    @Override
    public Product findById(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (id == products.get(i).getId()) {
                return products.get(i);
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (id == products.get(i).getId()) {
                products.set(i, product);
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (id == products.get(i).getId()) {
                products.remove(i);
            }
        }
    }
}
