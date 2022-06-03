package controller;

import model.bean.User;
import model.service.IUserService;
import model.service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;

    public void init() {
        userService = new UserService();
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
                    deleteUser(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;
                case "sort":
                    listUserSorted(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
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
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userService.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void listUserSorted(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String sortProperty = request.getParameter("sortProperty");
        List<User> listUser = userService.selectAllUser();
        listUser = userService.sort(sortProperty);
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        boolean check = userService.insertUserStore(newUser);
        if (check) {
            request.setAttribute("message", "User was Added");
        } else {
            request.setAttribute("message", "Unsuccessful");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User book = new User(id, name, email, country);
        boolean flag = userService.updateUser(book);
        if (flag) {
            request.setAttribute("message", "User information was updated");
        } else {
            request.setAttribute("message", "Unsuccessful");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean flag = userService.deleteUser(id);
        if (flag) {
            request.setAttribute("message", "User was Deleted");
        } else {
            request.setAttribute("message", "Unsuccessful");
        }
        List<User> listUser = userService.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/list.jsp");
        dispatcher.forward(request, response);
//        response.sendRedirect("/users");
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String country = request.getParameter("country");
        List<User> userList = userService.selectUserByCountry(country);
        RequestDispatcher dispatcher;
        if (userList.isEmpty()) {
            request.setAttribute("message", "Country not found");
            listUser(request, response);
            dispatcher = request.getRequestDispatcher("view/user/list.jsp");

        } else {
//            ****************** Trả về hết danh sách hiện có *************************
            List<User> listUser = userService.selectAllUser();
            request.setAttribute("listUser", listUser);

//            ********************** Trả về list search ********************************
            request.setAttribute("userList", userList);
            dispatcher = request.getRequestDispatcher("view/user/list.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
