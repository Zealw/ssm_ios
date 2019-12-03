package interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws IOException {
        String requestURI = req.getRequestURI();
        if (requestURI.contains("/login") || requestURI.contains("/register") || requestURI.contains("/forgetPwd")) {
           return true;
        }else{
            System.out.println(req.getRequestURI());
            Object user = req.getSession().getAttribute("user");
            System.out.println(user);
            if(user != null){
                return true;
            }else{
                resp.sendRedirect(req.getContextPath() + "/index.jsp");
            }
        }
        return false;
    }
}

