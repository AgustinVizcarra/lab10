<%@page import="java.util.ArrayList" %>
<%@ page import="pe.edu.pucp.lab10.Beans.Job" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Job>" scope="request" id="lista"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='resources/css/bootstrap.min.css'/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="job"/>
            </jsp:include>
            <div class="row mb-5 mt-4">
                <div class="col-md-7">
                    <h1 class=''>Lista de trabajos en hr</h1>
                </div>
                <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
                    <a href="<%= request.getContextPath()%>/JobServlet?action=formCrear" class="btn btn-primary">Crear
                        Trabajo</a>
                </div>
            </div>
            <% if (request.getParameter("msg") != null) {%>
            <div class="alert alert-success" role="alert"><%=request.getParameter("msg")%>
            </div>
            <% } %>
            <% if (request.getParameter("err") != null) {%>
            <div class="alert alert-danger" role="alert"><%=request.getParameter("err")%>
            </div>
            <% } %>
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>Job ID</th>
                    <th>Job Name</th>
                    <th>Min Salary</th>
                    <th>Max Salary</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    int i = 1;
                    for (Job job : lista) {
                %>
                <tr>
                    <td><%=i%>
                    </td>
                    <td><%=job.getJobId()%>
                    </td>
                    <td><%=job.getJobTitle()%>
                    </td>
                    <td><%=job.getMinSalary()%>
                    </td>
                    <td><%=job.getMaxSalary()%>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/JobServlet?action=editar&id=<%=job.getJobId()%>">
                            Editar
                        </a>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/JobServlet?action=borrar&id=<%=job.getJobId()%>">
                            Borrar
                        </a>
                    </td>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>