<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			String query="select * from r_inv";
	
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query); 
			ResultSet rs=ps.executeQuery();
	%>
	<table border='1'>
	<tr> <th>No</th> <th> I_Name</th> <th>UseQty</th> <th>Remain</th> </tr>
		<%
		while (rs.next()) {
		%>
			<TR>
					<TD><%=rs.getString(1)%></TD>
					<TD><%=rs.getString(2)%></TD>
					<TD><%=rs.getString(3)%></TD>
					<TD><%=rs.getString(4)%></TD>
			</TR>
		<% } %>

	<%
	rs.close();
	ps.close();
	con.close();
	} 
	catch (Exception ex) {}
	%>
</TABLE>
</body>
</html>