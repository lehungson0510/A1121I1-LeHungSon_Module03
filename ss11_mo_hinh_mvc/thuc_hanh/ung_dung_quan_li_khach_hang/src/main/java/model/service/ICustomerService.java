package model.service;

import model.bean.Customer;

import java.util.List;


//findAll(): Trả về danh sách tất cả khách hàng
//        save(): Lưu một khách hàng
//        findById(): Tìm một khách hàng theo Id
//        update(): Cập nhật thông tin của một khách hàng
//        remove(): Xoá một khách hàng khỏi danh sách
public interface ICustomerService {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id);
}
