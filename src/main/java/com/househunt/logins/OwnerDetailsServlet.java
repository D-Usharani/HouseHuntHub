package com.househunt.logins;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.househunt.dao.RentalDataDAO;
import com.househunt.model.RentalData;

@WebServlet("/OwnerDetails")
public class OwnerDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<RentalData> ownerDetailsList = RentalDataDAO.getAllRentalProperties();
        request.setAttribute("ownerDetailsList", ownerDetailsList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/display_owner_details.jsp");
        dispatcher.forward(request, response);
    }
}
