package model.service.impl.employee;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.iemployee.IEmployeeRepository;
import model.repository.impl.employee.EmployeeRepository;
import model.service.iemployee.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    public IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        return employeeRepository.insertEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> search(String name, String position, String division) {
        return employeeRepository.search(name,position,division);
    }
}
