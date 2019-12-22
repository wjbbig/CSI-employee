package personal.wjb.csi.service;

import personal.wjb.csi.bean.EmployeeInf;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public interface EmployeeInfService extends IService<EmployeeInf> {
    /**
     * 新增一条员工记录
     * @param employeeInf
     * @return
     */
    boolean addNewEmp(EmployeeInf employeeInf);

    /**
     * 获取所有员工
     * @param employeeInf
     * @return
     */
    List<EmployeeInf> listAllEmps(EmployeeInf employeeInf);

    /**
     * 通过id来获取员工
     * @param id
     * @return
     */
    EmployeeInf getEmpById(Integer id);
}
