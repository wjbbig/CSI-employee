package personal.wjb.csi.interceptor;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import personal.wjb.csi.common.util.Const;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

/**
 * ClassName:LoginInterceptor
 * PackName:personal.wjb.csi.interceptor
 * Description: 登录拦截器
 *
 * @Date:2019/9/17 20:38
 * @Author:975475688@qq.com
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Set uris = new HashSet();
        uris.add("/index.go");
        uris.add("/logout.go");
        uris.add("/login.do");

        String servletPath = request.getServletPath();

        if(uris.contains(servletPath)){
            return true;
        }

        HttpSession session = request.getSession();
        Object object = session.getAttribute(Const.LOGIN_USER);
        if(object != null){
            return true;
        }else{
            response.sendRedirect(request.getContextPath()+"/index.go");
            return false;
        }
    }
}
