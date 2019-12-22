package personal.wjb.csi.mapper;

import personal.wjb.csi.bean.DocumentInf;
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
public interface DocumentInfMapper extends BaseMapper<DocumentInf> {

    List<DocumentInf> ListAllDocuments(String s);
}
