package personal.wjb.csi.mapper;

import personal.wjb.csi.bean.JobInf;
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
public interface JobInfMapper extends BaseMapper<JobInf> {

    List<JobInf> listAllJobInfs(String jobName);
}
