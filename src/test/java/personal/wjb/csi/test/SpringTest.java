package personal.wjb.csi.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import personal.wjb.csi.bean.*;
import personal.wjb.csi.common.util.DateToStringUtil;
import personal.wjb.csi.common.util.Md5Util;
import personal.wjb.csi.mapper.*;
import personal.wjb.csi.service.UserInfService;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

/**
 * ClassName:SpringTest
 * PackName:personal.wjb.csi.test
 * Description:
 *
 * @Date:2019/9/10 8:20
 * @Author:975475688@qq.com
 */
public class SpringTest {

    private ApplicationContext ioc = null;
    private UserInfMapper userInfMapper = null;
    private DeptInfMapper deptInfMapper = null;
    private UserInfService userInfService = null;
    private DocumentInfMapper documentInfMapper = null;

    {
        ioc = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        userInfMapper = ioc.getBean(UserInfMapper.class);
        userInfService = ioc.getBean(UserInfService.class);
        deptInfMapper = ioc.getBean(DeptInfMapper.class);
        documentInfMapper = ioc.getBean(DocumentInfMapper.class);
    }

    @Test
    public void dataSourceTest() throws SQLException {
        DataSource dataSource = (DataSource) ioc.getBean("dataSource");
        System.out.println(dataSource.getConnection());
    }

    @Test
    public void getUserInfTest(){
        Map<String,Object> map = new HashMap<>();
        map.put("username","superadmin");
        map.put("password", Md5Util.digest("123456"));
        UserInf userInf = userInfMapper.getUserByUsernameAndPassword(map);
        System.out.println(userInf);
    }

    @Test
    public void testAddUser(){
        UserInf userInf = new UserInf(null,"superadmin",Md5Util.digest("123456"), DateToStringUtil.dataToString(new Date()),"吴家彬");
        userInf.setRoleInf(new RoleInf(1,null));
        boolean b = userInfService.addNewUser(userInf);
        System.out.println(b);
    }

    @Test
    public void testListUsers(){
        List<UserInf> userInfs = userInfService.listUsers("super%", 0);
        System.out.println(userInfs.get(0).getRoleInf().getId());
    }

    @Test
    public void testUpdateUser(){
        UserInf userInf = new UserInf(11,null,Md5Util.digest("123456"),null,null);

        int b = userInfMapper.updateUserInf(userInf);
        System.out.println(b);
    }

    @Test
    public void testGetUserById(){
        UserInf user = userInfMapper.getUserById(13);
        System.out.println(user);
    }

    @Test
    public void testGetCountByDeptName(){
        int count = deptInfMapper.getCountByDeptName("研jj发部");
        System.out.println(count);
    }

    @Test
    public void testListAllDocuments(){
        List<DocumentInf> documentInfs = documentInfMapper.ListAllDocuments("%%");
        System.out.println(documentInfs);
    }

    @Test
    public void testListAllNotice(){
        NoticeInfMapper noticeInfMapper = ioc.getBean(NoticeInfMapper.class);
        List a = noticeInfMapper.listAllNotices("%%");
        System.out.println(a);
    }

    @Test
    public void testAddNewEmp(){
        EmployeeInfMapper employeeInfMapper = ioc.getBean(EmployeeInfMapper.class);
        EmployeeInf employeeInf = new EmployeeInf(null,"aaa","123123123123123123","江苏省苏州市","123123","12345612345","12312344","wjb@qq.com",
                "1","1","1997年01月14号","汉","1","计算机","吃饭","qqqq",new JobInf(1,null,null,null),new DeptInf(1,null,null));
        int i = employeeInfMapper.addNewEmp(employeeInf);
        System.out.println(i);
    }

    @Test
    public void testGetEmp(){
        EmployeeInfMapper employeeInfMapper = ioc.getBean(EmployeeInfMapper.class);
        EmployeeInf empById = employeeInfMapper.getEmpById(3);
        System.out.println(empById);
    }

    @Test
    public void testAddPermission(){
        List<Integer> idList = new ArrayList<>();
        idList.add(2);
        idList.add(3);
        idList.add(1);
        RoleInfMapper roleInfMapper = ioc.getBean(RoleInfMapper.class);
        roleInfMapper.deletePermissionByRoleId(1);
        roleInfMapper.addPermissionByRoleId(idList,1);
    }
}
