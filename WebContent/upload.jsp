<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.cfg.Configuration
,java.io.*,org.hibernate.Transaction,com.nagarro.main.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="store" method="post"><br>
Name<input type="text" name="name"><br>
Location<input type="text" name="location"><br>
Email<input type="text" name="email"><br>
DOB<input type="date" name="dob"><br>
<input type="submit"/>
</form>
</body>
</html>