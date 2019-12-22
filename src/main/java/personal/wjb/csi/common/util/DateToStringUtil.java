package personal.wjb.csi.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * ClassName:DateToStringUtil
 * PackName:personal.wjb.csi.common.util
 * Description:
 *
 * @Date:2019/9/12 20:46
 * @Author:975475688@qq.com
 */
public class DateToStringUtil {
   public static String dataToString(Date date){
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       return sdf.format(date);
   }

    public static String dataToStringYMD(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        return sdf.format(date);
    }
}
