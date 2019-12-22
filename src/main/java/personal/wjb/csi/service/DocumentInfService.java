package personal.wjb.csi.service;

import personal.wjb.csi.bean.DocumentInf;
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
public interface DocumentInfService extends IService<DocumentInf> {

    /**
     * 获取全部文档或根据文档名字查询
     * @param s
     * @return
     */
    List<DocumentInf> ListAllDocuments(String s);
}
