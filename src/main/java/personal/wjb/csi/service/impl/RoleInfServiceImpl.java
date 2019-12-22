package personal.wjb.csi.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import personal.wjb.csi.bean.RoleInf;
import personal.wjb.csi.mapper.RoleInfMapper;
import personal.wjb.csi.service.RoleInfService;

import java.util.List;

/**
 * ClassName:RoleInfServiceImpl
 * PackName:personal.wjb.csi.service.impl
 * Description:
 *
 * @Date:2019/9/16 17:01
 * @Author:975475688@qq.com
 */
@Service
public class RoleInfServiceImpl extends ServiceImpl<RoleInfMapper, RoleInf> implements RoleInfService {

    @Autowired
    private RoleInfMapper roleInfMapper;

    @Override
    public List<Integer> getPermissionById(Integer id) {
        return roleInfMapper.getPermissionById(id);
    }

    @Override
    public Boolean deletePermissionByRoleId(Integer roleId) {
        int count = roleInfMapper.deletePermissionByRoleId(roleId);
        if(count > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean addPermissionByRoleId(List<Integer> idList, Integer roleId) {
        int count = roleInfMapper.addPermissionByRoleId(idList,roleId);
        if(count > 0){
            return true;
        }
        return false;
    }
}
