package personal.wjb.csi.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import personal.wjb.csi.bean.RoleInf;
import personal.wjb.csi.bean.UserInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.common.util.DateToStringUtil;
import personal.wjb.csi.common.util.Md5Util;
import personal.wjb.csi.service.UserInfService;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
@Controller
@RequestMapping("/user")
public class UserInfController {

    @Autowired
    private UserInfService userInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "user/showUser";
    }

    @RequestMapping(value = "toAddUser")
    public String toAddUser(){
       return "user/addUser";
    }

    @RequestMapping("/toResetPassword")
    public String toResetPassword(){
        return "user/resetPassword";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Integer id, Map<String,Object> map){
        UserInf userInf = userInfService.getUserById(id);
        map.put("userInf",userInf);
        return "user/updateUser";
    }

    @ResponseBody
    @RequestMapping("checkLoginName")
    public AjaxResult checkLoginName(@RequestParam("loginName") String name){

        try {
            int count = userInfService.getCountByLoginName(name);
            if(count == 0){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed(null);
        }
    }

    @ResponseBody
    @RequestMapping("/addNewUser")
    public AjaxResult addNewUser(UserInf userInf,Integer roleId){
        try {
            userInf.setPassword(Md5Util.digest("123456"));
            userInf.setCreateTime(DateToStringUtil.dataToString(new Date()));
            userInf.setRoleInf(new RoleInf(roleId,null));
            boolean count = userInfService.addNewUser(userInf);
            if(count){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed(null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed(null);
        }

    }

    @ResponseBody
    @RequestMapping("/getUser")
    public AjaxResult ListUser(@RequestParam("pageNo") Integer pageNo,@RequestParam(value = "name",defaultValue = "") String name,@RequestParam(value = "roleId",defaultValue = "0") Integer roleId){
        try {
            PageHelper.startPage(pageNo,5);
            name = "%"+name+"%";
            List<UserInf> userInfs = userInfService.listUsers(name,roleId);
            PageInfo<UserInf> pageInfo = new PageInfo<>(userInfs, 5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取用户信息失败");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public AjaxResult deleteUser(Integer id){
        try {
            userInfService.deleteUserById(id);
            return AjaxResult.success(null);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除用户失败");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteUsers")
    public AjaxResult deleteUsers(String idStr){

        try {
            String[] ids = idStr.split("-");
            List<Integer> userIds = new ArrayList<>();
            for(String id : ids){
                userIds.add(Integer.parseInt(id));
            }
            userInfService.deleteUsers(userIds);
            return AjaxResult.success(null);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return AjaxResult.failed(null);
        }
    }

    @ResponseBody
    @RequestMapping("/resetPassword")
    public AjaxResult resetPassword(@Valid UserInf userInf, BindingResult result){
        try {
            userInf.setPassword(Md5Util.digest(userInf.getPassword()));
            if(result.getErrorCount() > 0){
                return AjaxResult.failed("密码长度必须为6到16位");
            }else if(userInfService.resetPassword(userInf)){

                return AjaxResult.success(null);
            }else {
                return AjaxResult.failed("修改密码失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("修改密码失败");
        }
    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public AjaxResult updateUser(UserInf userInf , Integer roleId){
        try {
            UserInf userInf1 = userInfService.getUserById(userInf.getId());
            if(userInf1.getRoleInf().getId() == roleId){
                boolean b = userInfService.updateUser(userInf);
                if(b){
                    return AjaxResult.success(null);
                }else {
                    return AjaxResult.failed(null);
                }
            }else{
                userInf.setRoleInf(new RoleInf(roleId,null));
                boolean c = userInfService.updateUserWithRole(userInf);
                if(c){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed(null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed(null);
        }

    }
}

