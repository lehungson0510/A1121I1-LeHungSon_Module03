package controller;

import model.Book;
import repository.IBookRepo;
import service.BookServiceImpl;
import service.IBookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/book")
public class BookServlet extends HttpServlet {
    IBookService bookService = new BookServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":

                break;
            case "edit":

                break;
            case "delete":

                break;
            case "search":
                search(request, response);
                break;
            case "sort":

                break;
            default:
                listBook(request, response);
                break;
        }

    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameSearch = request.getParameter("nameSearch");
        List<Book> bookList = bookService.searchBook(nameSearch);
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/book/list.jsp");
        dispatcher.forward(request, response);
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookService.selectAllBook();
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/book/list.jsp");
        dispatcher.forward(request, response);
    }
}
