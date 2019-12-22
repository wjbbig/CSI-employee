package personal.wjb.csi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import personal.wjb.csi.bean.UserRoleInf;

import java.util.List;

/**
 * ClassName:UserRoleInfMapper
 * PackName:personal.wjb.csi.mapper
 * Description:
 *
 * @Date:2019/9/16 19:30
 * @Author:975475688@qq.com
 */
public interface UserRoleInfMapper extends BaseMapper<UserRoleInf> {
    void deleteUserRoleByUserId(Integer id);

    void deleteBatchUserIds(List<Integer> userIds);

    int updateByUserId(UserRoleInf userRoleInf);
}
