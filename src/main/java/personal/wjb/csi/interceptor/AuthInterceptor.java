package personal.wjb.csi.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.UserInf;
import personal.wjb.csi.common.util.Const;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Set;

/**
 * ClassName : AuthInterceptor
 * Package : personal.wjb.csi.interceptor
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/22 13:27
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Set<String> allUris = (Set<String>) request.getSession().getServletContext().getAttribute(Const.ALL_PERMISSION_URI);
        String servletPath = request.getServletPath();
        if(allUris.contains(servletPath)){
            //判断请求路径是否在用户所拥有的权限范围内
            Set<String> myUris = (Set<String>) request.getSession().getAttribute(Const.MY_URI);
            if(myUris.contains(servletPath)){
                return true;
            }else{
                response.sendRedirect(request.getContextPath()+"/index.go");
                return false;
            }
        }else{
            return true;
        }
    }
}
