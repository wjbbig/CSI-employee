package personal.wjb.csi.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import org.hibernate.validator.constraints.Length;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public class UserInf extends Model<UserInf> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String loginName;
    @Length(min = 6,max = 16)
    private String password;
    private String createTime;
    private String username;
    @TableField(exist = false)
    private RoleInf roleInf;

    public UserInf() {
    }

    public UserInf(Integer id, String loginName, String password, String createTime, String username) {
        this.id = id;
        this.loginName = loginName;
        this.password = password;
        this.createTime = createTime;
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public RoleInf getRoleInf() {
        return roleInf;
    }

    public void setRoleInf(RoleInf roleInf) {
        this.roleInf = roleInf;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "UserInf{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", createTime='" + createTime + '\'' +
                ", username='" + username + '\'' +
                ", roleInf=" + roleInf +
                '}';
    }

}
