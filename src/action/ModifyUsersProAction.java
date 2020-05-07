package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;
import manage.ManageDataBean;

public class ModifyUsersProAction implements CommandAction {//회원정보수정 처리

    public String requestPro( HttpServletRequest request,HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("utf-8");

        String u_id = request.getParameter("u_id");
        ManageDataBean member = new ManageDataBean();

		member.setU_id(request.getParameter("u_id"));
        member.setU_pass(request.getParameter("u_pass"));
        member.setU_name(request.getParameter("u_name"));
        member.setU_tel(request.getParameter("u_tel"));
        member.setU_birth(request.getParameter("u_birth"));
        member.setU_addr(request.getParameter("u_addr"));
        
        
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
        dbPro.getMemberUsers(u_id);
        
        
        return "/administer/modifyPro.jsp";//해당 뷰
    }
}