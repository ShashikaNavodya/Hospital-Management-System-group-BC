package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.customerService;
import model.customer;

@WebServlet("/customerLogin")
public class customerLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public customerLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        customer cus = new customer();
        cus.setEmail(email);
        cus.setPassword(password);

        customerService service = new customerService();
        boolean status = service.validate(cus);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", cus.getEmail());

            response.sendRedirect("appointment.jsp"); // Better than forward for login success
        } else {
            request.setAttribute("error", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Optional for completeness
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
