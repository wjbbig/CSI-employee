package personal.wjb.csi.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public class JobInf extends Model<JobInf> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String name;
    private String jobDesc;
    private Integer deptId;
    @TableField(exist = false)
    private DeptInf deptInf;

    public JobInf() {
    }

    public JobInf(Integer id, String name, String jobDesc, Integer deptId) {
        this.id = id;
        this.name = name;
        this.jobDesc = jobDesc;
        this.deptId = deptId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public DeptInf getDeptInf() {
        return deptInf;
    }

    public void setDeptInf(DeptInf deptInf) {
        this.deptInf = deptInf;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "JobInf{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", jobDesc='" + jobDesc + '\'' +
                ", deptId=" + deptId +
                '}';
    }
}
