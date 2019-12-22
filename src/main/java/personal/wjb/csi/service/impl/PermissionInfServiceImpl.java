package personal.wjb.csi.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.mapper.PermissionInfMapper;
import personal.wjb.csi.service.PermissionInfService;

import java.util.List;

/**
 * ClassName : PermissionInfServiceImpl
 * Package : personal.wjb.csi.service.impl
 * Description :
 *
 * @author : 975475688@qq.com
 * @date : 2019/9/21 19:06
 */
@Service
public class PermissionInfServiceImpl extends ServiceImpl<PermissionInfMapper, PermissionInf> implements PermissionInfService {

    @Autowired
    private PermissionInfMapper permissionInfMapper;

    @Override
    public List<PermissionInf> listAllPermission() {
        return permissionInfMapper.listAllPermission();
    }
}
