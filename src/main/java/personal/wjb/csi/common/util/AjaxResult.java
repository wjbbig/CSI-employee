package personal.wjb.csi.common.util;


import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:AjaxResult
 * PackName:personal.wjb.csi.common.util
 * Description: ajax请求返回的数据辅助类
 *
 * @Date:2019/9/11 14:40
 * @Author:975475688@qq.com
 */
public class AjaxResult {

    private String msg;
    private boolean success;
    private Map<String,Object> map = new HashMap<>();

    public static AjaxResult success(String msg){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        ajaxResult.setMsg(msg);
        return ajaxResult;
    }

    public static AjaxResult failed(String msg){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setMsg(msg);
        ajaxResult.setSuccess(false);
        return ajaxResult;
    }

    public AjaxResult add(String key,Object value){
        this.getMap().put(key,value);
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }


}
