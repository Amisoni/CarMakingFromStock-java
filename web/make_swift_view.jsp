<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ami_car", "root", ""); 
			String name = (String) session.getAttribute("unm");
			String query="select * from make_swift";
	
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query); 
			ResultSet rs=ps.executeQuery();
	%>
	<table border='1'>
	<tr> <th>MakeSwift</th> </tr>
		<%
		while (rs.next()) {
		%>
			<TR>
					<TD><%=rs.getString(1)%></TD>
			</TR>
		<% } %>

	<%
	rs.close();
	ps.close();
	con.close();
	} 
	catch (Exception ex) {}
	%>
</body>
</html>