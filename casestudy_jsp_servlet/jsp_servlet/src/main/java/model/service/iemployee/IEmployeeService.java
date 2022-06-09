package model.service.iemployee;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();

    public boolean insertEmployee(Employee mployee) throws SQLException;

    public Employee selectEmployee(int id);

    public boolean updateEmployee(Employee employee) throws SQLException;

    public boolean deleteEmployee(int id) throws SQLException;
}
