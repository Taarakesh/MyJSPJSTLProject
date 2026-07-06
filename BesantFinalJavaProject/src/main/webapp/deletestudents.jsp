<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int myid=Integer.parseInt(request.getParameter("myid"));
%>

<sql:setDataSource var="ds"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/project"
    user="root"
    password="taarakesh@123" />

<sql:update dataSource="${ds}" var="rows">
   delete from students where id=?;
    <sql:param value="<%=myid %>"></sql:param>
</sql:update>

<c:if test="${rows == 1}">
    Updated Successfully!
</c:if>
</body>
</html>