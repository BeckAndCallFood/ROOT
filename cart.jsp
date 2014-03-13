<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>


<c:if test="${pageContext.request.method=='POST'}">
  <c:if test="${param.fwd!=null}">
    <c:redirect url="payment.html" />
  </c:if>
 </c:if>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><!--
<script type="text/javascript">
function check()
{
alert(" value of total is "+${cartChip.orderTotal+cart.orderTotal+2.00});
}
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style rel='stylesheet' type='text/css'>
div#container {
    position: relative;
    margin: 0 auto;
	height: auto;
	max-width: 1200px;
}
div#left {
	margin-top: 40px;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	background: white;
	padding: 5px;
	height: auto;
	border-right: 1px solid black;
}
div#right {
	margin-top: 0px;
	height: auto;
    margin-left: 400px;
    background: white;
    border: 1px solid white;
    padding: 10px;
}
</style>
<title>Cart Page</title>
</head>
<body>
<div id="container">
<h2 align="center"><font color="red">Review Your Order</font></h2>
<br>

<!-- All Beans -->
  <jsp:useBean id="user" scope="session" class="beans.userBean" />
  <jsp:useBean id="cartChip" scope="session" class="beans.CartBean" />
  <jsp:useBean id="cart" scope="session" class="beans.CartBeanBww" />
  
  <div id="left">
  <!-- USER INFO -->
 <h4 align="left"><font color="red"><b>Contact Information</b></font></h4><br><br>
 <li><b>Name : </b> <c:out value="${user.name}"/><br>
 <li><b>Contact No :</b>  <c:out value="${user.contactNo}"/><br>
 <li><b>Email :  </b><c:out value="${user.email}"/><br>
 <li><b>Location : </b> <c:out value="${user.location}"/><br>
 <form name="item" method="GET" action="editUser.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Edit">
 </form><br><br>
 <c:set var="total" value="${cartChip.orderTotal+cart.orderTotal}" />
  <c:choose>
  <c:when test="${total >= 15}">
<p><br><b>Delivery Fee :
<c:set var="deliveryFee" value="${0.2*total}"/><fmt:formatNumber type="number" maxFractionDigits="2" value="${deliveryFee}" /><br><br>
 </c:when>
 </c:choose>
 <!--
 <c:choose>
  <c:when test="${total <= 10}">
  <c:set var="deliveryFee" value="3.00" />
  <c:out value="${deliveryFee}" /><br><br>
  </c:when>
  <c:when test="${(total > 10) && (total <= 20)}">
  <c:set var="deliveryFee" value="4.00" />
  <c:out value="${deliveryFee}" /><br><br>
  </c:when>
  <c:when test="${(total > 20) && (total <= 25)}">
  <c:set var="deliveryFee" value="5.00" />
  <c:out value="${deliveryFee}" /><br><br>
  </c:when>
  <c:when test="${total > 25}">
  <c:set var="deliveryFee" value="${0.2*total}"/><fmt:formatNumber type="number" maxFractionDigits="2" value="${deliveryFee}" /><br><br>
  </c:when>
 </c:choose>
 -->
 <br>
<c:set var="finalTotal" value="${total+deliveryFee}"/>
<br><font color="red"><b>Grand Total : </b></font><fmt:formatNumber type="number" maxFractionDigits="2" value="${finalTotal}" /> <br><br>

</form>
<form name="addRestaurant" method="GET" action="restro.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Select Restaurant">
</form>
<c:choose>
  <c:when test="${total >= 15}">
 <form name="payment" method=POST action="payment.jsp?amt=${finalTotal}">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Checkout">
</form> 
</c:when>
</c:choose>
</div>

  <div id="right">
 <!-- Chipotle cart -->
 <c:choose>
 <c:when test="${cartChip.lineItemCount==0}">
  </c:when>
  <c:when test="${total < 15}">
  <b>Minimum order of $15 is required </b>
  </c:when>
  <c:when test="${cartChip.lineItemCount!=0}">
  <form name="item" method="GET" action="servlet/CartController">
   <h4 align="left"><font color="red"><b>Chipotle</b></font></h4>
  <c:forEach var="cartItem" items="${cartChip.cartItems}" varStatus="counter"> 
  <br>
    <li><b>Type :</b>  <c:out value="${cartItem.type}"/><br>
	   <c:if test="${cartItem.type=='Taco'}">
	   <li><b>Taco Type / Quantity : </b> <c:out value="${cartItem.tacoType}"/><br>
	   </c:if>
    <li><b>Fillings : </b><c:out value="${cartItem.filling}"/><br>
	<li><c:out value="${cartItem.rice}"/> Rice and &nbsp; &nbsp; <c:out value="${cartItem.bean}"/> Beans<br>
	<li><b>Toppings :</b> <c:out value="${cartItem.toppings}"/><br>
	<li><b>Sides :</b> <c:out value="${cartItem.sides}"/><br>
	<li><b>Drinks :</b> <c:out value="${cartItem.drinks}"/><br>
	<li><b>Bag Total : </b><c:out value="${cartItem.total}"/><br>
	<input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'>
	<input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" name="action" value="delete">
  </c:forEach> 
  <li><b>Total </b><c:out value="${cartChip.orderTotal}"/><br/>
  </form>
 <form name="addAnother" method="GET" action="chip_o.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Add another Chipotle order">
 </form>
</c:when>
</c:choose>
 
 <!-- BWW cart -->
 <c:choose>
  <c:when test="${cart.lineItemCount==0}">
  </c:when>
  <c:when test="${total < 15}">
  <b>Minimum order of $15 is required </b>
  </c:when>
  <c:when test="${cart.lineItemCount!=0}">
   <form name="item" method="GET" action="bww/bwwController">
   <h4 align="left"><font color="red">Buffalo Wild Wings</font></h4>
  <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter"> 
    <li><b>Type :  </b><c:out value="${cartItem.type}"/><br>
	<li><b>Items : </b><c:out value="${cartItem.items}"/><br>
	<li><b>Total : </b><c:out value="${cartItem.total}"/><br>
	<input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'>
	<input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" name="action" value="delete">
   </c:forEach>
   <br>
  <li><b>Total : </b><c:out value="${cart.orderTotal}"/><br/>
  </form>
  <form name="addBww" method="GET" action="bww_order.html">
 <input STYLE="color: #FDD017; background-color:  #FF2400;" type="submit" value="Add another BWW order">
 </form>
 </c:when>
 </c:choose>
  </div>
  
</div>
</body>
</html>