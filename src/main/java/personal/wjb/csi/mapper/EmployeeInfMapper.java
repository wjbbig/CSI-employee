package personal.wjb.csi.mapper;

import personal.wjb.csi.bean.EmployeeInf;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
public interface EmployeeInfMapper extends BaseMapper<EmployeeInf> {


    int addNewEmp(EmployeeInf employeeInf);

    List<EmployeeInf> listAllEmps(EmployeeInf employeeInf);

    EmployeeInf getEmpById(Integer id);
}
