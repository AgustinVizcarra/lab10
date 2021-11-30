<%@ page import="pe.edu.pucp.lab10.Beans.Employee" %>
<%@ page import="pe.edu.pucp.lab10.Beans.Location" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaLocations" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Location>"/>
<jsp:useBean id="listaEmpleados" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Employee>"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear un Departamento</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="dep"/>
            </jsp:include>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear un Departamento</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/DepartmentServlet?action=crear">
                        <div class="mb-3">
                            <label class="form-label" for="id">Department ID</label>
                            <input type="text" class="form-control" name="id" id="id" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="departmentName">Department name</label>
                            <input type="text" class="form-control" name="departmentName" id="departmentName" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="managerId">Manager</label>
                            <select name="managerId" id="managerId" class="form-control">
                                <option value="0">-- Sin Jefe --</option>
                                <% for (Employee e : listaEmpleados) {%>
                                <option value="<%=e.getEmployeeId()%>"><%=e.getFirstName() + " " + e.getLastName()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="locationId">Location</label>
                            <select name="locationId" id="locationId" class="form-control">
                                <option value="0">-- Sin Ubicación --</option>
                                <% for (Location l : listaLocations) {%>
                                <option value="<%=l.getLocationId()%>"><%=l.getCity()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <a href="<%= request.getContextPath()%>/DepartmentServlet" class="btn btn-danger">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>
