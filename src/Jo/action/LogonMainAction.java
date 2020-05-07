package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LogonMainAction implements action.CommandAction {//?öå?õêÍ¥?Î¶¨Î©î?ù∏ ?éò?ù¥Ïß?

    public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {

        return "/Jo/logon/main.jsp";//?ï¥?ãπ Î∑?
    }
}