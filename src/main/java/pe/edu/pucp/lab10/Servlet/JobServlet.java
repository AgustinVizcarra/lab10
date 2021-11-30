package pe.edu.pucp.lab10.Servlet;



import pe.edu.pucp.lab10.Beans.Employee;
import pe.edu.pucp.lab10.Beans.Job;
import pe.edu.pucp.lab10.Dao.JobDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "JobServlet", urlPatterns = {"/JobServlet"})
public class JobServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Employee em = (Employee) session.getAttribute("employeeSession");

        if (em == null) {
            response.sendRedirect(request.getContextPath());
        } else {
            String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

            JobDao jobDao = new JobDao();
            RequestDispatcher view;
            Job job;
            String jobId;

            switch (action) {
                case "lista":
                    ArrayList<Job> listaTrabajos = jobDao.listarTrabajos();

                    request.setAttribute("lista", listaTrabajos);

                    view = request.getRequestDispatcher("jobs/listaJobs.jsp");
                    view.forward(request, response);
                    break;
                case "formCrear":
                    view = request.getRequestDispatcher("jobs/newJob.jsp");
                    view.forward(request, response);
                    break;
                case "editar":
                    jobId = request.getParameter("id");
                    job = jobDao.obtenerTrabajo(jobId);
                    if (job == null) {
                        response.sendRedirect(request.getContextPath() + "/JobServlet");
                    } else {
                        request.setAttribute("job", job);
                        view = request.getRequestDispatcher("jobs/updateJob.jsp");
                        view.forward(request, response);
                    }
                    break;
                case "guardar":
                    jobId = request.getParameter("id");
                    String jobTitle = request.getParameter("jobTitle");
                    int minSalary = Integer.parseInt(request.getParameter("minSalary"));
                    int maxSalary = Integer.parseInt(request.getParameter("maxSalary"));

                    job = jobDao.obtenerTrabajo(jobId);

                    if (job == null) {
                        try {
                            jobDao.crearTrabajo(jobId, jobTitle, minSalary, maxSalary);
                            session.setAttribute("msg","Trabajo creado exitosamente");
                            response.sendRedirect(request.getContextPath() + "/JobServlet");
                        } catch (SQLException e) {
                            session.setAttribute("err","Error al crear el trabajo");
                            response.sendRedirect(request.getContextPath() + "/JobServlet?action=formCrear");
                        }
                    } else {
                        try {
                            jobDao.actualizarTrabajo(jobId, jobTitle, minSalary, maxSalary);
                            session.setAttribute("msg","Trabajo actualizado exitosamente");
                            response.sendRedirect(request.getContextPath() + "/JobServlet");
                        } catch (SQLException e) {
                            session.setAttribute("err","Error al actualizar el trabajo");
                            response.sendRedirect(request.getContextPath() + "/JobServlet?action=editar&id="+jobId);
                        }
                    }
                    break;
                case "borrar":
                    jobId = request.getParameter("id");
                    if (jobDao.obtenerTrabajo(jobId) != null) {
                        try {
                            jobDao.borrarTrabajo(jobId);
                            request.getSession().setAttribute("msg", "Trabajo borrado exitosamente");
                            response.sendRedirect(request.getContextPath() + "/JobServlet");
                        } catch (SQLException e) {
                            e.printStackTrace();
                            request.getSession().setAttribute("err", "Error al borrar el trabajo");
                            response.sendRedirect(request.getContextPath() + "/JobServlet");
                        }
                    }else{
                        request.getSession().setAttribute("err", "Error al borrar el trabajo");
                        response.sendRedirect(request.getContextPath() + "/JobServlet");
                    }
                    break;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}
