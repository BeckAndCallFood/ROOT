<%@ page import ="java.sql.*" %>
<%@ page errorPage="ShowError.jsp" %>

<%
try {
    String contact = request.getParameter("contact");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
	String location = request.getParameter("location");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinesite","root", "udfoodie");
    Statement st = con.createStatement();
    ResultSet rs;
	String query = "select * from members where email='"+email+"';";
	rs = st.executeQuery(query);
	if(rs != null)
	{
	out.println("You are already Registered !!");
	out.println("<a href='index2.html'>Go to Login</a>");
	}
    int i = st.executeUpdate("insert into members(first_name, last_name, email, contact, location, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + contact+ "','" + location + "','" + pwd + "', CURDATE())");
    if (i > 0) {
        session.setAttribute("userid", email);
        response.sendRedirect("welcome.jsp");
        out.print("Registration Successfull!"+"<a href='index2.html'>Go to Login</a>");
    } else {
        response.sendRedirect("index2.html");
    }
	
	}
	catch(Exception e)
	{
	throw new Exception(e);
	}
%>