<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/project1";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String course = request.getParameter("course");
String branch=request.getParameter("branch");
String rollNo=request.getParameter("rollNo");
String name=request.getParameter("name");

String fatherName=request.getParameter("fatherName");
String gender=request.getParameter("gender");
if(rollNo!= null)
{
Connection con = null;
PreparedStatement ps = null;
int personrollNo = Integer.parseInt(rollNo);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="update student set course=?,branch=?,rollNo=?,name=?,fatherName=?,gender=? where rollNo="+rollNo;
ps = con.prepareStatement(sql);
ps.setString(1,course);
ps.setString(2, branch);
ps.setString(3, rollNo);
ps.setString(4, name);
ps.setString(5, fatherName);
ps.setString(6,gender);
int i = ps.executeUpdate();
if(i > 0)
{
	 response.sendRedirect("adminHome.jsp");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(Exception e)
{
	System.out.println(e);
	
}
}
%>