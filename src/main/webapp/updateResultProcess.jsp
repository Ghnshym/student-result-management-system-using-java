<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/project1";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String rollNo=request.getParameter("rollNo");
String s1 = request.getParameter("s1");
String s2=request.getParameter("s2");

String s3=request.getParameter("s3");

String s4=request.getParameter("s4");
String s5=request.getParameter("s5");
if(rollNo!= null)
{
Connection con = null;
PreparedStatement ps = null;
int personrollNo = Integer.parseInt(rollNo);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="update result set rollNo=?, s1=?,s2=?,s3=?,s4=?,s5=? where rollNo="+rollNo;
ps = con.prepareStatement(sql);
ps.setString(1,rollNo);
ps.setString(2, s1);
ps.setString(3, s2);
ps.setString(4, s3);
ps.setString(5, s4);
ps.setString(6,s5);
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