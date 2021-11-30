<%@page import="com.example.webapphr3.Beans.Country" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="country" scope="request" type="com.example.webapphr3.Beans.Country"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar un Pais</title>
        <jsp:include page="../includes/headCss.jsp"/>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="cou"/>
            </jsp:include>
            <div class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <h1 class='mb-3'>Editar un Pais</h1>
                    <jsp:include page="../includes/infoMsgs.jsp"/>
                    <form method="POST" action="<%=request.getContextPath()%>/CountryServlet?action=crear">
                        <input type="hidden" class="form-control" name="id" value="<%=country.getCountryId()%>">
                        <div class="mb-3">
                            <label class="form-label" for="countryName">Country name</label>
                            <input type="text" class="form-control" name="countryName" id="countryName"
                                   value="<%=country.getCountryName()%>" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="regionId">Region Id</label>
                            <input type="text" class="form-control" name="regionId" id="regionId"
                                   value="<%=country.getRegionId() %>" />
                        </div>
                        <a href="<%= request.getContextPath()%>/CountryServlet" class="btn btn-danger">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"/>
    </body>
</html>
