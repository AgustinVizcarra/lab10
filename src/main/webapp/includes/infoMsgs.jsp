<% if (request.getParameter("msg") != null) {%>
<div class="alert alert-success" role="alert"><%=request.getParameter("msg")%>
</div>
<% } %>
<% if (request.getParameter("err") != null) {%>
<div class="alert alert-danger" role="alert"><%=request.getParameter("err")%>
</div>
<% } %>
