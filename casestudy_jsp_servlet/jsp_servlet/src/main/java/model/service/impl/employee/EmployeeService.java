package model.service.impl.employee;

import common.Validation;
import model.bean.Employee;
import model.repository.iemployee.IEmployeeRepository;
import model.repository.impl.employee.EmployeeRepository;
import model.service.iemployee.IEmployeeService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    public IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public Map<String, String> insertEmployee(Employee employee) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkIdCard(employee.getEmployeeIdCard())) {
            map.put("idCard", "ID Card không đúng định dạng (gồm 9 hoặc 12 số)");
        }
        if (!Validation.checkEmail(employee.getEmployeeEmail())) {
            map.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkPhone(employee.getEmployeePhone())){
            map.put("phone","Số điện thoại không đúng định dạng");
        }
        if (!Validation.checkNumber((float) employee.getEmployeeSalary())){
            map.put("salary","Lương phải lớn hơn 0");
        }
//        if (!Validation.checkDate(employee.getEmployeeBirthday())){
//            map.put("birthday","Ngày sinh không đúng định dạng");
//        }
        if (map.isEmpty()) {
            employeeRepository.insertEmployee(employee);
        }
        return map;
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public Map<String, String> updateEmployee(Employee employee) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkIdCard(employee.getEmployeeIdCard())) {
            map.put("idCard", "ID Card không đúng định dạng (gồm 9 hoặc 12 số)");
        }
        if (!Validation.checkEmail(employee.getEmployeeEmail())) {
            map.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkPhone(employee.getEmployeePhone())){
            map.put("phone","Số điện thoại không đúng định dạng");
        }
        if (!Validation.checkNumber((float) employee.getEmployeeSalary())){
            map.put("salary","Lương phải lớn hơn 0");
        }
//        if (!Validation.checkDate(employee.getEmployeeBirthday())){
//            map.put("birthday","Ngày sinh không đúng định dạng");
//        }
        if (map.isEmpty()) {
            employeeRepository.updateEmployee(employee);
        }
        return map;
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
