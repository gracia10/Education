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
import manage.ManageStudentDataBean;

public class ModifyStudentProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");// 한글 인코딩
		
		
		String realPath = "";
        String savePath = "stuSave";
        String type = "utf-8";
        int maxSize = 5*1024*1024;//5M
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		
        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();
        
        ManageStudentDataBean student = new ManageStudentDataBean();
      
        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy());

        	student.setS_no(Integer.parseInt(multi.getParameter("s_no")));
        	student.setS_name(multi.getParameter("s_name"));
        	student.setS_tel(multi.getParameter("s_tel"));
        	student.setS_birth(multi.getParameter("s_birth"));
        	student.setS_img(multi.getParameter("s_img"));
        	student.setU_id(multi.getParameter("u_id"));
        	student.setT_id(multi.getParameter("t_id"));    
        	
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
	    	student.setS_img(path);

			dbPro.updateStudent(student.getS_no(), student.getS_name(), student.getS_tel(), student.getS_birth(), student.getS_img(), student.getU_id(), student.getT_id());
			System.out.println("잘 실행됬음.");
        }
		
		return "/administer/ModifyStudentPro.jsp";
	}

}
