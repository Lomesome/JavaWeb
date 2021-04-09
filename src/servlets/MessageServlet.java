package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Web应用的URL：" + this.getServletContext().getContextPath());
        System.out.println("WEB-INF的物理路径是：" + this.getServletContext().getRealPath("WEB-INF"));
        System.out.println("Servlet AIP主版本是：" + this.getServletContext().getMajorVersion());
        System.out.println("Servlet容器的名称和版本：" + this.getServletContext().getServerInfo());
    }
}
