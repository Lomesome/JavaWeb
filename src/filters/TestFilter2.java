package filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "TestFilter2")
public class TestFilter2 implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("TestFilter2过滤器执行doFilter，可拦截并预处理");
        chain.doFilter(req, resp);
        System.out.println("TestFilter2过滤器执行doFilter，可拦截并后期处理");
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
