<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
 <%@include file="header.html"%>
<%@page import="java.sql.Connection"%>
<%
String rollNo = request.getParameter("rollNo");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "project1";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student where rollNo="+rollNo;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<head>
 <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<br>
<br>
<br>
<br>
<br>
<main class="my-form">
    <div class="cotainer">
          <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">  <center> <b> Update Student Details </b> </center></div>
                        <div class="card-body">
<form method="post" action="update-process.jsp">
<input type="hidden" name="rollNo" value="<%=resultSet.getString("rollNo") %>">
    <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course</label>
                                    <div class="col-md-6">

<input type="text" name="course"  class="form-control" value="<%=resultSet.getString("course") %>">
</div>
</div>
    <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right">Branch</label>
       <div class="col-md-6">
<input type="text" class="form-control" name="branch" value="<%=resultSet.getString("branch") %>">
</div>
</div>
    <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> Name </label>
       <div class="col-md-6">
<input type="text" name="rollNo"  class="form-control" value="<%=resultSet.getString("rollNo") %>">
</div>
</div>
   <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> Name </label>
       <div class="col-md-6">
<input type="text" name="name" class="form-control" value="<%=resultSet.getString("name") %>">
</div>
</div>
 <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> Father Name </label>
       <div class="col-md-6">
<input type="text" name="fatherName"  class="form-control" value="<%=resultSet.getString("fatherName") %>">
</div>
</div>
<div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right">Gender</label>
       <div class="col-md-6">
<input type="text" name="gender"  class="form-control" value="<%=resultSet.getString("gender") %>">
<br><br> 
</div>
</div>
<center>
<input type="submit" value="submit">
</center>
</form>
</div>
</div>
</div>
</div>
</div>
</main>

<%
}
connection.close();
} catch (Exception e) {
System.out.println(e);
}
%>
</body>
</html>