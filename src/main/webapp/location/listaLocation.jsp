<%@page import="pe.edu.pucp.lab10.Beans.Location" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Location>" scope="request" id="lista"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de ubicaciones</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="loc"/>
            </jsp:include>
            <div class="row mb-5 mt-4">
                <div class="col-md-7">
                    <h1 class=''>Lista de Ubicaciones</h1>
                </div>
                <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
                    <a href="<%= request.getContextPath()%>/LocationServlet?action=formCrear" class="btn btn-primary">
                        Crear Ubicación</a>
                </div>
            </div>
            <jsp:include page="../includes/infoMsgs.jsp"/>
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>Location ID</th>
                    <th>Street Address</th>
                    <th>Postal Code</th>
                    <th>City</th>
                    <th>State Province</th>
                    <th>Country</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    int i = 1;
                    for (Location location : lista) {
                %>
                <tr>
                    <td><%=i%>
                    </td>
                    <td><%=location.getLocationId()%>
                    </td>
                    <td><%=location.getStreetAddress() %>
                    </td>
                    <td><%=location.getPostalCode() == null ? "--" : location.getPostalCode() %>
                    </td>
                    <td><%=location.getCity() %>
                    </td>
                    <td><%=location.getStateProvince() == null ? "--" : location.getStateProvince() %>
                    </td>
                    <td><%=location.getCountry().getCountryName() %>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/LocationServlet?action=editar&id=<%=location.getLocationId()%>">
                            Editar
                        </a>
                    </td>
                    <td>
                        <a href="<%=request.getContextPath()%>/LocationServlet?action=borrar&id=<%=location.getLocationId()%>">
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