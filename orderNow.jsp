<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en'>
<%@ page errorPage="ShowError.jsp" %>
<%@ page import="java.util.*" %>
<head>
<script language="javascript">
function validate() {
var email = document.getElementById('email');
var location = document.getElementById('location');
var selected = location.options[location.selectedIndex].value;

var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
if (!filter.test(email.value)) {
alert('Enter a vlaid email address');
email.focus;
return false;
}
if(selected=='select'){
alert('select a location');
return false;
}
}
</script>

<title>Order Now</title>
<style rel='stylesheet' type='text/css'>
div#heading {
width: 1000px;
height: 130px;
background:url(images/header.png) no-repeat top center;
display:block;
}
div#container,
div#footer {
    border: 1px solid white;
    max-width: 1000px;
    min-width: 600px;
}
div#container {
    position: relative;
    margin: 0 auto;
	height: 500px;
}
div#heading {
    margin: 10px auto -1px auto;
}
div#heading h1 {
    margin: 5px;
}
div#left {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    width: 500px;
    background: #ccc;
    padding: 5px;
    border-right: 1px solid black;
}
div#content {
    margin-left: 211px;
    background: white;
    border: 1px solid white;
    padding: 10px;
}
div#footer {
    margin: -1px auto 10px auto;
}
div#footer p {
    margin: 5px;
}        
        #container h2 {
	color: #B22B27;
}
#container #infoForm p label {
	color: #D93228;
}
</style>
    </head>
<body>
<p><p>
<p><h2 align="center"><font color="red">Order Now !</font></h2></p>
        <div id='container'>
			<%
			GregorianCalendar calendar = new GregorianCalendar();
 int hours = calendar.get(Calendar.HOUR_OF_DAY);
 int day = calendar.get(Calendar.DAY_OF_WEEK);
			try {

			if(day==1 || day==3 || day==5 || day==6) {%>
			<h3><font face="Helvetica Neue Regular">Thank you for visiting our website. <br>
			We are eager to serve you! We accept orders from 5pm to 7pm on Sundays <br>
			and 5pm to 9pm on Tuesdays and Thursdays. Please place your order then. Thank you!</font></h3>
			<p><a href="mainPage.html">Back to Main Page</a><p>
			<% } else if(day==0 && (hours<17 || hours>20))
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
			{ %>
            <h2><em><em><font color="red">Enter your contact Info</em></h2>
            <form id="infoForm" method=GET action="user/userController">
			<p>
			  <input type="hidden" name="form" value="infoForm">
			  </p>
			<p>
			  <label for="Name">Name</label>
			  <input name="name" type="text" id="Name" STYLE="color: #000000; background-color:  #FFDB58;" value="Name" /><br><br>
			  <label for="no">Contact No</label>
			  <input name="no" type="tel" id="no" STYLE="color: #000000; background-color:  #FFDB58;" value="Contact No" /><br><br>
			  <label for="email">Email</label>
			  <input name="email" type="text" id="email" STYLE="color: #000000; background-color:  #FFDB58;" value="email" /><br><br>
			  <label for="location">Location</label>
			  <select STYLE="color: #000000; background-color:  #FFDB58;" name="location" size="1" id="location">
			    <br><br>
			    <option value="select">select</option>
			    <option value="Christiana Towers - East">Christiana Towers - East</option>
			    <option value="Christiana Towers - East">Christiana Towers - West</option>
		      </select></font>
			  <br><br>
			  </p>
			<p>
	  <input STYLE="color: #FDD017; background-color:  #FF2400;" id="next" type="submit" value="Next" onClick="return validate()"/>
	</form>
        <% } 
		}
		
		catch(Exception e)
		{
		throw new Exception(e);
		}
		%>
        </div>
    </body>
</html>
