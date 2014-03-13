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
<title>BWW Admin page</title>
</head>
<body>
<%
String sharables = request.getParameter("sharables");
String price_sharables = request.getParameter("price1");

String sides = request.getParameter("sides");
String price_sides = request.getParameter("price2");

String salads = request.getParameter("salads");
String price_salads = request.getParameter("price3");

String hand_spun = request.getParameter("hand_spun");
String price_hand_spun = request.getParameter("price4");

String boneless = request.getParameter("boneless");
String price_boneless = request.getParameter("price5");

String price_combo = request.getParameter("price6");

String tenders = request.getParameter("tenders");
String price_tenders = request.getParameter("price7");

String wraps = request.getParameter("wraps");
String price_wraps = request.getParameter("price8");

String burgers = request.getParameter("burgers");
String price_burgers = request.getParameter("price9");

String additions = request.getParameter("additions");
String price_additions = request.getParameter("price10");

String sandwiches = request.getParameter("sandwiches");
String price_sandwiches = request.getParameter("price11");

String flatbreads = request.getParameter("flatbreads");
String price_flatbreads = request.getParameter("price12");

String desserts = request.getParameter("desserts");
String price_desserts = request.getParameter("price13");

String drinks = request.getParameter("drinks");
String price_drinks = request.getParameter("price14");

String kids = request.getParameter("kids");
String price_kids = request.getParameter("price15");

String substitutes = request.getParameter("substitutes");
String price_substitutes = request.getParameter("price16");


if (request.getMethod().equalsIgnoreCase("POST")) {

String url = "jdbc:mysql://localhost:3306/onlinesite";
    	try
    	{

      	Class.forName("com.mysql.jdbc.Driver");
      	Connection con = DriverManager.getConnection(url, "root", "udfoodie");
        String update = "";
        Statement st = null;
		st = con.createStatement();
		
		if(!sharables.equals("select"))
		{
		 if(price_sharables == null || price_sharables == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else { 
		 update = "update bww_menu set price = "+Float.valueOf(price_sharables)+" where item = '"+sharables+"' AND type='sharables';"; }
		}
        else if(!sides.equals("select"))
		{
		 if(price_sides == null || price_sides == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_sides)+" where item = '"+sides+"' AND type='sides';"; }
		}
		else if(!salads.equals("select"))
		{
		 if(price_salads == null || price_salads == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_salads)+" where item = '"+salads+"' AND type='salads';"; }
		}
		else if(!hand_spun.equals("select"))
		{
		 if(price_hand_spun == null || price_hand_spun == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_hand_spun)+" where item = '"+hand_spun+"' AND type='hand_spun';"; }
		}
		else if(!boneless.equals("select"))
		{
		 if(price_boneless == null || price_boneless == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_boneless)+" where item = '"+boneless+"' AND type='boneless';"; }
		}
		else if(price_combo == null || price_combo == "")
		{
		update = "update bww_menu set price = "+Float.valueOf(price_combo)+" where item = '"+boneless_traditional+"';"; }
		}
		else if(!tenders.equals("select"))
		{
		 if(price_tenders == null || price_tenders == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_tenders)+" where item = '"+tenders+"' AND type='tenders';"; }
		}
		else if(!wraps.equals("select"))
		{
		 if(price_wraps == null || price_wraps == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_wraps)+" where item = '"+wraps+"' AND type='wraps';"; }
		}
		else if(!burgers.equals("select"))
		{
		 if(price_burgers == null || price_burgers == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_burgers)+" where item = '"+burgers+"' AND type='burgers';"; }
		}
		else if(!burgers.equals("select"))
		{
		 if(price_burgers == null || price_burgers == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_burgers)+" where item = '"+burgers+"' AND type='burgers';"; }
		}
		else if(!additions.equals("select"))
		{
		 if(price_additions == null || price_additions == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_additions)+" where item = '"+additions+"' AND type='additions';"; }
		}
		else if(!sandwiches.equals("select"))
		{
		 if(price_sandwiches == null || price_sandwiches == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_sandwiches)+" where item = '"+sandwiches+"' AND type='sandwiches';"; }
		}
		else if(!flatbreads.equals("select"))
		{
		 if(price_flatbreads == null || price_flatbreads == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_flatbreads)+" where item = '"+flatbreads+"' AND type='flatbread';"; }
		}
		else if(!substitutes.equals("select"))
		{
		 if(price_substitutes == null || price_substitutes == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_substitutes)+" where item = '"+substitutes+"' AND type='substitutes';"; }
		}
		else if(!desserts.equals("select"))
		{
		 if(price_desserts == null || price_desserts == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_desserts)+" where item = '"+desserts+"' AND type='desserts';"; }
		}
		else if(!drinks.equals("select"))
		{
		 if(price_drinks == null || price_drinks == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_drinks)+" where item = '"+drinks+"' AND type='drinks';"; }
		}
		else if(!kids.equals("select"))
		{
		 if(price_kids == null || price_kids == "")
		 {%>
		 <p>Enter the new price<p>
		 <%
		 }
		 else {
		update = "update bww_menu set price = "+Float.valueOf(price_kids)+" where item = '"+kids+"' AND type='kids';"; }
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