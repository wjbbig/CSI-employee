package personal.wjb.csi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.service.PermissionInfService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName : PermissionInfController
 * Package : personal.wjb.csi.controller
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/21 18:41
 */
@Controller
@RequestMapping("/permission")
public class PermissionInfController {

    @Autowired
    private PermissionInfService permissionInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "permission/showPermission";
    }

    @ResponseBody
    @RequestMapping("/getPermission")
    public AjaxResult getPermission(){

        try {
            List<PermissionInf> root = new ArrayList<>();


            List<PermissionInf> childrenPermissions =  permissionInfService.listAllPermission();


            Map<Integer,PermissionInf> map = new HashMap<>();//100

            for (PermissionInf innerPermissionInf : childrenPermissions) {
                map.put(innerPermissionInf.getId(), innerPermissionInf);
            }


            for (PermissionInf permissionInf : childrenPermissions) { //100
                //通过子查找父
                //子菜单
                PermissionInf child = permissionInf ; //假设为子菜单
                if(child.getpId() == null ){
                    root.add(permissionInf);
                }else{
                    //父节点
                    PermissionInf parent = map.get(child.getpId());
                    parent.getChildren().add(child);
                }
            }
            return AjaxResult.success(null).add("permission",root);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取权限失败！");
        }
    }
}
