package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "HelloServlet")
public class HelloServlet extends HttpServlet {
    String clientName=null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        clientName=request.getParameter("clientName");
        if(clientName==null)
            clientName="我的朋友";
        System.out.println(Thread.currentThread().getName());
        try{Thread.sleep(2000); }catch(Exception e){}
        PrintWriter out = response.getWriter();  // 第四步：生成 HTTP 响应结果。
        out.println("<h1><P> "+clientName+" : 您好</h1>");
        out.close();

    }
}
