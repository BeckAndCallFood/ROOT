<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function validate() {
var email = document.getElementById('email');
var location = document.getElementById('location');
var pass = document.getElementById('pass');
var cpass = document.getElementById('cpass');
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
if(!pass.equals(cpass)) {
alert('Passwords do not match');
return false;
}
}
</script>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
<body>
<div id="container">
<form method="post" action="registration.jsp">
<h2 align="center"><font color="red">New User Registration</h2>
<b>First Name &ensp;
<input STYLE="color: #000000; background-color:  #FFDB58;" type="text" name="fname" value="" /><br><br>
Last Name &ensp; &nbsp;<input STYLE="color: #000000; background-color:  #FFDB58;"  type="text" name="lname" value="" /><br><br>
Email &ensp; &ensp; &ensp; &ensp;<input STYLE="color: #000000; background-color:  #FFDB58;" type="text" name="email" id="email" value="" /><br><br>
Contact No &ensp;<input STYLE="color: #000000; background-color:  #FFDB58;" type="tel" name="contact" value="" /><br><br>
Location &ensp;<select STYLE="color: #000000; background-color:  #FFDB58;"  type="text" name="location" id="location" value="" >
<option value="select">select</option>
			    <option value="Christiana Towers - East">Christiana Towers - East</option>
			    <option value="Christiana Towers - East">Christiana Towers - West</option>
</select><br><br>
Password &ensp;<input STYLE="color: #000000; background-color:  #FFDB58;"  type="password" name="pass" value="" id="pass" /><br><br>
Confirm Password &ensp;</b><input STYLE="color: #000000; background-color:  #FFDB58;"  type="password" name="cpass" value="" id="cpass" /><br><br>
<input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Submit" onClick="return validate()"/><br><br>
<input STYLE="color: #FDD017; background-color:  #FF2400;" type="reset" value="Reset" /><br><br>
Already registered!! <a href="index.html">Login Here</a><br><br>
</form
</div>
 </body>
</html>