package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.EmployeeInf;
import personal.wjb.csi.mapper.EmployeeInfMapper;
import personal.wjb.csi.service.EmployeeInfService;
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
public class EmployeeInfServiceImpl extends ServiceImpl<EmployeeInfMapper, EmployeeInf> implements EmployeeInfService {

    @Autowired
    private EmployeeInfMapper employeeInfMapper;

    @Override
    public boolean addNewEmp(EmployeeInf employeeInf) {
        int count =  employeeInfMapper.addNewEmp(employeeInf);
        if(count != 0){
            return true;
        }
        return false;
    }

    @Override
    public List<EmployeeInf> listAllEmps(EmployeeInf employeeInf) {
        return employeeInfMapper.listAllEmps(employeeInf);
    }

    @Override
    public EmployeeInf getEmpById(Integer id) {
        return employeeInfMapper.getEmpById(id);
    }
}
