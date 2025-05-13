package controller;

import dao.adminService;
import model.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewAdminServlet")
public class viewAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            adminService service = new adminService();
            List<admin> adminList = service.getAllAdmins();
            request.setAttribute("adminList", adminList);
            System.out.println("SQL Error: kkk");
        } catch (ClassNotFoundException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewadmins.jsp");
        dispatcher.forward(request, response);
    }
}
