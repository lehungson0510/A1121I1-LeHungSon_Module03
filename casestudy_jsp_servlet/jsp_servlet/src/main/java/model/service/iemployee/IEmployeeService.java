package model.service.iemployee;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();

    public Map<String, String> insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int id);

    public Map<String, String> updateEmployee(Employee employee) throws SQLException;

    public boolean deleteEmployee(int id) throws SQLException;

    public List<Employee> search(String name, String position , String division);
}
