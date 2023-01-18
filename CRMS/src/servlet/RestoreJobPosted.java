package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JobDao;
import dao.StudentDao;

/**
 * Servlet implementation class RestoreJobPosted
 */
@WebServlet("/RestoreJobPosted")
public class RestoreJobPosted extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestoreJobPosted() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rs = 0;
		try {
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			Connection con = ConnectionProvider.getMysqlConnection();
			JobDao jobDao = new JobDao(con);
			rs = jobDao.restoreJobDetails(jobId);
			if(rs == 0) {
				System.out.println("sommething went wrong in restoring student");
				response.sendRedirect("coordinatorDashBoard.jsp");
			}
			else {
				response.sendRedirect("coordinatorDashBoard.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("inside restore student servlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
