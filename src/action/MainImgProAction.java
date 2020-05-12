package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.MainImageDataBean;
import manage.ManageDBBean;

public class MainImgProAction implements CommandAction {
    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String realPath = "";
        String savePath = "mainSave";
        String type = "utf-8";
        String type1 = "";
        int maxSize = 5*1024*1024;//5M

        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();

        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy());
        	
        	type1 = multi.getParameter("type");
        	
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
        
        ArrayList list = new ArrayList();
        
        for(int i=0; i<origFiles.size();i++) {
            MainImageDataBean img = new MainImageDataBean();
        	String img_name = realPath + "\\" +(String)origFiles.get(i);
        	img.setM_type(type1);
        	img.setMain_img(img_name);
        	list.add(img);
        }

        ManageDBBean dbPro = ManageDBBean.getInstance();//DB처리
        dbPro.updateMainImg(list);
                
        return "/administer/HomepageManagePro.jsp";//해당 뷰
    }
}
