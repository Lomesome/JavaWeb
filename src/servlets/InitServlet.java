package servlets;

import vo.Book;
import dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;

@WebServlet(name = "InitServlet")
public class InitServlet extends HttpServlet {
    private String driver;
    private String url;
    private String user;
    private String password;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bookDao = new BookDao();
        Connection ct = bookDao.getConnection(driver, url, user, password);
        HashMap<String, Book> bookHashMap = bookDao.getAllBook(ct);
        bookDao.close(ct);
        request.getSession().setAttribute("allbook", bookHashMap);
        System.out.println(bookHashMap);
        response.sendRedirect("Experiment6/showallbook.jsp");
    }

    @Override
    public void init() throws ServletException {
        super.init();
        driver = getInitParameter("driver");
        url = getInitParameter("url");
        user = getInitParameter("user");
        password = getInitParameter("password");
    }
}
