package model.repository.impl.employee;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.BaseRepository;
import model.repository.iemployee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String DELETE_EMPLOYEE = "delete from employee where employee_id = ?;";
    private static final String INSERT_EMPLOYEE_SQL = "insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username) values (?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from employee where employee_id = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set employee_name = ?, employee_birthday = ?, employee_id_card = ?, employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, position_id = ?,education_degree_id = ?,division_id = ?,username = ?;";
    private static final String SEARCH_EMPLOYEE_3_SQL = "select * from employee where employee_name like ? and position_id like ? and division_id like ?;";


    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String birthday = rs.getString("employee_birthday");
                String idCard = rs.getString("employee_id_card");
                double salary = rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String username = rs.getString("username");
                employeeList.add(new Employee(id, name,birthday,idCard,salary,phone,email,address,positionId,educationDegreeId,divisionId,username));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }

    @Override
    public boolean insertEmployee(Employee mployee) throws SQLException {
        return false;
    }

    @Override
    public Employee selectEmployee(int id) {
        return null;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return false;
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
