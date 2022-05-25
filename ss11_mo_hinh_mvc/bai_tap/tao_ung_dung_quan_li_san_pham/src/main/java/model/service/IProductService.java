package model.service;

import model.bean.Product;

import java.util.List;


//findAll(): Trả về danh sách tất cả khách hàng
//        save(): Lưu một khách hàng
//        findById(): Tìm một khách hàng theo Id
//        update(): Cập nhật thông tin của một khách hàng
//        remove(): Xoá một khách hàng khỏi danh sách
public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findByName(String name);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}
