<%@page import="pe.edu.pucp.lab10.Beans.Department" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Department>" scope="request" id="lista"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista departamentos</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="dep"/>
            </jsp:include>
            <div class="row mb-5 mt-4">
                <div class="col-md-7">
                    <h1 class=''>Lista de Departamentos</h1>
                </div>
                <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
                    <a href="<%= request.getContextPath()%>/DepartmentServlet?action=formCrear" class="btn btn-primary">
                        Crear Departamento</a>
                </div>
            </div>
            <jsp:include page="../includes/infoMsgs.jsp"/>
            <table class="table">
                <tr>
                    <th>Department ID</th>
                    <th>Department name</th>
                    <th>Manager</th>
                    <th>Location</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    for (Department department : lista) {
                %>
                <tr>
                    <td><%=department.getDepartmentId()%>
                    </td>
                    <td><%=department.getDepartmentName()%>
                    </td>
                    <td><%=department.getManager() == null ? "--" : (department.getManager().getFirstName() + " " + department.getManager().getLastName()) %>
                    </td>
                    <td><%=department.getLocation() == null ? "--" : department.getLocation().getCity()%>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/DepartmentServlet?action=editar&id=<%=department.getDepartmentId()%>">
                            Editar
                        </a>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/DepartmentServlet?action=borrar&id=<%=department.getDepartmentId()%>">
                            Borrar
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>