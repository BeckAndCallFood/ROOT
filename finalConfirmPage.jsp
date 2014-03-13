<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page errorPage="ShowError.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<title>Conformation Page</title>
</head>

<body>
<%
try {
session.setAttribute("user", null);
session.setAttribute("cartChip", null);
session.setAttribute("cart", null);
session.invalidate();
}

catch(Exception e) {
throw new Exception(e);
}
%>
<div id="container">
<p>Your order has been successfully placed</p>


<p></p>
<p>A confirmation email has been sent</p>
 <p><a href="mainPage.html" title="Back to main Menu">Back to main menu</a></p>
</div>
</body>
</html>