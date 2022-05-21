import org.apache.taglibs.standard.lang.jstl.GreaterThanOrEqualsOperator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float num1 = Float.parseFloat(request.getParameter("first-operand"));
        float num2 = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        try {
        float result = Calculator.calculate(num1, num2, operator);
        request.setAttribute("firstOperand", num1);
        request.setAttribute("secondOperand", num2);
        request.setAttribute("operator",operator);
        request.setAttribute("result", result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("calculator.jsp");
        requestDispatcher.forward(request, response);
        } catch (Exception ex) {
            writer.println("Error: " + ex.getMessage());
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
