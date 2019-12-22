package personal.wjb.csi.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName : PermissionInf
 * Package : personal.wjb.csi.bean
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/20 10:08
 */
public class PermissionInf {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String title;
    private String href;
    private Integer pId;
    @TableField(exist = false)
    private List<PermissionInf> children = new ArrayList<>();
    @TableField(exist = false)
    private boolean checked;
    @TableField(exist = false)
    private boolean spread = true;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public List<PermissionInf> getChildren() {
        return children;
    }

    public void setChildren(List<PermissionInf> children) {
        this.children = children;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }
}
