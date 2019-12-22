package personal.wjb.csi.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public class EmployeeInf extends Model<EmployeeInf> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @NotEmpty
    private String name;
    private String cardId;
    private String address;
    private String postCode;
    private String phone;
    private String qqNum;
    private String email;
    private String sex;
    private String party;
    private String birthday;
    private String nation;
    private String degree;
    private String speciality;
    private String hobby;
    private String employeeDesc;
    @TableField(exist = false)
    private JobInf jobInf;
    @TableField(exist = false)
    private DeptInf deptInf;

    public EmployeeInf() {
    }

    public EmployeeInf(Integer id, String name, String cardId, String address, String postCode, String phone, String qqNum, String email, String sex, String party, String birthday, String nation, String degree, String speciality, String hobby, String employeeDesc, JobInf jobInf, DeptInf deptInf) {
        this.id = id;
        this.name = name;
        this.cardId = cardId;
        this.address = address;
        this.postCode = postCode;
        this.phone = phone;
        this.qqNum = qqNum;
        this.email = email;
        this.sex = sex;
        this.party = party;
        this.birthday = birthday;
        this.nation = nation;
        this.degree = degree;
        this.speciality = speciality;
        this.hobby = hobby;
        this.employeeDesc = employeeDesc;
        this.jobInf = jobInf;
        this.deptInf = deptInf;
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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQqNum() {
        return qqNum;
    }

    public void setQqNum(String qqNum) {
        this.qqNum = qqNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getEmployeeDesc() {
        return employeeDesc;
    }

    public void setEmployeeDesc(String employeeDesc) {
        this.employeeDesc = employeeDesc;
    }

    public JobInf getJobInf() {
        return jobInf;
    }

    public void setJobInf(JobInf jobInf) {
        this.jobInf = jobInf;
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
        return "EmployeeInf{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cardId='" + cardId + '\'' +
                ", address='" + address + '\'' +
                ", postCode='" + postCode + '\'' +
                ", phone='" + phone + '\'' +
                ", qqNum='" + qqNum + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", party='" + party + '\'' +
                ", birthday=" + birthday +
                ", nation='" + nation + '\'' +
                ", degree='" + degree + '\'' +
                ", speciality='" + speciality + '\'' +
                ", hobby='" + hobby + '\'' +
                ", employeeDesc='" + employeeDesc + '\'' +
                ", jobInf=" + jobInf +
                ", deptInf=" + deptInf +
                '}';
    }
}
