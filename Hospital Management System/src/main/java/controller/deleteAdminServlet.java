package controller;

import dao.adminService;
import model.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteAdminServlet")
public class deleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchEmail = request.getParameter("searchEmail");

        if (searchEmail != null && !searchEmail.trim().isEmpty()) {
            admin foundAdmin = null;
            try {
                foundAdmin = new adminService().getAdminByEmail(searchEmail);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving admin details.");
            }

            if (foundAdmin != null) {
                request.setAttribute("foundAdmin", foundAdmin);
            } else {
                request.setAttribute("message", "Admin not found.");
            }
        }

        // Forward to admindelete.jsp instead of adminmanagement.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("admindelete.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailToDelete = request.getParameter("emailToDelete");

        if (emailToDelete != null && !emailToDelete.trim().isEmpty()) {
            boolean deleted = false;
            try {
                deleted = new adminService().deleteAdminByEmail(emailToDelete);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (deleted) {
                request.setAttribute("message", "Admin deleted successfully.");
            } else {
                request.setAttribute("message", "Failed to delete admin.");
            }
        }

        // Forward to admindelete.jsp after deletion for the result display
        RequestDispatcher dispatcher = request.getRequestDispatcher("admindelete.jsp");
        dispatcher.forward(request, response);
    }
}
