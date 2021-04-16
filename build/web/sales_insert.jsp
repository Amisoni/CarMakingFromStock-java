<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form  action="sales_insert" method="post">
	<table>
		<!-- <tr> <td> No </td> <td> <input type="text" name="no"></td> </tr> -->
		<tr> <td> Name </td> <td> <input type="text" name="name"></td> </tr>
		<tr> <td> Product Name </td> <td> <input type="text" name="pnm"></td> </tr>
                <tr> <td> Qty </td> <td> <input type="number" name="qty"></td> </tr>
                <tr> <td> Price </td> <td> <input type="number" name="prc"></td> </tr>
		<!--<tr> <td> Total </td> <td> <input type="date" name="ttl"></td> </tr>-->
		<tr> <td> <input type="submit" name="submit" value="Submit"> </td> </tr>
	</table>
</form>
</body>
</html>