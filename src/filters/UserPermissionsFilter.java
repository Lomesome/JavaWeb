package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "UserPermissionsFilter")
public class UserPermissionsFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        chain.doFilter(req, resp);
        String perm = (String) session.getAttribute("perm");
        System.out.println("root".equals(perm));
        if("root".equals(perm)){
            req.getRequestDispatcher("/Experiment5/indexadmin.jsp").forward(req, resp);
        }else if("user".equals(perm)) {
            req.getRequestDispatcher("/Experiment5/index.jsp").forward(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
