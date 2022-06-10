package model.repository.iemployee;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();

    public boolean insertEmployee(Employee mployee) throws SQLException;

    public Employee selectEmployee(int id);

    public boolean updateEmployee(Employee employee) throws SQLException;

    public boolean deleteEmployee(int id) throws SQLException;

    public List<Employee> search(String name, String position , String division);
}
