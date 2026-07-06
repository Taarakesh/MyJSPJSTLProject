<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
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
String[] checkboxArray=request.getParameterValues("checkboxarray");
String mystring="update students set ";
for(int i=0;i<=checkboxArray.length-1;i++){
	if(i<checkboxArray.length-1){
		mystring+=checkboxArray[i]+"=?,";
	}
	else{
		mystring+=checkboxArray[i]+" =? where id=?";
	}
}
%>
<c:set var="myQuery" value="<%=mystring %>"></c:set>
<c:set var="mykey" value="<%=myid %>"/>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/project" user="root" password="taarakesh@123"/>
<sql:update dataSource="${myDB}" var="count">
<c:out value="${myQuery}"></c:out>
<%for(int k=0;k<=checkboxArray.length-1;k++){
	String mystring1="Input"+checkboxArray[k];
	if(checkboxArray[k].equals("age")){
		int age1=Integer.parseInt(request.getParameter(mystring1));%>
		<sql:param><%=age1 %></sql:param>
		<% 
		
	}
	else if(checkboxArray[k].equals("dateofbirth")){
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		java.util.Date dob1=null;
		try{
			dob1=sd.parse(request.getParameter(mystring1)); 
			
		}
		catch(ParseException pe){
			pe.printStackTrace();
		} %>
		<sql:param value="<%=dob1 %>"></sql:param>
		<% 
	
	}
	else{
		String myvalue=request.getParameter(mystring1);%>
		<sql:param><%=myvalue %></sql:param>
		<% 
	}
}
%>
<sql:param value="${ mykey}"></sql:param>
</sql:update>
<h1>${count} no of rows updated</h1>

</body>
</html>