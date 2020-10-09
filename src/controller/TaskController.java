package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TaskDAO;
import dao.TaskDAOImplementation;
import model.Task;


@WebServlet("/TaskController")
public class TaskController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private TaskDAO dao;
    public static final String LIST_ALL_TASKS = "/listalltasks.jsp";
    public static final String CREATE_OR_EDIT = "/createoredittask.jsp";
    
    public TaskController() {
        dao = new TaskDAOImplementation();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
        String action = request.getParameter("action");
        
        if( action.equalsIgnoreCase("edit")) {
            forward = CREATE_OR_EDIT;
            int id = Integer.parseInt(request.getParameter("id"));
            Task task = dao.getTaskById(id);
            request.setAttribute("task", task);
        }
        else if(action.equalsIgnoreCase("create")) {
            forward = CREATE_OR_EDIT;
        }
        else {
            forward = LIST_ALL_TASKS;
            request.setAttribute("tasks", dao.listAllTasks());
            
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward =  LIST_ALL_TASKS;
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteTask(id);
        request.setAttribute("tasks", dao.listAllTasks());
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Task task = new Task();
		task.setName(request.getParameter("name"));
		task.setDescription(request.getParameter("description"));
        String id = request.getParameter("id");
        task.setAssignedTo(request.getParameter("assignedTo"));
        task.setTypeTask(request.getParameter("typeTask"));
        task.setTaskStatus(request.getParameter("taskStatus"));
 
        if(id == null || id.isEmpty())
            dao.createTask(task);
        else {
            task.setId(Integer.parseInt(id));
            String dateCreated = request.getParameter("dateCreated");
            
            //setando data de conclus�o, talvez esteja errado 
            String dateConclusion = request.getParameter("dateConclusion");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date date;
			try {
				date = sdf.parse(dateCreated);
				java.sql.Date sqlDateCreated = new java.sql.Date(date.getTime());
				task.setDateCreated(sqlDateCreated);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            dao.editTask(task);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_ALL_TASKS);
        request.setAttribute("tasks", dao.listAllTasks());
        view.forward(request, response);
	}

}
