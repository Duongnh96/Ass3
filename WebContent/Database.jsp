<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Database</title>
</head>
<body>
		<%
			Connection connect = null;
			Statement s = null;
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

				connect = DriverManager
						.getConnection("jdbc:sqlserver://localhost:1433;databaseName=member;user=sa;password=123456");
				s = connect.createStatement();

				String sql = "SELECT * FROM  member ORDER BY ID DESC";

				ResultSet rec = s.executeQuery(sql);
		%>
		<table style="border-collapse: collapse;" width="600" border="1"
			style="float: left;">
			<tr>
				<th width="91">
					<div align="center">ID</div>
				</th>
				<th width="98">
					<div align="center">First Name</div>
				</th>
				<th width="198">
					<div align="center">Last Name</div>
				</th>
				<th width="97">
					<div align="center">Phone</div>
				</th>
				<th width="59">
					<div align="center">Descaption</div>
				</th>
				<th width="59">
					<div align="center">Image</div>
				</th>
				<th width="59">
					<div align="center">Gender</div>
				</th>
				<th width="59">
					<div align="center">Vehicle</div>
				</th>
				<th width="59">
					<div align="center">Option</div>
				</th>
			</tr>
			<%
				while ((rec != null) && (rec.next())) {
			%>
			<tr>
				<td><div align="center"><%=rec.getInt(1)%></div></td>

				<td align="right"><%=rec.getString(2)%></td>
				<td align="right"><%=rec.getString(3)%></td>
				<td align="right"><div align="center"><%=rec.getString(4)%></div></td>
				<td align="right"><%=rec.getString(5)%></td>
				<td align="right"><%=rec.getString(6)%></td>
				<td align="right"><%=rec.getString(7)%></td>
				<td align="right"><%=rec.getString(8)%></td>
				<td align="right"><%=rec.getString(9)%></td>
				<td align="right"><a href="delete.jsp?id=<%=rec.getInt(1)%>">Delete</a></td>
				<td align="right"><a href="formupdate.jsp?id=<%=rec.getInt(1)%>">Update</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} catch (Exception e) {
				out.print(e);
			} finally {
				if (connect != null) {
					try {
						connect.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		%>
</body>
</html>