<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page errorPage="ShowError.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style rel='stylesheet' type='text/css'>
div#container {
    position: relative;
    margin: 0 auto;
	height: 610px;
	max-width: 1200px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Chipotle Admin page</title>
</head>
<body>
<%
String fillings = request.getParameter("fillings");
String price_fillings = request.getParameter("price1");

String tacos = request.getParameter("tacos");
String price_tacos = request.getParameter("price2");

String sides = request.getParameter("sides");
String price_sides = request.getParameter("price3");

String drinks = request.getParameter("drinks");
String price_drinks = request.getParameter("price4");

if (request.getMethod().equalsIgnoreCase("POST")) {

String url = "jdbc:mysql://localhost:3306/onlinesite";
    	try
    	{

      	Class.forName("com.mysql.jdbc.Driver");
      	Connection con = DriverManager.getConnection(url, "root", "udfoodie");
        String update = "";
        Statement st = null;
		st = con.createStatement();
		
		if(!fillings.equals("select"))
		{
		 if(price_fillings == null || price_fillings == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else { 
		 update = "update chipotle_menu set price = "+Float.valueOf(price_fillings)+" where item = '"+fillings+"';"; }
		}
		else if(!tacos.equals("select"))
		{
		 out.println("i am in tacos");
		 if(price_tacos == null || price_tacos == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update chipotle_menu set price = "+Float.valueOf(price_tacos)+" where item = '"+tacos+"';"; }
		}
		else if(!sides.equals("select"))
		{
		 if(price_sides == null || price_sides == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		 update = "update chipotle_menu set price = "+Float.valueOf(price_sides)+" where item = '"+sides+"';"; }
		}
		else if(!drinks.equals("select"))
		{
		 if(price_drinks == null || price_drinks == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update chipotle_menu set price = "+Float.valueOf(price_drinks)+" where item = '"+drinks+"';"; }
		}
		else { %>
		<p>Please select an option<p>
		<%}
		st.executeUpdate(update);
		response.sendRedirect("confirm_admin.html");
      	con.close();

  	}
  	catch (Exception ex)
  	{
      	throw new Exception(ex);
  	}
}

%>

</body>
</html>
