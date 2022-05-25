package model.repository.impl;

import model.bean.Product;

import java.util.List;

//findAll(): Trả về danh sách tất cả sản phẩm
//        save(): Lưu một sản phẩm
//        findById(): Tìm một sản phẩm theo id
//        findByName(): Tìm một sản phẩm theo tên
//        update(): Cập nhật thông tin của một sản phẩm
//        remove(): Xoá một sản phẩm khỏi danh sách

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    Product findByName(String name);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}

