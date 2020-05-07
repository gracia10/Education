package action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import manage.ManageDBBean;

public class ZipCheckAction implements CommandAction {// 입력된 글 처리

    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String check = request.getParameter("check");
        String zipcode = request.getParameter("zipcode");
        String area1 = request.getParameter("area1");
        String area2 = request.getParameter("area2");
        String area3 = request.getParameter("area3");
        String area4 = request.getParameter("area4");
        
       // String id = request.getParameter("id");//사용자입력 아이디
		
        System.out.println("은주야:::"+area4);
        
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB처리
        Vector totalList = dbPro.zipcodeRead(area4);

        //해당 뷰에서 사용할 속성
        request.setAttribute("check", check);
        request.setAttribute("zipcode", zipcode);
        request.setAttribute("area1", area1);
        request.setAttribute("area2", area2);
        request.setAttribute("area3", area3);
        request.setAttribute("area4", area4);
	
        request.setAttribute("totalList", totalList);
        
	
	
	//request.setAttribute("check", new Integer(check)); 
        

        return "/administer/zipCheck.jsp";//해당 뷰
    }
}