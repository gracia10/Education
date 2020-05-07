package action.SH;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.CommandAction;

public class ImageUploadAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("==================파일 저장==============================");

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uploadPath = request.getSession().getServletContext().getRealPath("Sunghee/Diary/d_img");
		System.out.println("저장 경로::"+uploadPath);		
		
		int size = 10 * 1024 * 1024;
		String fileName = ""; 
		
		try{
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String)files.nextElement();
			fileName = multi.getFilesystemName(file); 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		uploadPath = "/Education/Sunghee/Diary/d_img/" + fileName;
		System.out.println("업로드 경로::"+uploadPath);
		
		JSONObject jobj = new JSONObject();
		jobj.put("url", uploadPath);
		
		PrintWriter out = response.getWriter();
		out.print(jobj.toJSONString());
		
		return  "A";
	}

}
