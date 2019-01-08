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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
          
        String fname=request.getParameter("firstname");
        String lname=request.getParameter("lastname");
        String uname=request.getParameter("username");
        String pass=request.getParameter("password");
        String role=request.getParameter("role");
        
        boolean checkusername = AuthDao.checkUserName(uname);
        
        if(checkusername){ 
        	boolean status = AuthDao.enterNewUser(uname,pass,role,fname,lname);
            
            if(status){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registered Successfully!')"); 
                out.println("location='Login.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
                rd.include(request,response); 
            }else{ 
            	out.println("<script type=\"text/javascript\">");
                out.println("alert('Register Error!')"); 
                out.println("location='Register.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Register.jsp");  
                rd.include(request,response); 
            }
        }else{
        	request.setAttribute("errMessage2", "Username already exists");
        	RequestDispatcher rd=request.getRequestDispatcher("Register.jsp");  
            rd.include(request,response); 
        }
        
	}

}
