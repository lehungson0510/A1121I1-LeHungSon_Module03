package model.service.impl.customer;

import common.Validation;
import model.bean.Customer;
import model.repository.icustomer.ICustomerRepository;
import model.repository.impl.customer.CustomerRepository;
import model.service.icustomer.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    public ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public Map<String, String> insertCustomer(Customer customer) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkIdCard(customer.getCustomerIdCard())) {
            map.put("idCard", "ID Card không đúng định dạng (gồm 9 hoặc 12 số)");
        }
        if (!Validation.checkEmail(customer.getCustomerEmail())) {
            map.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkPhone(customer.getCustomerPhone())){
            map.put("phone","Số điện thoại không đúng định dạng");
        }
//        if (!Validation.checkDate(customer.getCustomerBirthday())){
//            map.put("birthday","Ngày sinh không đúng định dạng");
//        }
        if (map.isEmpty()) {
            customerRepository.insertUser(customer);
        }
        return map;
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public Map<String, String> updateCustomer(Customer customer) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkIdCard(customer.getCustomerIdCard())) {
            map.put("idCard", "ID Card không đúng định dạng (gồm 9 hoặc 12 số)");
        }
        if (!Validation.checkEmail(customer.getCustomerEmail())) {
            map.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkPhone(customer.getCustomerPhone())){
            map.put("phone","Số điện thoại không đúng định dạng");
        }
//        if (!Validation.checkDate(customer.getCustomerBirthday())){
//            map.put("birthday","Ngày sinh không đúng định dạng");
//        }
        if (map.isEmpty()) {
            customerRepository.updateCustomer(customer);
        }
        return map;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> search(String name, String type, String address) {
        return customerRepository.search(name, type, address);
    }
}
