<%@ page import="pe.edu.pucp.lab10.Beans.Country" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaPaises" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab10.Beans.Country>"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear una ubicación</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="loc"/>
            </jsp:include>
            <div class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear una ubicación</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/LocationServlet?action=crear">
                        <div class="mb-3">
                            <label class="form-label" for="id">Location ID</label>
                            <input type="text" class="form-control" name="id" id="id">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="streetAddress">Street Address</label>
                            <input type="text" class="form-control" name="streetAddress" id="streetAddress"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="postalCode">Postal Code</label>
                            <input type="text" class="form-control" name="postalCode" id="postalCode"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="city">City</label>
                            <input type="text" class="form-control" name="city" id="city"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="stateProvince">State Province</label>
                            <input type="text" class="form-control" name="stateProvince" id="stateProvince"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="countryId">Country</label>
                            <select name="countryId" id="countryId" class="form-control">
                                <% for (Country country : listaPaises) {%>
                                <option value="<%=country.getCountryId()%>"><%=country.getCountryName()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <a href="<%= request.getContextPath()%>/LocationServlet" class="btn btn-danger">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>
