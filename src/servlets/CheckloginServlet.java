package servlets;

import db.SqlHelper;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

public class CheckloginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String[] remeber = request.getParameterValues("remeber");
        String perm = request.getParameter("perm");
        Cookie cookie=new Cookie("user",account+"-"+password);
        if (request.getSession().getAttribute("name") == null) {
            if(account != null && password != null) {
                boolean flag = false;
                SqlHelper sqlHelper = new SqlHelper();
                String sql = "SELECT * FROM user where userid = ?";
                ResultSet resultSet = sqlHelper.queryExecute(sql, new String[]{account});
                int logincount = 0;
                String nickname = null;
                try {
                    while (resultSet.next()) {
                        if (resultSet.getString("password").equals(password)){
                            flag = true;
                            logincount = resultSet.getInt("logincount") + 1;
                            nickname = resultSet.getString("nickname");
                        }
                    }
                }catch (Exception ignore){ }

                if(flag){
                    sql = "update user set logincount=? where userid=? ";
                    sqlHelper.changeMsg(sql, new String[]{String.valueOf(logincount), account});
                    request.getSession().setAttribute("name", nickname);
                    request.getSession().setAttribute("count", String.valueOf(logincount));
                    request.getSession().setAttribute("perm", perm);
                    if(remeber !=null && remeber[0].equals("remeber")){
                        cookie.setMaxAge(Integer.MAX_VALUE);
                        response.addCookie(cookie);
                    }else{
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                    if(perm.equals("user")) {
                        this.getServletContext().getRequestDispatcher("/Experiment4/index.jsp").forward(request, response);
                        sql = "update user set perm=? where userid=? ";
                        sqlHelper.changeMsg(sql, new String[]{String.valueOf(logincount), "0"});
                    }
                    else if(perm.equals("root")) {
                        this.getServletContext().getRequestDispatcher("/Experiment4/indexadmin.jsp").forward(request, response);
                        sqlHelper.changeMsg(sql, new String[]{String.valueOf(logincount), "1"});
                    }
                    sqlHelper.close();
                }else {
                    out.print("<div><h2>帐号或密码不正确</h2></div>" +
                            "<div><h3>即将返回</h3></div>");
                    response.setHeader("Refresh","3");
                }
            }else {
                this.getServletContext().getRequestDispatcher("/Experiment4/login.jsp").forward(request, response);
            }
        }
        else {
            this.getServletContext().getRequestDispatcher("/Experiment4/index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
