package com.househunt.logins;

import com.househunt.dao.TenantDetailsDAO;
import com.househunt.model.TenantDetails;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TenantDetails")
public class TenantDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TenantDetails> tenantDetailsList = TenantDetailsDAO.getAllTenantDetails();
        request.setAttribute("tenantDetailsList", tenantDetailsList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/display_tenant_details.jsp");
        dispatcher.forward(request, response);
    }
}
