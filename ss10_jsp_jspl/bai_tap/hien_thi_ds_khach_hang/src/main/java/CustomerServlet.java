import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    public static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Mai Văn Hoàng","1983-08-20","Hà Nội","https://cf.shopee.vn/file/aded53959846e8c6e6a9349f8afaf0fb"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://i.pinimg.com/originals/e7/9a/2e/e79a2e65f48f8f417c66cf5bdbd96d31.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà","1983-08-22","Nam Định","https://toanthaydinh.com/wp-content/uploads/2020/04/top-nhung-hinh-anime-cuc-ngau-cho-nam-va-nu-anime-chat-11-2.png"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://pdp.edu.vn/wp-content/uploads/2021/06/hinh-anh-anime-girl-deo-kinh-thoi-trang-tri-thuc-dep-nhat.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://toigingiuvedep.vn/wp-content/uploads/2021/06/hinh-anh-anime-girl-deo-kinh-1-634x600.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/customer.jsp");
        requestDispatcher.forward(request,response);
    }
}
