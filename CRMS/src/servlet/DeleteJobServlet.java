package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JobDao;
import entity.Coordinator;

/**
 * Servlet implementation class DeleteJobServlet
 */
@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobServlet() {
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
		int jobId = Integer.parseInt(request.getParameter("jobId"));
		JobDao jobDao = new JobDao(con);
		int rs = jobDao.deleteJobDetails(jobId);
		
		if(rs == 0) {
			System.out.println("sommething went wrong in delete job");
		}
		else {
			System.out.println("good to go delete redirect");
			HttpSession session = request.getSession();
			Coordinator coordinator = (Coordinator) session.getAttribute("currentUser");
			response.sendRedirect("coordinatorDashBoard.jsp?coordinatorId="+coordinator.getCoordinatorId()+"&coordinatorName="+coordinator.getCoordinatorName());
		}
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
