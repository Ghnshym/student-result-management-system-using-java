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
String sql ="select * from result where rollNo="+rollNo;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                        <div class="card-header">  <center> <b> Update Student Result </b> </center></div>
                        <div class="card-body">
<form method="post" action="updateResultProcess.jsp">
<input type="hidden" name="rollNo" value="<%=resultSet.getString("rollNo") %>">
    <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Rollno</label>
                                    <div class="col-md-6">

<input type="number" name="rollNo"  class="form-control" value="<%=resultSet.getString("rollNo") %>">
</div>
</div>
    <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right">Commutative English</label>
       <div class="col-md-6">
<input type="number" class="form-control"  min="0" max="100"  name="s1" value="<%=resultSet.getString("s1") %>">
</div>
</div>
    <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> Information Technology </label>
       <div class="col-md-6">
<input type="number" name="s2"   min="0" max="100"  class="form-control" value="<%=resultSet.getString("s2") %>">
</div>
</div>
   <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right">Computer Organization</label>
       <div class="col-md-6">
<input type="number" name="s3"   min="0" max="100" class="form-control" value="<%=resultSet.getString("s3") %>">
</div>
</div>
 <div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> C Language </label>
       <div class="col-md-6">
<input type="number" name=s4  min="0" max="100" class="form-control" value="<%=resultSet.getString("s4") %>">
</div>
</div>
<div class="form-group row">
      <label for="full_name" class="col-md-4 col-form-label text-md-right"> Human Value</label>
       <div class="col-md-6">
<input type="number" name="s5"  min="0" max="100" class="form-control" value="<%=resultSet.getString("s5") %>">
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