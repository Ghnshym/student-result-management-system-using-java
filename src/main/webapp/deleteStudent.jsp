<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String rollNo=request.getParameter("rollNo");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM student WHERE rollNo="+rollNo);
response.sendRedirect("adminHome.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>