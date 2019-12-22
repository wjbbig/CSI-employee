package personal.wjb.csi.service;

import personal.wjb.csi.bean.DeptInf;
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
public interface DeptInfService extends IService<DeptInf> {

    /**
     * 获取所有部门信息
     * @param deptName
     * @return
     */
    List<DeptInf> listAllDepartments(String deptName);

    /**
     * 检查部门名是否被使用
     * @param name
     * @return
     */
    boolean getCountByDeptName(String name);

    /**
     * 添加一个部门
     * @param deptInf
     * @return
     */
    boolean addNewDept(DeptInf deptInf);
}
