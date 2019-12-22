package personal.wjb.csi.service;

import com.baomidou.mybatisplus.service.IService;
import personal.wjb.csi.bean.PermissionInf;

import java.util.List;

/**
 * ClassName : PermissionInfService
 * Package : personal.wjb.csi.service
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/21 19:05
 */
public interface PermissionInfService extends IService<PermissionInf> {

    /**
     * 获取全部权限
     * @return
     */
    List<PermissionInf> listAllPermission();
}
