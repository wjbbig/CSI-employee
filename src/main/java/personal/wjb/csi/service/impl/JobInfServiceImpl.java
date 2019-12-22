package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.JobInf;
import personal.wjb.csi.mapper.JobInfMapper;
import personal.wjb.csi.service.JobInfService;
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
public class JobInfServiceImpl extends ServiceImpl<JobInfMapper, JobInf> implements JobInfService {

    @Autowired
    private JobInfMapper jobInfMapper;

    @Override
    public List<JobInf> listAllJobInfs(String jobName) {
        return jobInfMapper.listAllJobInfs(jobName);
    }
}
