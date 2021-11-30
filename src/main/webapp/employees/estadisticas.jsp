<%@page import="com.example.webapphr3.Dtos.SalarioPorDepartamentoDto" %>
<%@page import="com.example.webapphr3.Dtos.EmpleadosPorRegionDto" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaEmpleadPorRegion" type="java.util.ArrayList<com.example.webapphr3.Dtos.EmpleadosPorRegionDto>"
             scope="request"/>
<jsp:useBean id="listaSalarioPorDepa" type="java.util.ArrayList<com.example.webapphr3.Dtos.SalarioPorDepartamentoDto>"
             scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Estadísticas</title>
        <jsp:include page="../includes/headCss.jsp" />
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="est"/>
            </jsp:include>
            <h1 class='mb-5 mt-4'>Estadísticas</h1>
            <hr/>
            <h3 class='mb-3'>Cantidad de empleados por región </h3>
            <% for (EmpleadosPorRegionDto emp : listaEmpleadPorRegion) {%>
            <div class="row">
                <div class="col"><%=emp.getNombreRegion()%>: <%=emp.getCantidadEmpleados()%>
                </div>
            </div>
            <% } %>
            <hr/>
            <h3 class='mb-3'>Salario por departamento</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Departamento</th>
                        <th>Salario mínimo</th>
                        <th>Salario promedio</th>
                        <th>Salario máximo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i = 1;
                        for (SalarioPorDepartamentoDto dto : listaSalarioPorDepa) {
                    %>
                    <tr>
                        <td><%=i%>
                        </td>
                        <td><%=dto.getNombreDepartamento()%>
                        </td>
                        <td><%=dto.getSalarioMinimo()%>
                        </td>
                        <td><%=dto.getSalarioPromedio()%>
                        </td>
                        <td><%=dto.getSalarioMaximo()%>
                        </td>
                    </tr>
                    <%
                            i++;
                        }
                    %>
                </tbody>
            </table>
            <jsp:include page="../includes/footer.jsp"/>
        </div>
    </body>
</html>


