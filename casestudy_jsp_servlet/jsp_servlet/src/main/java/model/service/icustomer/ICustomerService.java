package model.service.icustomer;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    public Map<String, String> insertCustomer(Customer customer) throws SQLException;

    public Customer selectCustomer(int id);

    public Map<String, String> updateCustomer(Customer customer) throws SQLException;

    public boolean deleteCustomer(int id) throws SQLException;

    public List<Customer> search(String name, String type, String address);
}
