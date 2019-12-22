package personal.wjb.csi.service;

import personal.wjb.csi.bean.JobInf;
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
public interface JobInfService extends IService<JobInf> {

    /**
     * 获取所有符合条件的职位
     * @param jobName
     * @return
     */
    List<JobInf> listAllJobInfs(String jobName);
}
