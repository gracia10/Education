package main_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class QnaModifyAction implements action.CommandAction {
   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("utf-8");
      
      String i_no = request.getParameter("i_num");
       if (i_no == null) {
          i_no = "1";
       }
      int i_num = Integer.parseInt(i_no);
      
      String i_subject = request.getParameter("i_subject");
      String i_content = request.getParameter("i_content");
      
      MainDBBean dbPro = MainDBBean.getInstance();//DB연동
      MainDataBean content = dbPro.getQnaContent(i_num);
      request.setAttribute("i_num", content.getI_num());
      request.setAttribute("i_subject", content.getI_subject());
      request.setAttribute("i_content", content.getI_content());
      
/*      System.out.println("알아보자 : "+i_num);
      System.out.println("알아보자 : "+i_subject);
      System.out.println("알아보자 : "+i_content);*/
      
      String update = request.getParameter("update");
      if (update != null) {
      dbPro.updateQna(i_num,i_subject,i_content);
      System.out.println("=============333");
      }
      

            
      return "/main/QnaModify.jsp";
   }
}