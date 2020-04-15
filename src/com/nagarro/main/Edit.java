package com.nagarro.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

@WebServlet("/edit")
public class Edit extends HttpServlet 
{
	RequestDispatcher rdObj = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction t=session.beginTransaction();
	    Employee employee=session.get(Employee.class,Integer.parseInt(request.getParameter("id")));
	    employee.setName(request.getParameter("name"));
	    employee.setEmail(request.getParameter("email"));
	    employee.setLocation(request.getParameter("location"));
	    employee.setDob(request.getParameter("dob"));
	    t.commit();
	    session.close();
	    rdObj=request.getRequestDispatcher("lists.jsp");	
	    rdObj.forward(request, response);
	}

}
