package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.customerService;
import model.customer;


@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addCustomer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		customer cus = new customer();
		
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));
		cus.setAddress1(request.getParameter("address1"));
		cus.setAddress2(request.getParameter("address2"));
		cus.setCity(request.getParameter("city"));
		cus.setState(request.getParameter("inputstate"));
		cus.setZip(request.getParameter("zip"));
		
		customerService service = new customerService();
		service.regCustomer(cus);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

}
