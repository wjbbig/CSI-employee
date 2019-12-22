package personal.wjb.csi.listener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import personal.wjb.csi.bean.PermissionInf;
import personal.wjb.csi.common.util.Const;
import personal.wjb.csi.mapper.PermissionInfMapper;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class StartSystemListener implements ServletContextListener {

	//在服务器启动时,创建application对象时需要执行的方法.
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//1.将项目上下文路径(request.getContextPath())放置到application域中.
		ServletContext application = sce.getServletContext();
		String contextPath = application.getContextPath();
		application.setAttribute("APP_PATH", contextPath);

		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
		List<PermissionInf> permissionInfs = context.getBean(PermissionInfMapper.class).listAllPermission();
		Set<String> allUris = new HashSet<>();

		for(PermissionInf permission : permissionInfs){
			allUris.add("/"+permission.getHref());
		}

		application.setAttribute(Const.ALL_PERMISSION_URI,allUris);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
