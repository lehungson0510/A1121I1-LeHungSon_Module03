package model.repository.impl.customer;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.icustomer.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    private static final String INSERT_CUSTOMER_SQL = "insert into customer(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) values (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?, customer_name  = ?, customer_birthday = ?, customer_gender = ?, customer_id_card = ?,customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;";
    private static final String SEARCH_CUSTOMER_3_SQL = "select * from customer where customer_name like ? and customer_address like ? and customer_type_id like ?;";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_id");
                int customerTypeId = rs.getInt("customer_type_id");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                int customerGender = rs.getInt("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");
                customerList.add(new Customer(id, customerTypeId, customerName, customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }

    @Override
    public boolean insertUser(Customer customer) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            int check = preparedStatement.executeUpdate();
            if (check != 0) {
                return true;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int customerTypeId = rs.getInt("customer_type_id");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                int customerGender = rs.getInt("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");
                customer = new Customer(customerTypeId,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerId());
            System.out.println(preparedStatement);
            int check = preparedStatement.executeUpdate();
            if (check != 0) {
                return true;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Customer> search(String name, String type , String address) {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_3_SQL);) {
             preparedStatement.setString(1,"%" + name +"%");
             preparedStatement.setString(2,"%" + address +"%");
             preparedStatement.setString(3,"%" + type +"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_id");
                int customerTypeId = rs.getInt("customer_type_id");
                String customerName = rs.getString("customer_name");
                String customerBirthday = rs.getString("customer_birthday");
                int customerGender = rs.getInt("customer_gender");
                String customerIdCard = rs.getString("customer_id_card");
                String customerPhone = rs.getString("customer_phone");
                String customerEmail = rs.getString("customer_email");
                String customerAddress = rs.getString("customer_address");
                customerList.add(new Customer(id, customerTypeId, customerName, customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
