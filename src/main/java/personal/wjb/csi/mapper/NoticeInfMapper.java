package personal.wjb.csi.mapper;

import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.bean.NoticeInf;
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
public interface NoticeInfMapper extends BaseMapper<NoticeInf> {

    List<DeptInf> listAllNotices(String title);
}
