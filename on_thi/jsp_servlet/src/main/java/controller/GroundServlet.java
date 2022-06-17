package controller;

import model.Ground;
import model.Status;
import model.TypeOffice;
import service.GroundServiceImpl;
import service.IGroundService;

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

@WebServlet(name = "GroundServlet", urlPatterns = "/ground")
public class GroundServlet extends HttpServlet {

    IGroundService groundService = new GroundServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {

            switch (action) {
                case "create":
                    save(request, response);
                    break;
                case "edit":
                    updateGround(request, response);
                    break;
                case "delete":
                    break;
                case "search":
                    break;
                default:
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
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteGround(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
                default:
                    showList(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        //        List<Ground> groundList = groundService.selectAllGround();
//        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
//        List<Status> statusList = groundService.selectAllStatus();
//        request.setAttribute("groundList",groundList);
//        request.setAttribute("typeOfficeList",typeOfficeList);
//        request.setAttribute("statusList",statusList);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
//        dispatcher.forward(request,response);

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Ground> groundList = groundService.selectAllGround();
        List<Integer> listFloors = groundService.listFloors();
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        request.setAttribute("groundList", groundList);
        request.setAttribute("listFloors", listFloors);
        request.setAttribute("typeOfficeList", typeOfficeList);
        request.setAttribute("statusList", statusList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        List<Integer> listFloors = groundService.listFloors();
        request.setAttribute("typeOfficeList", typeOfficeList);
        request.setAttribute("statusList", statusList);
        request.setAttribute("listFloors", listFloors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void save(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String id = request.getParameter("id");
        double area = Double.parseDouble(request.getParameter("area"));
        int statusId = Integer.parseInt(request.getParameter("status"));
        int floors = Integer.parseInt(request.getParameter("floors"));
        int typeOfficeId = Integer.parseInt(request.getParameter("typeOffice"));
        String description = request.getParameter("description");
        double rentalPrice = Double.parseDouble(request.getParameter("rentalPrice"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Ground ground = new Ground(id, area, statusId, floors, typeOfficeId, description, rentalPrice, startDate, endDate);
        Map<String, String> error = groundService.insertGround(ground);
        List<Ground> groundList = groundService.selectAllGround();
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        List<Integer> listFloors = groundService.listFloors();
        RequestDispatcher dispatcher = null;
        if (error.isEmpty()) {
            request.setAttribute("message", "Thêm mới thành công");
            request.setAttribute("groundList", groundList);
            request.setAttribute("typeOfficeList", typeOfficeList);
            request.setAttribute("statusList", statusList);
            dispatcher = request.getRequestDispatcher("/view/list.jsp");
        } else {
            request.setAttribute("message", "Thêm mới không thành công");
            request.setAttribute("listFloors", listFloors);
            request.setAttribute("groundList", groundList);
            request.setAttribute("typeOfficeList", typeOfficeList);
            request.setAttribute("statusList", statusList);
            request.setAttribute("ground", ground);
            request.setAttribute("error", error);
            dispatcher = request.getRequestDispatcher("/view/create.jsp");
        }
        try {

            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void deleteGround(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String id = request.getParameter("id");
        boolean check = groundService.deleteGround(id);
        if (check) {
            request.setAttribute("message", "Xóa thành công");
        } else {
            request.setAttribute("message", "Xóa thất bại");
        }
        List<Ground> groundList = groundService.selectAllGround();
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        List<Integer> listFloors = groundService.listFloors();
        request.setAttribute("groundList", groundList);
        request.setAttribute("typeOfficeList", typeOfficeList);
        request.setAttribute("statusList", statusList);
        request.setAttribute("listFloors", listFloors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String typeOfficeSearch = request.getParameter("typeOfficeSearch");
        String floorsSearch = request.getParameter("floorsSearch");
        String priceSearch = request.getParameter("priceSearch");
        List<Ground> groundList = groundService.search(typeOfficeSearch, floorsSearch, priceSearch);
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        List<Integer> listFloors = groundService.listFloors();
        request.setAttribute("groundList", groundList);
        request.setAttribute("listFloors", listFloors);
        request.setAttribute("typeOfficeList", typeOfficeList);
        request.setAttribute("statusList", statusList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String id = request.getParameter("id");
        Ground ground = groundService.selectGround(id);
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        List<Integer> listFloors = groundService.listFloors();
        request.setAttribute("ground", ground);
        request.setAttribute("listFloors", listFloors);
        request.setAttribute("typeOfficeList", typeOfficeList);
        request.setAttribute("statusList", statusList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateGround(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        double area = Double.parseDouble(request.getParameter("area"));
        int statusId = Integer.parseInt(request.getParameter("status"));
        int floors = Integer.parseInt(request.getParameter("floors"));
        int typeOfficeId = Integer.parseInt(request.getParameter("typeOffice"));
        String description = request.getParameter("description");
        double rentalPrice = Double.parseDouble(request.getParameter("rentalPrice"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Ground ground = new Ground(id, area, statusId, floors, typeOfficeId, description, rentalPrice, startDate, endDate);
        List<TypeOffice> typeOfficeList = groundService.selectAllTypeOffice();
        List<Status> statusList = groundService.selectAllStatus();
        Map<String, String> error = groundService.updateGround(ground);
        if (error.isEmpty()) {
            request.setAttribute("message", "Chỉnh sửa thành công");
            List<Ground> groundList = groundService.selectAllGround();
            request.setAttribute("groundList", groundList);
            request.setAttribute("typeOfficeList", typeOfficeList);
            request.setAttribute("statusList", statusList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Chỉnh sửa không thành công");
            request.setAttribute("typeOfficeList", typeOfficeList);
            request.setAttribute("statusList", statusList);
            request.setAttribute("error", error);
            request.setAttribute("ground", ground);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
            dispatcher.forward(request, response);
        }


    }
}
