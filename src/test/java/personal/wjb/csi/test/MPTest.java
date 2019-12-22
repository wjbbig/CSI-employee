package personal.wjb.csi.test;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MPTest {
    private ApplicationContext context = null;

    {
        context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
    }

//    @Test
//    public void testGenerator(){
//        //1.全局配置
//        GlobalConfig config = new GlobalConfig();
//        config.setActiveRecord(true)
//                .setAuthor("wujiabin") //作者
//                .setOutputDir("E:\\CSI-employee\\src\\main\\java")
//                .setFileOverride(true) //文件覆盖
//                .setIdType(IdType.AUTO)
//                .setServiceName("%sService")
//                .setBaseResultMap(true)
//                .setBaseColumnList(true);
//
//        //2.数据源配置
//        DataSourceConfig dataSourceConfig = new DataSourceConfig();
//        dataSourceConfig.setDbType(DbType.MYSQL) //设置数据库类型
//                        .setDriverName("com.mysql.cj.jdbc.Driver")
//                        .setUsername("root")
//                        .setPassword("wjb12345")
//                        .setUrl("jdbc:mysql:///csi");
//
//        //3.策略配置
//        StrategyConfig strategyConfig = new StrategyConfig();
//        strategyConfig.setCapitalMode(true) //全局大写命名
//                        .setDbColumnUnderline(true)
//                        .setNaming(NamingStrategy.underline_to_camel); //数据表映射到实体的命名策略
//
//        //4.包名策略配置
//        PackageConfig packageConfig = new PackageConfig();
//        packageConfig.setParent("personal.wjb.csi")
//                .setMapper("mapper")
//                .setService("service")
//                .setController("controller")
//                .setEntity("bean")
//                .setXml("mapper");
//
//        //5.整合配置
//        AutoGenerator autoGenerator = new AutoGenerator();
//        autoGenerator.setGlobalConfig(config)
//                .setDataSource(dataSourceConfig)
//                .setStrategy(strategyConfig)
//                .setPackageInfo(packageConfig);
//
//        //6.执行
//        autoGenerator.execute();
//    }
}
