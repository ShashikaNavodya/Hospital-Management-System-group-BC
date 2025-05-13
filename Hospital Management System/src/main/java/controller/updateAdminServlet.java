package controller;

import dao.adminService;
import model.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateAdminServlet")
public class updateAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchEmail = request.getParameter("searchEmail");

        if (searchEmail != null && !searchEmail.trim().isEmpty()) {
            try {
                admin foundAdmin = new adminService().getAdminByEmail(searchEmail);
                if (foundAdmin != null) {
                    request.setAttribute("foundAdmin", foundAdmin);
                } else {
                    request.setAttribute("message", "Admin not found.");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving admin details.");
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminupdate.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalEmail = request.getParameter("originalEmail");
        String updatedName = request.getParameter("name");
        String updatedEmail = request.getParameter("email");
        String updatedPassword = request.getParameter("password");
        String updatedRole = request.getParameter("role");

        admin updatedAdmin = new admin();
        updatedAdmin.setName(updatedName);
        updatedAdmin.setEmail(updatedEmail);
        updatedAdmin.setPassword(updatedPassword);
        updatedAdmin.setRole(updatedRole);

        boolean updated = false;
        try {
            updated = new adminService().updateAdmin(originalEmail, updatedAdmin);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (updated) {
            request.setAttribute("message", "Admin updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update admin.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminupdate.jsp");
        dispatcher.forward(request, response);
    }
}
