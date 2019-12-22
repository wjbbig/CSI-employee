package personal.wjb.csi.exception;

/**
 * ClassName:LoginException
 * PackName:personal.wjb.csi.exception
 * Description:
 *
 * @Date:2019/9/11 15:37
 * @Author:975475688@qq.com
 */
public class LoginFailException extends RuntimeException {
    public LoginFailException(String message){
        super(message);
    }
}
