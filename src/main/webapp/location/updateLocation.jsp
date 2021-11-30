<%@ page import="com.example.webapphr3.Beans.Country" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaPaises" scope="request" type="java.util.ArrayList<com.example.webapphr3.Beans.Country>"/>
<jsp:useBean id="location" scope="request" type="com.example.webapphr3.Beans.Location"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar una ubicación</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="loc"/>
            </jsp:include>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Editar una ubicación</h1>
                    <form method="POST" action="<%=request.getContextPath()%>/LocationServlet?action=crear">
                        <input type="hidden" class="form-control" name="id" value="<%=location.getLocationId()%>">
                        <div class="mb-3">
                            <label class="form-label" for="streetAddress">Street Address</label>
                            <input type="text" class="form-control" name="streetAddress" id="streetAddress"
                                   value="<%=location.getStreetAddress() %>"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="postalCode">Postal Code</label>
                            <input type="text" class="form-control" name="postalCode" id="postalCode"
                                   value="<%=location.getPostalCode() %>"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="city">City</label>
                            <input type="text" class="form-control" name="city" id="city"
                                   value="<%=location.getCity() %>"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="stateProvince">State Province</label>
                            <input type="text" class="form-control" name="stateProvince" id="stateProvince"
                                   value="<%=location.getStateProvince() %>"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="countryId">Country</label>
                            <select name="countryId" id="countryId" class="form-control">
                                <% for (Country country : listaPaises) {%>
                                <option value="<%=country.getCountryId()%>" <%=country.getCountryId().equals(location.getCountry().getCountryId()) ? "SELECTED" : ""%>>
                                    <%=country.getCountryName()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                        <a href="<%= request.getContextPath()%>/LocationServlet" class="btn btn-danger">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>
