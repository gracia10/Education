package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import action.NullAction;

public class ControllerUsingURI2 extends HttpServlet {

	private Map commandMap = new HashMap();

	public void init() throws ServletException {
		String props = getInitParameter("configFile2"); // props = "WEB-INF/commandHandlerURI.properties"

		Properties pr = new Properties();
		FileInputStream f = null;

		try {
			String configFilePath = getServletContext().getRealPath(props); // D:\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Education\WEB-INF\commandHandlerURI.properties

			f = new FileInputStream(configFilePath);
			pr.load(f);

		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}

		Iterator keyIter = pr.keySet().iterator();

		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String className = pr.getProperty(command);
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);

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
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String view = null;
		CommandAction com = null;

		try {

			String command = request.getRequestURI();

			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
			}

			com = (CommandAction) commandMap.get(command);

			if (com == null) {
				com = new NullAction();
			}

			response.setContentType("text/html; charset=UTF-8");
			view = com.requestPro(request, response);

			if (!view.equals("AjaxCall")) {
				if(view.contains(".do")) {
					response.sendRedirect(view);
				}else {
					request.getRequestDispatcher(view).forward(request, response);
				}
			}
		} catch (Throwable e) {
			throw new ServletException(e);
		}

	}

}