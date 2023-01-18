package servlet;

import helper.ConnectionProvider;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDao;
import dao.coordinatorDao;

/**
 * Servlet implementation class RestoreCoordinator
 */
@WebServlet("/RestoreCoordinator")
public class RestoreCoordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestoreCoordinator() {
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
			int coordinator_id = Integer.parseInt(request.getParameter("coordinator_id"));
			Connection con = ConnectionProvider.getMysqlConnection();
			coordinatorDao coorDao = new coordinatorDao(con);
			rs = coorDao.restoreCoordinatorDetails(coordinator_id);
			if(rs == 0) {
				System.out.println("sommething went wrong in restoring coordinator");
				response.sendRedirect("adminDashboard.jsp");
			}
			else {
				response.sendRedirect("adminDashboard.jsp");
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
