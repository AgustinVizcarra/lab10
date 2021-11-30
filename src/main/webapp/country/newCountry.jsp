<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear un Pais</title>
        <jsp:include page="../includes/headCss.jsp" />
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="cou" />
            </jsp:include>
            <div class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear un Pais</h1>
                    <jsp:include page="../includes/infoMsgs.jsp" />
                    <form method="POST" action="<%=request.getContextPath()%>/CountryServlet?action=crear">
                        <div class="mb-3">
                            <label class="form-label" for="id">Country ID</label>
                            <input type="text" class="form-control" name="id" id="id"/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="countryName">Country name</label>
                            <input type="text" class="form-control" name="countryName" id="countryName" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="regionId">Region Id</label>
                            <input type="text" class="form-control" name="regionId" id="regionId" />
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
