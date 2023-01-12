package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JobDao;
import entity.ApplyJobFormApplication;


/**
 * Servlet implementation class ApplyJobForm
 */
@WebServlet("/ApplyJobForm")
public class ApplyJobForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyJobForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");
		
		// TODO Auto-generated method stub
				PrintWriter out = response.getWriter();
				
				String studentEmail = request.getParameter("studentEmail");
				String studentName = request.getParameter("studentName");
				String studentCourse = request.getParameter("studentCourse");
				String studentCollege = request.getParameter("studentCollege");
				String studentPhone = request.getParameter("studentPhone");
				String aboutYourself = request.getParameter("aboutYourself");
				int jobId = Integer.parseInt(request.getParameter("jobId"));
				String jobCompany = request.getParameter("jobCompany");
				String jobTitle = request.getParameter("jobTitle");
				
				ApplyJobFormApplication applyJobForm = new ApplyJobFormApplication(jobTitle, jobCompany, studentName, studentEmail, studentPhone, aboutYourself, jobId);
				try{
					Connection con = ConnectionProvider.getMysqlConnection();
					JobDao applyJobFormDao = new JobDao(con);
					int rs = applyJobFormDao.insertApplyJobForm(applyJobForm);
						
					if(rs > 0)
					{
						System.out.println("stored successfully."+rs);
						response.sendRedirect("adminLogin.jsp");
					}else
					{
						System.out.println("Failed to store.");
						response.sendRedirect("adminRegisterForm.jsp");
					}

				}catch(Exception e){
					e.printStackTrace();
					System.out.println(e+"inside insert servlet");
				}
		
	}

}
