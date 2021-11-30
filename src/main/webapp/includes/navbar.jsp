<%@ page import="com.example.webapphr3.Beans.Employee" %>
<% String currentPage = request.getParameter("currentPage"); %>
<jsp:useBean id="employee" type="com.example.webapphr3.Beans.Employee" scope="session"
             class="com.example.webapphr3.Beans.Employee"/>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a class="navbar-brand" href="#">Gestión HR</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <% if (employee.getEmployeeId() > 0) { %>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("cou") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/CountryServlet">
                    Country
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("loc") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/LocationServlet">
                    Location
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("dep") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/DepartmentServlet">
                    Department
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("emp") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/EmployeeServlet">
                    Employees
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("job") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/JobServlet">
                    Jobs
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=currentPage.equals("est") ? "active" : ""%>"
                   href="<%=request.getContextPath()%>/EmployeeServlet?action=est">
                    Estadísticas
                </a>
            </li>
            <li class="nav-item">
                <span class="nav-link text-dark">
                    Bienvenido <%=employee.getFirstName()%> <%=employee.getLastName()%> (<a
                        href="<%=request.getContextPath()%>/LoginServlet?action=logout">cerrar sesión</a>)
                </span>
            </li>
            <% } else { %>
            <a class="nav-link" style="color: #007bff;" href="<%=request.getContextPath()%>/LoginServlet">(Iniciar
                Sesión)</a>
            <% } %>
        </ul>
    </div>
</nav>
