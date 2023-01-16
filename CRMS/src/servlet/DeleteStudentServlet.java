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
import dao.StudentDao;
import entity.Coordinator;

/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentServlet() {
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
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		StudentDao studentDao = new StudentDao(con);
		int rs = studentDao.deleteStudentDetails(student_id);
		
		if(rs == 0) {
			System.out.println("sommething went wrong in delete student");
		}
		else {
			/*System.out.println("good to go delete redirect");
			HttpSession session = request.getSession();
			Coordinator coordinator = (Coordinator) session.getAttribute("currentUser");
			response.sendRedirect("coordinatorDashBoard.jsp?coordinatorId="+coordinator.getCoordinatorId()+"&coordinatorName="+coordinator.getCoordinatorName());*/
			response.sendRedirect("adminDashboard.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
