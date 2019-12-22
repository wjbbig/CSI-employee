package personal.wjb.csi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import personal.wjb.csi.bean.RoleInf;

import java.util.List;

/**
 * ClassName:RoleInfMapper
 * PackName:personal.wjb.csi.mapper
 * Description:
 *
 * @Date:2019/9/16 17:00
 * @Author:975475688@qq.com
 */
public interface RoleInfMapper extends BaseMapper<RoleInf> {

    List<Integer> getPermissionById(Integer id);

    int deletePermissionByRoleId(Integer roleId);

    int addPermissionByRoleId(@Param("permission") List<Integer> idList, @Param("roleId") Integer roleId);
}
