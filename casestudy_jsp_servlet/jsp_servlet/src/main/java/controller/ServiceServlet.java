package controller;

import model.bean.*;
import model.service.iservice.IRentTypeService;
import model.service.iservice.IServiceService;
import model.service.iservice.IServiceTypeService;
import model.service.impl.service.RentTypeService;
import model.service.impl.service.ServiceService;
import model.service.impl.service.ServiceTypeService;

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

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    private IServiceService serviceService;
    private IServiceTypeService serviceTypeService;
    private IRentTypeService rentTypeService;

    public void init() {
        serviceService = new ServiceService();
        serviceTypeService = new ServiceTypeService();
        rentTypeService = new RentTypeService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertService(request, response);
                    break;
                case "edit":
                    updateService(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
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
                deleteService(request, response);
                break;
            case "search":
                searchService(request, response);
                break;
            case "sort":
                listUserSorted(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList = serviceService.selectAllService();
        List<ServiceType> serviceTypeList = serviceTypeService.selectAllServiceType();
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        dispatcher.forward(request, response);
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ServiceType> serviceTypeList = serviceTypeService.selectAllServiceType();
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("serviceTypeList", serviceTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        double area = Double.parseDouble(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int serviceType = Integer.parseInt(request.getParameter("type"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numOfFloors"));
        List<ServiceType> serviceTypeList = serviceTypeService.selectAllServiceType();
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        request.setAttribute("serviceTypeList", serviceTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        Service service = new Service(name, area, cost, maxPeople, rentTypeId, serviceType, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
        Map<String, String> error = serviceService.insertService(service);
        if (error.isEmpty()) {
            request.setAttribute("message", "Service was Added");
        } else {
            request.setAttribute("message", "Unsuccessful");
            request.setAttribute("error", error);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/create.jsp");
        dispatcher.forward(request, response);
    }


    private void updateService(HttpServletRequest request, HttpServletResponse response) {
    }

    private void listUserSorted(HttpServletRequest request, HttpServletResponse response) {
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
    }

}
