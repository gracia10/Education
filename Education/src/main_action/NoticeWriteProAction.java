package main_action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.MainDBBean;
import main.NoticeDataBean;
import main.NoticeLoadDataBean;
import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDBBean;

public class NoticeWriteProAction implements action.CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
        String realPath = "";
        String savePath = "noticeSave";
        String type = "utf-8";
        int maxSize = 5*1024*1024;//5M
		
		MainDBBean dbPro = MainDBBean.getInstance();
		int x = dbPro.get_seq_n_num(); // 새 공지게시판 시퀀스 넘버
		NoticeDataBean article = new NoticeDataBean();

        ServletContext context = request.getSession().getServletContext();
        realPath = context.getRealPath(savePath);
        ArrayList saveFiles = new ArrayList();
        ArrayList origFiles = new ArrayList();

        try
        {
        	MultipartRequest multi = new MultipartRequest( request,realPath,maxSize,type,new DefaultFileRenamePolicy());
        	
        	article.setN_subject(multi.getParameter("n_subject"));
        	article.setN_content(multi.getParameter("n_content"));
        	article.setN_reg_date(new Timestamp(System.currentTimeMillis()));
        	article.setN_readcount(0);
        	       	
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
    		NoticeLoadDataBean article_load = new NoticeLoadDataBean();
        	String path = realPath + "\\" +(String)origFiles.get(i);
        	String fl_subject = (String)origFiles.get(i);
        	article_load.setN_num(x);
        	article_load.setNo_path(path);
        	article_load.setNo_subject(fl_subject);
        	list.add(article_load);
        }

        dbPro.insert_NoticeArticle(article);
        
        dbPro.insert_NoticeLoadArticle(x,list);
		
		return "/main/NoticeWritePro.jsp";
	}

}
