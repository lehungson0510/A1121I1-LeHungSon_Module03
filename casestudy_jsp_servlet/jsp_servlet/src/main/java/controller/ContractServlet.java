package controller;

import model.bean.*;
import model.service.icontract.IContractService;
import model.service.icustomer.ICustomerService;
import model.service.iemployee.IEmployeeService;
import model.service.impl.contract.ContractService;
import model.service.impl.customer.CustomerService;
import model.service.impl.employee.EmployeeService;
import model.service.impl.service.ServiceService;
import model.service.iservice.IServiceService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {

    private IContractService contractService;
    private IServiceService serviceService;
    private IEmployeeService employeeService;
    private ICustomerService customerService;

    public void init() {
        contractService = new ContractService();
        serviceService = new ServiceService();
        employeeService = new EmployeeService();
        customerService = new CustomerService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteContract(request, response);
                break;
            case "search":
                searchContract(request, response);
                break;
            case "sort":
                listContactSorted(request, response);
                break;
            default:
                listContract(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertContract(request, response);
                    break;
                case "edit":
                    updateContract(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }



    private void listContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = contractService.selectAllContract();
        List<Service> serviceList = serviceService.selectAllService();
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("contractList", contractList);
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        dispatcher.forward(request, response);

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList = serviceService.selectAllService();
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
        int employee = Integer.parseInt(request.getParameter("employee"));
        int customer = Integer.parseInt(request.getParameter("customer"));
        int service = Integer.parseInt(request.getParameter("service"));
        Contract contract = new Contract(startDate,endDate,deposit,totalMoney,employee,customer,service);
        List<Service> serviceList = serviceService.selectAllService();
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);
        Map<String, String> error = contractService.insertContract(contract);
        if (error.isEmpty()) {
            request.setAttribute("message", "Contract was Added");
        } else {
            request.setAttribute("message", "Unsuccessful");
            request.setAttribute("error", error);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateContract(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void deleteContract(HttpServletRequest request, HttpServletResponse response) {
    }

    private void searchContract(HttpServletRequest request, HttpServletResponse response) {
    }

    private void listContactSorted(HttpServletRequest request, HttpServletResponse response) {
    }


}
