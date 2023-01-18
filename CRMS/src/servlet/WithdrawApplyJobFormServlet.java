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
import javax.servlet.http.HttpSession;

import dao.JobDao;
import entity.Coordinator;

/**
 * Servlet implementation class WithdrawApplyJobFormServlet
 */
@WebServlet("/WithdrawApplyJobFormServlet")
public class WithdrawApplyJobFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawApplyJobFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Connection con = ConnectionProvider.getMysqlConnection();
		int applied_job_id = Integer.parseInt(request.getParameter("applied_job_id"));
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		String studentName = request.getParameter("studentName");
		JobDao jobDao = new JobDao(con);
		int rs = jobDao.withdrawAppliedJobDetails(applied_job_id);
		
		if(rs == 0) {
			System.out.println("sommething went wrong in delete job");
		}
		else {
			System.out.println("good to go delete redirect");
			response.sendRedirect("http://localhost:8080/CRMS/studentDashBoard.jsp?studentId="+studentId+"&studentName="+studentName);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
