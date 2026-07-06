<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*,java.util.*,java.sql.*" isELIgnored="false"%>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//int id=Integer.parseInt(request.getParameter("id"));
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
int age=Integer.parseInt(request.getParameter("age"));
String phno=request.getParameter("phno");
String dob=request.getParameter("dob");
SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
java.sql.Date sd1=null;

try{
	java.util.Date ud=sd.parse(dob);
	sd1=new java.sql.Date(ud.getTime());
	
}
catch(ParseException pe){
	pe.printStackTrace();
	
}

%>

<sql:setDataSource var="ds"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/project"
    user="root"
    password="taarakesh@123" />

${ds}
<sql:update dataSource="${ds}" var="n">
    insert into students(firstName,lastName,age,phoneNumber,dateofbirth) values (?,?,?,?,?)
    <sql:param><%=fname %></sql:param>
    <sql:param><%=lname %></sql:param>
    <sql:param><%=age %></sql:param>
    <sql:param><%=phno %></sql:param>
    <sql:param><%=sd1 %></sql:param>
    
</sql:update>

<h1>${n} no of rows inserted</h1>

</body>
</html>