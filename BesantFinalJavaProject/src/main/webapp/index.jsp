<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form action="insertstudents.jsp" method="post">
<fieldset>
<h2>This form is to insert students</h2>
<table>
<% //<tr><td>Id:</td><td><input type="number" name ="id"></td></tr> %>

<tr><td>FirstName:</td><td><input type="text" name="fname"></td></tr>
<tr><td>LastName:</td><td><input type="text" name="lname"></td></tr>
<tr><td>Age:</td><td><input type="number" name="age"></td></tr>
<tr><td>PhoneNumber</td><td><input type="text" name="phno"></td></tr>
<tr><td>DateOfBirth:</td><td><input type="datetime-local" name ="dob"></td></tr>
<tr><td><input type="submit" value="Insert"></td></tr>
</table>
</fieldset>
</form>
</div>
<div align="center">
<form action="selectStudents.jsp" method="post">
<fieldset>
<h2>Click the submit button below to view the list of students available in the class</h2>
<table>
<tr><td><input type="submit" value="view"></td></tr>
</table>

</fieldset>
</form>
</div>
<div align="center">
<form action="updatestudents.jsp" method="post">
<sql:setDataSource var="ds"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/project"
    user="root"
    password="taarakesh@123" />
<sql:query dataSource="${ds}" var="students">
    SELECT id FROM students order by id asc;
</sql:query>
<fieldset>
<h2>Please choose the id and columns which you want to update</h2>
<table>
<tr><td>id</td><td><select name="myid">
<c:forEach var="std" items="${students.rows}">
   <option value="${std.id }">${ std.id}</option>
    
</c:forEach>
</select></td></tr>
</table>
<table>
<% // <tr><td><label>ID</label></td><td><input type="checkbox" name="checkboxarray" value="id"></input></td><td><input type="number" name="Inputid" placeholder="id"></td></tr> %>
<tr><td><label>FirstName</label></td><td><input type="checkbox" name="checkboxarray" value="firstName"></input></td><td><input type="text" name="InputfirstName" placeholder="FirstName"></td></tr>
<tr><td><label>lastName</label></td><td><input type="checkbox" name="checkboxarray" value="lastName"></input></td><td><input type="text" name="InputlastName" placeholder="lastname"></td></tr>
<tr><td><label>age</label></td><td><input type="checkbox" name="checkboxarray" value="age"></input></td><td><input type="number" name="Inputage" placeholder="age"></td></tr>
<tr><td><label>PhoneNumber</label></td><td><input type="checkbox" name="checkboxarray" value="phoneNumber"></input></td><td><input type="text" name="InputphoneNumber" placeholder="Phonenumber"></td></tr>
<tr><td><label>Dateofbirth</label></td><td><input type="checkbox" name="checkboxarray" value="dateofbirth"></input></td><td><input type="datetime-local" name="Inputdateofbirth" placeholder="DOB"></td></tr>
<tr><td><input type="submit" value="update"></td></tr>
</table>

</fieldset>

</form>
</div>
<div align="center">
<form action="deletestudents.jsp" method="post">
<sql:setDataSource var="ds"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/project"
    user="root"
    password="taarakesh@123" />
<sql:query dataSource="${ds}" var="students">
    SELECT id FROM students order by id asc;
</sql:query>
<h2>Please choose the id and columns which you want to update</h2>
<table>
<tr><td>id</td><td><select name="myid">
<c:forEach var="std" items="${students.rows}">
   <option value="${std.id }">${ std.id}</option>
    
</c:forEach>
</select></td></tr>
<tr><td><input type="submit" value="delete"></td>
</tr>
</table>
</form>
</div>
</body>
</html>