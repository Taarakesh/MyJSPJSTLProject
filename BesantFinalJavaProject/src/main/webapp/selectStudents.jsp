<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.mydata.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table 
{
width:100%;
border:2px solid black;

}

th,td 
{
width:16.66%;
border:2px solid black;
text-align:center;
padding:10px 0px 10px 0px;

}


</style>
</head>
<body>
<%
Data d=(Data)application.getAttribute("data");
ResultSet rs2=d.rs;
%>
<h1>List of students available in the database</h1>
<table>
<tr><th>ID</th><th>FirstName</th><th>LastName</th><th>Age</th><th>PhoneNumber</th><th>DateOfBirth</th>
</tr>
<% while(rs2.next()){
	%> <tr><td><%= rs2.getInt(1) %></td><td><%= rs2.getString(2) %></td><td><%= rs2.getString(3) %></td><td><%=rs2.getInt(4) %></td><td><%= rs2.getString(5) %></td><td><%= rs2.getDate(6) %></td>
	</tr>
	<% 
}
%>
</table>

</body>
</html>