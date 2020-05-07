//TeacherIntroAction.java

package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class TeacherIntroAction implements action.CommandAction {
   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      request.setCharacterEncoding("utf-8"); 
      String t_name = request.getParameter("t_name");
      String t_id = request.getParameter("t_id");
      String eunju = request.getParameter("eunju");
      
      
      MainDBBean dbPro = MainDBBean.getInstance();//DB연동
      
      
      ArrayList pro1 = dbPro.getT_ProfileList();
      request.setAttribute("pro1", pro1);
      request.setAttribute("eunju", eunju);
      System.out.println("eunju는 : "+eunju);
      
      //선생님 프로필 조회
      ArrayList<MainDataBean> totalList = dbPro.getTeacherProfile(t_id); 
                  
        request.setAttribute("list1", totalList);
        
      return "/main/TeacherProfile.jsp";
   }
}