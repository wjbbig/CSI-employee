package personal.wjb.csi.service;

import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.bean.NoticeInf;
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
public interface NoticeInfService extends IService<NoticeInf> {

    /**
     * 获取全部符合条件的公告
     * @param title
     * @return
     */
    List<DeptInf> listAllNotices(String title);
}
