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
<%
SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
Session hibsession = sessionFactory.openSession();
Transaction t=hibsession.beginTransaction();
Employee employee=hibsession.get(Employee.class, Integer.parseInt(request.getParameter("id")));
%>
<form action="edit" method="post"pom.xml"">
<input type="hidden" name="id" value=<%out.print(employee.getCode()); %>><br/>
<input type="text" name="name" value=<%out.print(employee.getName());%>><br/>
<input type="text" name="location" value=<%out.print(employee.getLocation());%>><br/>
<input type="text" name="email" value=<%out.print(employee.getEmail());%>><br/>
<input type="date" name="dob" value=<%out.print(employee.getDob());%>><br/>
<input type="submit"/>
</form>
</body>
</html>