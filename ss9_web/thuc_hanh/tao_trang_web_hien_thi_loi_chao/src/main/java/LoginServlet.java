import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

//        request.setAttribute("username",username);
//        request.getRequestDispatcher("/index.jsp").forward(request,response);

        if ("admin".equals(username) && "admin".equals(password)) {
            request.setAttribute("result", "welcome to website ");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else {
            request.setAttribute("result", "login error ");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }
}
