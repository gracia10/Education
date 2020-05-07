package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import manage.ManageDBBean;

public class ItemPro2Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String item_name = request.getParameter("item_name3");
        String item_num = request.getParameter("item_num3");
        String item_count = request.getParameter("item_count3");
        
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB처리
        dbPro.modify_ItemReqArticle_plus(item_name, Integer.parseInt(item_count));
        dbPro.delete_ItemReqArticle(item_num);
		
		return "/administer/ItemPro.jsp";
	}

}
