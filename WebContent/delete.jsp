<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("id");
  out.print(id);
	Connection connect = null;
	PreparedStatement ps;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connect = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=member;user=sa;password=123456");
		String sql = "DELETE FROM [dbo].[member] WHERE id=?";
		 ps = connect.prepareStatement(sql);
		 ps.setString(1, id);
		ps.executeUpdate();
		response.sendRedirect("Database.jsp");
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
