package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.bean.NoticeInf;
import personal.wjb.csi.mapper.NoticeInfMapper;
import personal.wjb.csi.service.NoticeInfService;
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
public class NoticeInfServiceImpl extends ServiceImpl<NoticeInfMapper, NoticeInf> implements NoticeInfService {

    @Autowired
    private NoticeInfMapper noticeInfMapper;

    @Override
    public List<DeptInf> listAllNotices(String title) {
        return noticeInfMapper.listAllNotices(title);
    }
}
