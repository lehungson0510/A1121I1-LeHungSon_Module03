import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SimpleDictionaryServlet", urlPatterns = "/translate")
public class SimpleDictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String search = request.getParameter("input");
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("one", "1");
        dictionary.put("two", "2");
        dictionary.put("three", "3");
        dictionary.put("four", "4");
        dictionary.put("five", "5");
        dictionary.put("six", "6");
        dictionary.put("seven", "7");
        dictionary.put("eight", "8");
        dictionary.put("nine", "9");
        dictionary.put("ten", "10");

        String result = dictionary.get(search);
        if(result!=null){
            request.setAttribute("result", dictionary.get(search));
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }else {
            request.setAttribute("result", "Not found");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
