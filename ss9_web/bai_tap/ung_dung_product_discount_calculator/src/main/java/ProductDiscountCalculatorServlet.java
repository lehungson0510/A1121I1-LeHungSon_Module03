import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet",urlPatterns = "/input")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String product = request.getParameter("production");
float price = Float.parseFloat(request.getParameter("price"));
float discount = Float.parseFloat(request.getParameter("discount"));
double discount_amount = ((price*discount*0.01));

request.setAttribute("production",product);
request.setAttribute("price",price);
request.setAttribute("discount",discount);
request.setAttribute("discount_amount",discount_amount);
request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
