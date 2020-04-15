<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.util.*,org.hibernate.*,org.hibernate.cfg.Configuration
,java.io.*,org.hibernate.Transaction,com.nagarro.main.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="border:solid black">
<h1 style="align:center ">Employee Portal</h1>
</div>
<br/><br/>
<a href="upload.jsp">Upload Employee Details</a>
<input type="button" id="btnExport" value="Download" onclick="Export()" />
<br/><br/>
<form style="border:solid black" action="store" method="post">
<br/><br/>
<%
SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
Session hibsession = sessionFactory.openSession();
Transaction t=hibsession.beginTransaction();
List<Employee> list=hibsession.createQuery("from Employee").getResultList();
%>
<table id="tblCustomers">
<tr>
<th>Code</th>
<th>Name</th>
<th>Location</th>
<th>Email</th>
<th>Date of Birth</th>
<th>Actions</th>
</tr>
<%
for(Employee employee :list)
{
%>
<tr>
<td><% out.print(employee.getCode()+"");%></td>
<td><% out.print(employee.getName()); %></td>
<td><%  out.print(employee.getLocation());%></td>
<td><% out.print(employee.getEmail()); %></td>
<td><%  out.print(employee.getDob());%></td>
<td><button class="btn" type="submit" formmethod="post" name="id" formaction="edit.jsp" value=<%out.print(employee.getCode());%>>Edit</button></td>
</tr>
<%}%>
</table>
</form>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('tblCustomers'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Employee.pdf");
                }
            });
        }
    </script>
</body>
</html>