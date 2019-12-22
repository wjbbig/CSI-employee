package personal.wjb.csi.mapper;

import personal.wjb.csi.bean.DeptInf;
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
public interface DeptInfMapper extends BaseMapper<DeptInf> {

    List<DeptInf> listAllDepartments(String deptName);

    int getCountByDeptName(String name);

    int addNewDept(DeptInf deptInf);
}
