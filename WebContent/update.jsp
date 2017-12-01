<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String fname = request.getParameter("firstname");
	String lname = request.getParameter("lastname");
	String number = request.getParameter("num1") + request.getParameter("num2") + request.getParameter("num3");
	String image = request.getParameter("image");
	String gender = request.getParameter("gender");
	String vehicle = request.getParameter("vehicle");
	String des = request.getParameter("descap");
	String option = request.getParameter("option");
	Connection connect = null;
	PreparedStatement ps;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connect = DriverManager
				.getConnection("jdbc:sqlserver://localhost:1433;databaseName=member;user=sa;password=123456");
		String sql = "UPDATE [dbo].[member] SET [firstname]=?,[lastname]=?,[phone]=?,[descation]=?,[image]=?,[gender]=?,[vehicle]=?,[option]=? WHERE id=?";
		ps = connect.prepareStatement(sql);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, number);
		ps.setString(4, des);
		ps.setString(5, image);
		ps.setString(6, gender);
		ps.setString(7, vehicle);
		ps.setString(8, option);
		ps.setInt(9, id);
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
