package personal.wjb.csi.service;

import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.UserInf;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public interface UserInfService extends IService<UserInf> {

    /**
     * 根据账户和密码来查询用户
     * @param paramMap
     * @return
     */
    UserInf getUserByUsernameAndPassword(Map<String, Object> paramMap);

    /**
     * 检查账号唯一性
     * @param name
     * @return
     */
    int getCountByLoginName(String name);

    /**
     * 添加一个用户
     * @param userInf
     * @return
     */
    boolean addNewUser(UserInf userInf);

    /**
     * 根据名字和角色id来查询用户信息
     * @param name
     * @param roleId
     * @return
     */
    List<UserInf> listUsers(String name, Integer roleId);

    /**
     * 根据id删除用户
     * @param id
     */
    void deleteUserById(Integer id);

    /**
     * 修改用户密码
     * @param userInf
     */
    boolean resetPassword(UserInf userInf);

    /**
     * 批量删除用户
     * @param userIds
     */
    void deleteUsers(List<Integer> userIds);

    /**
     * 根据id获取用户
     * @param id
     * @return
     */
    UserInf getUserById(Integer id);

    /**
     * 仅更新用户信息
     * @param userInf
     * @return
     */
    boolean updateUser(UserInf userInf);

    /**
     * 更新用户信息和角色信息
     * @param userInf
     */
    boolean updateUserWithRole(UserInf userInf);

    /**
     * 获取用户的所有权限
     * @param id
     * @return
     */
    List<PermissionInf> getPermissionByUserId(Integer id);
}
