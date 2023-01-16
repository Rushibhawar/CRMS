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

import dao.AdminDao;
import dao.JobDao;
import entity.Admin;
import entity.Job;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post posting");
		PrintWriter out = response.getWriter();
		
		try{
			String currentcoordinatorName =request.getParameter("currentcoordinatorName");
			int currentcoordinatorId = Integer.parseInt(request.getParameter("currentcoordinatorId"));
			System.out.println(currentcoordinatorName+"&"+currentcoordinatorId);
			String jobTile =request.getParameter("jobTile");
			String jobCompanyName =request.getParameter("jobCompanyName");
			String jonDescription =request.getParameter("jonDescription");
			
			Job job = new Job(jobTile, jobCompanyName, jonDescription, currentcoordinatorId,currentcoordinatorName);
			Connection con = ConnectionProvider.getMysqlConnection();
			JobDao jobDao = new JobDao(con);
			int rs = jobDao.insertJob(job);
				
			if(rs > 0)
			{
				System.out.println("stored successfully."+rs);
				//response.sendRedirect("coordinatorDashBoard.jsp");
			}else
			{
				System.out.println("Failed to store.");
				//response.sendRedirect("coordinatorDashBoard.jsp");
			}

		}catch(Exception e){
			e.printStackTrace();
			System.out.println("inside insert post job servlet");
		}
	}

}
