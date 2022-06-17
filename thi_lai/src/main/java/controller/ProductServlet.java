package controller;

import model.Category;
import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

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

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        try {
        switch (action) {
            case "create":
                save(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                break;
        }
//        } catch (SQLException ex) {
//            throw new ServletException(ex);
//        }

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
//                showEditForm(request,response);
                break;
            case "delete":
                delete(request, response);
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
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = productService.deleteProduct(id);
        if (check) {
            request.setAttribute("message", "Xóa thành công");
        } else {
            request.setAttribute("message", "Xóa thất bại");
        }
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = productService.selectAllCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
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
        String nameSearch = request.getParameter("nameSearch");
        List<Product> productList = productService.searchProduct(nameSearch);
        List<Category> categoryList = productService.selectAllCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = productService.searchProduct(id);
//        List<Category> categoryList = productService.selectAllCategory();
//        request.setAttribute("product", product);
//        request.setAttribute("categoryList", categoryList);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(id, name, price, quantity, color, description, categoryId);
        List<Category> categoryList = productService.selectAllCategory();
        List<Product> productList = productService.selectAllProduct();
        boolean check = productService.updateProduct(product);
        RequestDispatcher dispatcher = null;
        if (check) {
            request.setAttribute("message", "Chỉnh sửa thành công");
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("productList", productList);
            dispatcher = request.getRequestDispatcher("/view/list.jsp");
        } else {
            request.setAttribute("message", "Chỉnh sửa không thànhcông");
            request.setAttribute("product", product);
            request.setAttribute("categoryList", categoryList);
            dispatcher = request.getRequestDispatcher("/view/edit.jsp");
        }
        try {

            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = productService.selectAllCategory();
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(name, price, quantity, color, description, categoryId);
        List<Category> categoryList = productService.selectAllCategory();
        boolean check = productService.insertProduct(product);
        List<Product> productList = productService.selectAllProduct();
        RequestDispatcher dispatcher = null;
        if (check) {
            request.setAttribute("message", "Thêm mới thành công");
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("productList", productList);
            dispatcher = request.getRequestDispatcher("/view/list.jsp");
        } else {
            request.setAttribute("message", "Thêm mới không thành công");
            request.setAttribute("categoryList", categoryList);
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


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = productService.selectAllCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
