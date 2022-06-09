package model.service.icustomer;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    public boolean insertCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(int id);

    public boolean updateCustomer(Customer customer) throws SQLException;

    public boolean deleteCustomer(int id) throws SQLException;

    public List<Customer> search(String name, String type, String address);
}
