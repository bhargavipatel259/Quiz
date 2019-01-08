package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AuthDao;
import Model.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		 
		boolean result = AuthDao.checkUserPass(username,password,role); 
		if(result){
		int userid = AuthDao.getUserId(username);
		UserBean userBean = new UserBean();
		userBean = AuthDao.getUserById(userid);
		request.getSession().setAttribute("username", username);
		request.getSession().setAttribute("role", role);
		request.getSession().setAttribute("firstname", userBean.getFirstname());
		request.getSession().setAttribute("lastname", userBean.getLastname());
		
		out.println("<script type=\"text/javascript\">");
        out.println("alert('Login Successfull!')"); 
        out.println("location='Success.jsp';");
        out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("Success.jsp");  
        rd.include(request,response);
		}
		else{
		request.setAttribute("errMessage", "Information does not exist");
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
        rd.include(request,response);
		}	
	}

}
