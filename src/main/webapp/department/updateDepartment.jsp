<%@ page import="com.example.webapphr3.Beans.Department" %>
<%@ page import="com.example.webapphr3.Beans.Employee" %>
<%@ page import="com.example.webapphr3.Beans.Location" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaLocations" scope="request" type="java.util.ArrayList<com.example.webapphr3.Beans.Location>"/>
<jsp:useBean id="listaEmpleados" scope="request" type="java.util.ArrayList<com.example.webapphr3.Beans.Employee>"/>
<jsp:useBean id="department" scope="request" type="com.example.webapphr3.Beans.Department"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar un Departamento</title>
        <jsp:include page="../includes/headCss.jsp" />
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="dep"/>
            </jsp:include>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Editar un departamento</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/DepartmentServlet?action=crear">
                        <input type="hidden" class="form-control" name="id" value="<%=department.getDepartmentId()%>">
                        <div class="mb-3">
                            <label class="form-label" for="departmentName">Department name</label>
                            <input type="text" class="form-control" name="departmentName" id="departmentName"
                                   value="<%=department.getDepartmentName()%>" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="managerId">Manager</label>
                            <select name="managerId" id="managerId" class="form-control">
                                <option value="0" <%= department.getManager() == null ? "Selected" : "" %>>
                                    -- Sin Jefe --
                                </option>
                                <% for (Employee e : listaEmpleados) {%>
                                <option value="<%=e.getEmployeeId()%>" <%= (department.getManager() != null && e.getEmployeeId() == department.getManager().getEmployeeId()) ? "Selected" : "" %>>
                                    <%=e.getFirstName() + " " + e.getLastName()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="locationId">Location</label>
                            <select name="locationId" id="locationId" class="form-control">
                                <option value="0" <%= department.getLocation() == null ? "Selected" : "" %>>
                                    -- Sin Ubicación --
                                </option>
                                <% for (Location l : listaLocations) {%>
                                <option value="<%=l.getLocationId()%>" <%= (department.getLocation() != null && l.getLocationId() == department.getLocation().getLocationId()) ? "Selected" : "" %>>
                                    <%=l.getCity()%>
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
