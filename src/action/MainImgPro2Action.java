package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class MainImgPro2Action implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		MainDBBean dbPro = MainDBBean.getInstance();//DB¿¬µ¿
		ArrayList<MainDataBean> list = dbPro.get_serviceImg();
		
		
		return "/administer/MainImgPro2.jsp";
	}

}
