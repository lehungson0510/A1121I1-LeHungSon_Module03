package model.service.impl.customer;

import model.bean.Customer;
import model.repository.icustomer.ICustomerRepository;
import model.repository.impl.customer.CustomerRepository;
import model.service.icustomer.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService {
    public ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        return customerRepository.insertUser(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> search(String name, String type, String address) {
        return customerRepository.search(name,type,address);
    }
}
