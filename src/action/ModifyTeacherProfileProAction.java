package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.ManageDBBean;
import manage.TeacherProfileDataBean;

public class ModifyTeacherProfileProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
					
        String realPath = "";
        String savePath = "teaSave";
        String type = "utf-8";
        int maxSize = 5*1024*1024;//5M
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		
        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();
        TeacherProfileDataBean teacherList = null;
        
        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy());
    		String teacherid = multi.getParameter("t_id");
        	
        	teacherList = dbPro.getTeacherProfileList(teacherid);
        	teacherList.setT_id(multi.getParameter("t_id"));
        	teacherList.setT_intro(multi.getParameter("t_intro"));
        	teacherList.setT_career(multi.getParameter("t_career"));    
        	
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
	    	teacherList.setT_img(path);
	    	
	    	dbPro.updateTeacherProfile(teacherList.getT_id(), teacherList.getT_intro(), teacherList.getT_career(), teacherList.getT_img());
        }
		
		return "/administer/ModifyTeacherProfilePro.jsp";
	}
}
