package model.repository.icustomer;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();

    public boolean insertUser(Customer customer) throws SQLException;

    public Customer selectCustomer(int id);

    public boolean updateCustomer(Customer customer) throws SQLException;

    public boolean deleteCustomer(int id) throws SQLException;

    public List<Customer> search(String name, String type, String address);
}
