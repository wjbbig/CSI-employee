package personal.wjb.csi.mapper;

import org.apache.ibatis.annotations.Param;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.UserInf;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public interface UserInfMapper extends BaseMapper<UserInf> {

    UserInf getUserByUsernameAndPassword(Map<String, Object> paramMap);

    int getCountByLoginName(String name);

    int addNewUser(UserInf userInf);

    List<UserInf> listUsers(@Param("name") String name, @Param("roleId") Integer roleId);

    void deleteUserById(Integer id);

    int updateUserInf(UserInf userInf);

    void deleteBatchUserIds(List<Integer> userIds);

    UserInf getUserById(Integer id);

    List<PermissionInf> getPermissionByUserId(Integer id);
}
