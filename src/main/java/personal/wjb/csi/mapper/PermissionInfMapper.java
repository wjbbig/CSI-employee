package personal.wjb.csi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import personal.wjb.csi.bean.PermissionInf;

import java.util.List;

/**
 * ClassName : PermissionInfMapper
 * Package : personal.wjb.csi.mapper
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/21 19:04
 */
public interface PermissionInfMapper extends BaseMapper<PermissionInf> {

    List<PermissionInf> listAllPermission();
}
