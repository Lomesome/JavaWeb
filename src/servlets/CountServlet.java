package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CountServlet")
public class CountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int count;
        if (this.getServletContext().getAttribute("counter") == null){
            count = 0;
        }else {
            count = (int) this.getServletContext().getAttribute("counter");
        }
        this.getServletContext().setAttribute("counter", ++count);
        PrintWriter out = response.getWriter();
        out.print("刷新次数: " + count);
    }
}
