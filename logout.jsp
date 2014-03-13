<%@ page errorPage="ShowError.jsp" %>
<html>
<head>
<title>Logout Page</title>
</head>
<body>
<%

try{
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index2.html");
}

catch(Exception e)
{
throw new Exception(e);
}
%>

</body>
</html>