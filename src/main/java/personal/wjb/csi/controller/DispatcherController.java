package personal.wjb.csi.controller;

import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.UserInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.common.util.Const;
import personal.wjb.csi.common.util.Md5Util;
import personal.wjb.csi.service.UserInfService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * ClassName:DispatcherController
 * PackName:personal.wjb.csi.controller
 * Description:
 *
 * @Date:2019/9/9 21:15
 * @Author:975475688@qq.com
 */
@Controller
public class DispatcherController {

    @Autowired
    private UserInfService userInfService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request,HttpServletResponse response,Map<String,Object> model){
        try {
            Cookie[] cookies = request.getCookies();
            if(cookies != null) { //如果客户端禁用了Cookie，那么无法获取Cookie信息

                for (Cookie cookie : cookies) {

                    if ("loginCode".equals(cookie.getName())) {
                        String loginCode = cookie.getValue();

                        String[] split = loginCode.split("&");

                        if (split.length == 2) {
                            String username = split[0].split("=")[1];
                            String password = split[1].split("=")[1];
                            Map<String, Object> paramMap = new HashMap<>();
                            paramMap.put("username", username);
                            paramMap.put("password", Md5Util.digest(password));

                            UserInf userInf = userInfService.getUserByUsernameAndPassword(paramMap);
                            userInf.setPassword(password);
                            if (userInf != null) {
                                model.put(Const.LOGIN_USER, userInf);
                                model.put("rememberMe", "1");
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            Cookie cookie = new Cookie("loginCode",null);
            cookie.setMaxAge(0); //
            cookie.setPath(request.getContextPath());  // 相同路径
            response.addCookie(cookie);
            request.getSession().removeAttribute(Const.LOGIN_USER);
        }
        return "login";
    }

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

    @ResponseBody
    @RequestMapping("/login")
    public AjaxResult login(HttpSession session, @RequestParam("username") String username, String password, HttpServletResponse response,String rememberMe){
        try {
            Map<String,Object> paramMap = new HashMap<>();
            paramMap.put("username",username);
            paramMap.put("password", Md5Util.digest(password));
            UserInf userInf = userInfService.getUserByUsernameAndPassword(paramMap);
            session.setAttribute(Const.LOGIN_USER,userInf);

            List<PermissionInf> root = new ArrayList<>();


            List<PermissionInf> childrenPermissions = userInfService.getPermissionByUserId(userInf.getId());

            Set<String> myUris = new HashSet<>();
            Map<Integer,PermissionInf> map = new HashMap<>();
            for (PermissionInf innerPermissionInf : childrenPermissions) {
                myUris.add("/" + innerPermissionInf.getHref());
                map.put(innerPermissionInf.getId(), innerPermissionInf);
            }


            for (PermissionInf PermissionInf : childrenPermissions) {
                PermissionInf child = PermissionInf ;
                if(child.getpId() == null ){
                    root.add(PermissionInf);
                }else{
                    PermissionInf parent = map.get(child.getpId());
                    parent.getChildren().add(child);
                }
            }
            session.setAttribute(Const.MY_URI,myUris);
            session.setAttribute("permissionRoot",root);
            if("1".equals(rememberMe)){
                String loginCode = "\"username=" + userInf.getLoginName() + "&password=" + password + "\"";
                Cookie cookie = new Cookie("loginCode",loginCode);
                cookie.setMaxAge(60*60*24*14);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            return AjaxResult.success(null);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed(e.getMessage());
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute(Const.LOGIN_USER);
        return "redirect:/index.go";
    }
}
