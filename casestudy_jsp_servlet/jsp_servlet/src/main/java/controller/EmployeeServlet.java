package controller;

import model.bean.*;
import model.service.iemployee.IDivisionService;
import model.service.iemployee.IEducationDegreeService;
import model.service.iemployee.IEmployeeService;
import model.service.iemployee.IPositionService;
import model.service.impl.employee.DivisionService;
import model.service.impl.employee.EducationDegreeService;
import model.service.impl.employee.EmployeeService;
import model.service.impl.employee.PositionService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService;
    private IPositionService positionService;
    private IEducationDegreeService educationDegreeService;
    private IDivisionService divisionService;

    public void init(){
        employeeService = new EmployeeService();
        positionService = new PositionService();
        educationDegreeService = new EducationDegreeService();
        divisionService = new DivisionService();
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
                deleteEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            case "sort":
                listEmployeeSorted(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listEmployeeSorted(HttpServletRequest request, HttpServletResponse response) {
    }

}
