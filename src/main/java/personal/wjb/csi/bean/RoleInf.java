package personal.wjb.csi.bean;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * ClassName:RoleInf
 * PackName:personal.wjb.csi.bean
 * Description:
 *
 * @Date:2019/9/16 16:54
 * @Author:975475688@qq.com
 */
public class RoleInf {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String roleName;

    public RoleInf(Integer id, String roleName) {
        this.id = id;
        this.roleName = roleName;
    }

    public RoleInf() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "RoleInf{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
