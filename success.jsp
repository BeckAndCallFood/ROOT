<%@ page import="java.util.*" %>
<html>
<head>
<style rel='stylesheet' type='text/css'>
div#heading {
max-width: 1200px;
height: 130px;
background:url(images/header.png) no-repeat left;
display:block;

}
div#container {
    position: relative;
    margin: 0 auto;
	height: 610px;
	max-width: 1200px;
}
div#heading {
    margin: 10px auto -1px auto;
}
div#heading h1 {
    margin: 0px;
	float: right;
}
div#left {
    margin-top: 0px;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    width: 300px;
    background: white;
    padding: 5px;
}
div#content {
    margin-left: 211px;
    background: white;
    border: 1px solid white;
    padding: 10px;
}
div#right {
    margin-left: 350px;
    background: white;
    border: 1px solid white;
    padding: 10px;
}
div#footer {
    float: center;
    position: relative;
    margin: -1px auto 10px auto;
	background: black;
	height: 50px;
	max-width: 1000px;
}
</style>
</head>
<title>
</title>
<body>
<div id="container">
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<br><br><br><br>
<p>You are not logged in<p><br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
<br>
<font color="red"><b>Welcome <%=session.getAttribute("userid")%> ,</b></font>
<br><br><br>

<b>Contact No : </b><%=session.getAttribute("no")%> 
<br>
<b>Email : </b><%=session.getAttribute("email")%> 
<br>
<b>Location : </b><%=session.getAttribute("location")%> 
<br>
<br>
<%

 GregorianCalendar calendar = new GregorianCalendar();
 int hours = calendar.get(Calendar.HOUR_OF_DAY);
 int day = calendar.get(Calendar.DAY_OF_WEEK);

			if(day==1 || day==3 || day==5 || day==6) {%>
			<h3><font face="Helvetica Neue Regular">Thank you for visiting our website. <br>
			We are eager to serve you! We accept orders from 5pm to 7pm on Sundays <br>
			and 5pm to 9pm on Tuesdays and Thursdays. Please place your order then. Thank you!</font></h3>
			<p><a href="mainPage.html">Back to Main Page</a><p>
			<% } else if(day==0 && (hours<17 || hours>19))
			{
			%>
			<h3><font face="Helvetica Neue Regular">Thank you for visiting our website. <br>
			We are eager to serve you! We accept orders from 5pm to 7pm on Sundays <br>
			and 5pm to 9pm on Tuesdays and Thursdays. Please place your order then. Thank you!</font></h3>
			<p><a href="mainPage.html">Back to Main Page</a><p>
			<% } else if((day==2 || day==4) && (hours<17 || hours>21)) 
			{ 
			%>
			<h3><font face="Helvetica Neue Regular">Thank you for visiting our website. <br>
			We are eager to serve you! We accept orders from 5pm to 7pm on Sundays <br>
			and 5pm to 9pm on Tuesdays and Thursdays. Please place your order then. Thank you!</font></h3>
			<p><a href="mainPage.html">Back to Main Page</a><p>
			<% } else 
			{ 
			%>

<form name="item" method="GET" action="editUser1.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Edit">
 </form><br><br>
<p><b>Your Previous Orders : </b>
<jsp:declaration>

Statement stmt;
Connection con;
String url = "jdbc:mysql://localhost:3306/onlinesite";

</jsp:declaration>
<%

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "udfoodie"); 

stmt = con.createStatement();
Statement stmt = con.createStatement();
ResultSet result = stmt.executeQuery("SELECT * FROM member_orders where email ='"+session.getAttribute("email")+"';");
if(result.next())
{
int i=0;
do {
i=i+1;
String orderChip = result.getString("orderChip");
session.setAttribute("setOrderChip",orderChip);
String orderBWW = result.getString("orderBWW");
session.setAttribute("setOrderBWW",orderBWW);
double orderTotal = result.getDouble("orderTotal");
session.setAttribute("setTotal",orderTotal);
%>
<p><li><b>Order No <%= i %></b><br>
<% if(orderChip!=null) { %>
<%= orderChip %><br>
<% }
if(orderBWW!=null) { %>
<%= orderBWW %><br>
<% } %>
<form name="previousOrder" method="GET" action="paymentOrder.jsp">
<input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Select order">
</form>
<%
   } while(result.next());
   con.close();
}
else {
%>
<p><b>There are no Previous orders </b><p>
<%
     }

%>
<form name="" method="GET" action="restro.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Place a New Order">
</form>

<% } %>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
</div>
</body>
</html>