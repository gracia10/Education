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

public class ItemModifyProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub		
		
		String realPath = "";
        String savePath = "itemSave";
        String type = "utf-8";
        int maxSize = 5*1024*1024;//5M
		
		ManageDBBean dbPro = ManageDBBean.getInstance();

		ItemDataBean article = new ItemDataBean();

        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();
        
        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy()); 
    		article.setItem_name(multi.getParameter("item_name"));
    		article.setItem_count(Integer.parseInt(multi.getParameter("item_count")));     	
        	Enumeration files = multi.getFileNames();
        	while(files.hasMoreElements()){
        	   String name = (String)files.nextElement();
        	   saveFiles.add(multi.getFilesystemName(name));
        	   origFiles.add(multi.getOriginalFileName(name));
        	}

        }catch(IOException ioe){
        	System.out.println(ioe);
        }catch(Exception ex){
        	System.out.println(ex);
        }
        
        for(int i=0; i<origFiles.size();i++) {
	    	String path = realPath + "\\" +(String)origFiles.get(i);
	    	article.setItem_img(path);
	    	
	    	String name = article.getItem_name();
	    	
	    	dbPro.modify_ItemArticle(article);
        }
       
		return "/administer/ItemModifyPro.jsp";
	}

}

