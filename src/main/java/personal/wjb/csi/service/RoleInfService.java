package personal.wjb.csi.service;

import com.baomidou.mybatisplus.service.IService;
import personal.wjb.csi.bean.RoleInf;

import java.util.List;

/**
 * ClassName:RoleInfService
 * PackName:personal.wjb.csi.service
 * Description:
 *
 * @Date:2019/9/16 17:00
 * @Author:975475688@qq.com
 */
public interface RoleInfService extends IService<RoleInf> {
    /**
     * 获取角色所有权限的id
     * @param id
     * @return
     */
    List<Integer> getPermissionById(Integer id);

    /**
     * 删除角色所有的权限
     * @param roleId
     * @return
     */
    Boolean deletePermissionByRoleId(Integer roleId);

    /**
     * 增加角色权限
     * @param idList
     * @param roleId
     * @return
     */
    boolean addPermissionByRoleId(List<Integer> idList, Integer roleId);
}
