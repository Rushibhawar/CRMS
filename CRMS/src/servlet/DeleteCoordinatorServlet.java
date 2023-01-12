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

import dao.StudentDao;
import dao.coordinatorDao;

/**
 * Servlet implementation class DeleteCoordinatorServlet
 */
@WebServlet("/DeleteCoordinatorServlet")
public class DeleteCoordinatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCoordinatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get delete");
		PrintWriter out = response.getWriter();
		Connection con = ConnectionProvider.getMysqlConnection();
		int coordinator_id = Integer.parseInt(request.getParameter("coordinator_id"));
		System.out.println(""+coordinator_id);
		coordinatorDao cooDao = new coordinatorDao(con);
		int rs = cooDao.deleteCoordinatorDetails(coordinator_id);
		
		if(rs == 0) {
			System.out.println("sommething went wrong in delete coordinator");
		}
		else {
			response.sendRedirect("http://localhost:8080/CRMS/adminDashboard.jsp");
			/*System.out.println("good to go delete redirect");
			HttpSession session = request.getSession();
			Coordinator coordinator = (Coordinator) session.getAttribute("currentUser");
			response.sendRedirect("coordinatorDashBoard.jsp?coordinatorId="+coordinator.getCoordinatorId()+"&coordinatorName="+coordinator.getCoordinatorName());*/
			/*response.sendRedirect("adminDashboard.jsp");*/
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
