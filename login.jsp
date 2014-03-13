<%@ page import ="java.sql.*" %>
<%@ page errorPage="ShowError.jsp" %>

<%

try{
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinesite", "root", "udfoodie");
    Statement st = con.createStatement();
    ResultSet rs;
	String userid = "";
    rs = st.executeQuery("select * from members where email='" + email + "' and pass='" + pwd + "'");
    if (rs!=null) {
	while(rs.next()) {
	    session.setAttribute("email",email);
		session.setAttribute("no",rs.getString("contact"));
		session.setAttribute("last",rs.getString("last_name"));
		session.setAttribute("location",rs.getString("location"));
        session.setAttribute("userid", rs.getString("first_name"));
        }
		response.sendRedirect("success1.jsp");
		
    } else {
        out.println("Invalid password <a href='index2.html'>try again</a>");
    }
	
	}
	
	catch(Exception e)
	{
	throw new Exception(e);
	}
%>