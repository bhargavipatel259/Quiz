package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.EditProfileBean;
import Model.EditProfileDao;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
		// TODO Auto-generated method stub
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String profilepic = request.getParameter("profilepic");
		HttpSession session = request.getSession();

		String email = session.getAttribute("email").toString();
		System.out.println(email);
		EditProfileBean s = new EditProfileBean();
		s.setFirstname(firstname);
		s.setLastname(lastname);
		System.out.println(profilepic);
		EditProfileDao d = new EditProfileDao();
		String values = d.storevalues(s);
		if(values.equals("SUCCESS"))
		{
			response.sendRedirect("Profile.jsp?msg=editprofile sucessful");
	
		}
		else {
			request.setAttribute("errMessage", values);
			request.getRequestDispatcher("/EditProfile.jsp").forward(request,response);
			
		}
		



	}

}
