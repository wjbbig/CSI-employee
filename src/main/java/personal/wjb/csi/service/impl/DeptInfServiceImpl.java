package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.mapper.DeptInfMapper;
import personal.wjb.csi.service.DeptInfService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
@Service
public class DeptInfServiceImpl extends ServiceImpl<DeptInfMapper, DeptInf> implements DeptInfService {

    @Autowired
    private DeptInfMapper deptInfMapper;


    @Override
    public List<DeptInf> listAllDepartments(String deptName) {
        return deptInfMapper.listAllDepartments(deptName);
    }

    @Override
    public boolean getCountByDeptName(String name) {
        int count = deptInfMapper.getCountByDeptName(name);
        if(count == 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean addNewDept(DeptInf deptInf) {
        int count = deptInfMapper.addNewDept(deptInf);
        if(count > 0){
            return true;
        }
        return false;
    }
}
