package personal.wjb.csi.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.RoleInf;
import personal.wjb.csi.bean.UserRoleInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.service.PermissionInfService;
import personal.wjb.csi.service.RoleInfService;
import personal.wjb.csi.service.UserRoleInfService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:RoleInfController
 * PackName:personal.wjb.csi.controller
 * Description:
 *
 * @Date:2019/9/16 16:59
 * @Author:975475688@qq.com
 */
@RequestMapping("/role")
@Controller
public class RoleInfController {

    @Autowired
    private RoleInfService roleInfService;

    @Autowired
    private UserRoleInfService userRoleInfService;

    @Autowired
    private PermissionInfService permissionInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "permission/showRole";
    }

    @RequestMapping("/toAddRole")
    public String toAddRole(){
        return "permission/addRole";
    }

    @RequestMapping("/toUpdateRole")
    public String toUpdateRole(Integer id, Map<String,Object> map){
        RoleInf roleInf = roleInfService.selectById(id);
        map.put("roleInf",roleInf);
        return "permission/updateRole";
    }

    @RequestMapping("/toAddRolePermission")
    public String toAddRolePermission(Integer id,Map<String,Object> map){
        map.put("roleId",id);
        return "permission/addRolePermission";
    }

    @ResponseBody
    @RequestMapping("/getRoles")
    public AjaxResult getRoles(@RequestParam(value = "pageNo",defaultValue = "1")Integer pageNo,@RequestParam(value = "roleName",defaultValue = "") String roleName){
        try {
            PageHelper.startPage(pageNo,5);
            List<RoleInf> roleInfs = roleInfService.selectList(new EntityWrapper<RoleInf>().like("role_name", roleName));
            PageInfo<RoleInf> pageInfo = new PageInfo<>(roleInfs, 5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取角色列表失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteRole")
    public AjaxResult deleteRole(String ids){
        boolean b = false;
        boolean a = false;
        try {

            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                for(Integer id : idList){
                    a = userRoleInfService.delete(new EntityWrapper<UserRoleInf>().eq("role_id",id));
                    if(a){
                        return AjaxResult.success(null);
                    }else{
                        return AjaxResult.failed("删除角色失败！");
                    }
                }
                b = roleInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除角色失败！");
                }
            }else{
                a = userRoleInfService.delete(new EntityWrapper<UserRoleInf>().eq("role_id",ids));
                b = roleInfService.deleteById(Integer.parseInt(ids));
                if(b && a){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除角色失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除角色失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/addRole")
    public AjaxResult addRole(RoleInf roleInf){
        try {
            boolean insert = roleInfService.insert(roleInf);
            if(insert){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("添加角色失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("添加角色失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/updateRole")
    public AjaxResult updateRole(RoleInf roleInf){
        try {
            boolean b = roleInfService.updateById(roleInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新角色失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新角色失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/addRolePermission")
    public AjaxResult addRolePermission(String ids,@RequestParam(value = "id") Integer roleId){
        try {
            List<Integer> rolePermission = roleInfService.getPermissionById(roleId);
            String[] idStr = ids.split("-");
            List<Integer> idList = new ArrayList<>();
            for(String str : idStr){
                idList.add(Integer.parseInt(str));
            }
            if(rolePermission != null && rolePermission.size() > 0){
                Boolean b = roleInfService.deletePermissionByRoleId(roleId);
                if(b){
                    boolean p = roleInfService.addPermissionByRoleId(idList,roleId);
                    if(p){
                        return AjaxResult.success(null);
                    }else{
                        return AjaxResult.failed("添加或修改权限失败");
                    }
                }else{
                    return AjaxResult.failed("添加或修改权限失败");
                }
            }else{
                boolean p = roleInfService.addPermissionByRoleId(idList,roleId);
                if(p){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("添加或修改权限失败");
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return AjaxResult.failed("添加或修改权限失败");
        }
    }

    @ResponseBody
    @RequestMapping("/getPermissionOfRole")
    public AjaxResult getPermissionOfRole(Integer id){
        try {
            List<Integer> permissionIds = roleInfService.getPermissionById(id);
            List<PermissionInf> root = new ArrayList<>();
            if(permissionIds != null && permissionIds.size() > 0){

                List<PermissionInf> childrenPermissions =  permissionInfService.listAllPermission();

                Map<Integer,PermissionInf> permissionInfMap = new HashMap<>();//100

                for (PermissionInf innerPermissionInf : childrenPermissions) {
                    if(permissionIds.contains(innerPermissionInf.getId()) && innerPermissionInf.getpId() != null){
                        innerPermissionInf.setChecked(true);
                    }
                    permissionInfMap.put(innerPermissionInf.getId(), innerPermissionInf);
                }
                for (PermissionInf PermissionInf : childrenPermissions) { //100
                    //通过子查找父
                    //子菜单
                    PermissionInf child = PermissionInf ; //假设为子菜单
                    if(child.getpId() == null ){
                        root.add(PermissionInf);
                    }else{
                        //父节点
                        PermissionInf parent = permissionInfMap.get(child.getpId());
                        parent.getChildren().add(child);
                    }
                }
            }else{
                List<PermissionInf> childrenPermissions =  permissionInfService.listAllPermission();


                Map<Integer,PermissionInf> permissionInfMap = new HashMap<>();//100

                for (PermissionInf innerPermissionInf : childrenPermissions) {
                    permissionInfMap.put(innerPermissionInf.getId(), innerPermissionInf);
                }


                for (PermissionInf PermissionInf : childrenPermissions) { //100
                    //通过子查找父
                    //子菜单
                    PermissionInf child = PermissionInf ; //假设为子菜单
                    if(child.getpId() == null ){
                        root.add(PermissionInf);
                    }else{
                        //父节点
                        PermissionInf parent = permissionInfMap.get(child.getpId());
                        parent.getChildren().add(child);
                    }
                }
            }
            return AjaxResult.success(null).add("permission",root);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取角色权限失败");
        }
    }
}
