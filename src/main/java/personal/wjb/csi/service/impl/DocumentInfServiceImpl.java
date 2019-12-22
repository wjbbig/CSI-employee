package personal.wjb.csi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import personal.wjb.csi.bean.DocumentInf;
import personal.wjb.csi.mapper.DocumentInfMapper;
import personal.wjb.csi.service.DocumentInfService;
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
public class DocumentInfServiceImpl extends ServiceImpl<DocumentInfMapper, DocumentInf> implements DocumentInfService {

    @Autowired
    private DocumentInfMapper documentInfMapper;

    @Override
    public List<DocumentInf> ListAllDocuments(String s) {
        return documentInfMapper.ListAllDocuments(s);
    }
}
