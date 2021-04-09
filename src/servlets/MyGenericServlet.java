package servlets;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyGenericServlet extends GenericServlet {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat();// 格式化时间
    Date date = new Date();// 获取当前时间
    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        servletResponse.setContentType("text/html;charset=UTF-8");
        PrintWriter out = servletResponse.getWriter();
        out.println("你好！继承GenericServlet类的servlet");
        simpleDateFormat.applyPattern("yyyy-MM-dd HH:mm:ss a");
        System.out.println("service:" + simpleDateFormat.format(date));
    }

    @Override
    public void init() throws ServletException {
        super.init();
        simpleDateFormat.applyPattern("yyyy-MM-dd HH:mm:ss a");
        System.out.println("init:" + simpleDateFormat.format(date));
    }

    @Override
    public void destroy() {
        super.destroy();
        simpleDateFormat.applyPattern("yyyy-MM-dd HH:mm:ss a");
        System.out.println("init:" + simpleDateFormat.format(date));
    }
}
