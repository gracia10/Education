package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import action.NullAction;

public class ControllerUsingURI2 extends HttpServlet {
  
    private Map commandMap = new HashMap(); //명령어와 명령어 처리 클래스를 쌍으로 저장
    
    public void init() throws ServletException {
    	System.out.println("ControllerUsingURI2 init() 들어옴");
    	
        String props = getInitParameter("configFile2");         //props = "WEB-INF/commandHandlerURI.properties"

        Properties pr = new Properties();
        FileInputStream f = null;
         
        try {
            String configFilePath = getServletContext().getRealPath(props);	//D:\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Education\WEB-INF\commandHandlerURI.properties
            
            f = new FileInputStream(configFilePath);
            pr.load(f);
            
        } catch (IOException e) {
            throw new ServletException(e);
        } finally {
            if (f != null) try { f.close(); } catch(IOException ex) {}
        }
        
        Iterator keyIter = pr.keySet().iterator();
        
        while( keyIter.hasNext() ) {
            String command = (String)keyIter.next();
            String className = pr.getProperty(command);
            try {
                Class commandClass = Class.forName(className);
                Object commandInstance = commandClass.newInstance();
                commandMap.put(command, commandInstance);     // 요청uri, 매핑-객체 
                
            } catch (ClassNotFoundException e) {
                throw new ServletException(e);
            } catch (InstantiationException e) {
                throw new ServletException(e);
            } catch (IllegalAccessException e) {
                throw new ServletException(e);
            }
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("control get 들어옴");
    	requestPro(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	System.out.println("control post 들어옴");
    	requestPro(request, response);
    }


    private void requestPro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
  	
    	String view = null;
    	CommandAction com=null;
    	
    	try {
    		
            String command = request.getRequestURI();
            
            if (command.indexOf(request.getContextPath()) == 0) {
               command = command.substring(request.getContextPath().length());
            }
            
            System.out.println("의도했던 페이지는:::"+command);
            
            com = (CommandAction)commandMap.get(command); 
            
		    if (com == null) {
		    	com = new NullAction();
		    }

		    view = com.requestPro(request, response);
		    response.setContentType("text/html; charset=UTF-8");
            
            System.out.println("보여줄 페이지는:::"+view);
            
        } catch(Throwable e) {
            throw new ServletException(e);
        }  
	
		if(!view.equals("A")) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	        dispatcher.forward(request, response);
	    }
		System.out.println("control requestpro 나감");
    }
    
    
}