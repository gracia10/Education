package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.ItemDataBean;
import manage.ManageDBBean;

public class ItemDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub		
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		ItemDataBean article = new ItemDataBean(); 
		
		article.setItem_name(request.getParameter("item_name"));
        dbPro.delete_ItemArticle(article);
        
		return "/administer/ItemModifyPro.jsp";
	}

}

