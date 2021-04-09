package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "TestFilter1")
public class TestFilter1 implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String name = (String) ((HttpServletRequest) req).getSession().getAttribute("name");
        if (name == null){
            req.getRequestDispatcher("/Experiment5/index.jsp").forward(req, resp);
            System.out.println("TestFilter1过滤器执行doFilter，应用内跳转之后执行");
        }else {
            System.out.println("TestFilter1过滤器执行doFilter，可拦截并预处理");
            chain.doFilter(req, resp);
            System.out.println("TestFilter1过滤器执行doFilter，可拦截并后期处理");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
