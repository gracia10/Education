package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;

public class LogonMainAction implements action.CommandAction {//?��?���?리메?�� ?��?���?

    public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {

        return "/Jo/logon/main.jsp";//?��?�� �?
    }
}