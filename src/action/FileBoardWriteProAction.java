package action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDBBean;

public class FileBoardWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
        String realPath = "";
        String savePath = "fileSave";
        String type = "utf-8";
        int maxSize = 5*1024*1024;//5M
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		int x = dbPro.get_seq_f_num(); // 새 자료게시판 시퀀스 넘버
		FileBoardDataBean article = new FileBoardDataBean();

        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();

        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy());
        	
    		article.setF_num(x);
    		article.setF_pass(multi.getParameter("f_pass"));
    		article.setF_subject(multi.getParameter("f_subject"));
    		article.setF_content(multi.getParameter("f_content"));
    		article.setF_date(new Timestamp(System.currentTimeMillis()));
    		article.setT_name(multi.getParameter("t_name"));
        	       	
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
    		FileBoardLoadDataBean article_load = new FileBoardLoadDataBean();
        	String path = realPath + "\\" +(String)origFiles.get(i);
        	String fl_subject = (String)origFiles.get(i);
        	article_load.setF_num(x);
        	article_load.setFl_path(path);
        	article_load.setFl_subject(fl_subject);
/*        	article_load.getFl_subject();*/
        	list.add(article_load);
        }

        dbPro.insert_FileBoardArticle(article);
        
        dbPro.insert_FileBoardLoadArticle(x,list);
		
		return "/administer/FileBoardWritePro.jsp";
	}

}
