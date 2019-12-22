package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.bean.UserInf;
import personal.wjb.csi.bean.UserRoleInf;
import personal.wjb.csi.exception.LoginFailException;
import personal.wjb.csi.mapper.UserInfMapper;
import personal.wjb.csi.mapper.UserRoleInfMapper;
import personal.wjb.csi.service.UserInfService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
@Service
public class UserInfServiceImpl extends ServiceImpl<UserInfMapper, UserInf> implements UserInfService {

    @Autowired
    private UserInfMapper userInfMapper;

    @Autowired
    private UserRoleInfMapper userRoleInfMapper;

    @Override
    public UserInf getUserByUsernameAndPassword(Map<String, Object> paramMap) {
        UserInf userInf =  userInfMapper.getUserByUsernameAndPassword(paramMap);
        if(userInf == null){
            throw new LoginFailException("用户名或密码错误");
        }else{
            return userInf;
        }
    }

    @Override
    public int getCountByLoginName(String name) {

        return userInfMapper.getCountByLoginName(name);
    }

    @Override
    public boolean addNewUser(UserInf userInf) {
        UserInf userInf1 = userInf;
        int user = userInfMapper.addNewUser(userInf1);
        int userRole = userRoleInfMapper.insert(new UserRoleInf(null,userInf1.getId(),userInf1.getRoleInf().getId()));
        if(user >0 && userRole >0){
            return true;
        }
        return false;
    }

    @Override
    public List<UserInf> listUsers(String name, Integer roleId) {
        return userInfMapper.listUsers(name,roleId);
    }

    @Override
    public void deleteUserById(Integer id) {
        userRoleInfMapper.deleteUserRoleByUserId(id);
        userInfMapper.deleteUserById(id);
    }

    @Override
    public boolean resetPassword(UserInf userInf) {
        int a = userInfMapper.updateUserInf(userInf);
        if(a > 0){
            return true;
        }
        return false;
    }

    @Override
    public void deleteUsers(List<Integer> userIds) {
        userRoleInfMapper.deleteBatchUserIds(userIds);
        userInfMapper.deleteBatchUserIds(userIds);
    }

    @Override
    public UserInf getUserById(Integer id) {
        return userInfMapper.getUserById(id);
    }

    @Override
    public boolean updateUser(UserInf userInf) {
        int a =  userInfMapper.updateUserInf(userInf);
        if(a > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updateUserWithRole(UserInf userInf) {
        int a = userRoleInfMapper.updateByUserId(new UserRoleInf(null,userInf.getId(),userInf.getRoleInf().getId()));
        int b = userInfMapper.updateUserInf(userInf);
        if(a>0 && b>0){
            return true;
        }
        return false;
    }

    @Override
    public List<PermissionInf> getPermissionByUserId(Integer id) {
        return userInfMapper.getPermissionByUserId(id);
    }
}
