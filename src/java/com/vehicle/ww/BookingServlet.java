package com.vehicle.ww;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); 
        try (PrintWriter out = response.getWriter()) {
            // Fetch the form parameters
            String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String bikeName = request.getParameter("bikeName");
            String problem = request.getParameter("problem");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish connection
                try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "")) {
                    // SQL Query to insert booking details without username
                    String query = "INSERT INTO booking(name, mobile, bikeName, problem, latitude, longitude) "
                                 + "VALUES(?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        // Set the values for the query
                        ps.setString(1, name);
                        ps.setString(2, mobile);
                        ps.setString(3, bikeName);
                        ps.setString(4, problem);
                        ps.setString(5, latitude);
                        ps.setString(6, longitude);
                        
                        // Execute the query
                        ps.executeUpdate();
                    }
                }
                // Redirect to user home page upon successful booking
                response.sendRedirect("start.jsp");
            } catch (Exception ex) {
                out.println("Error: " + ex.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles service booking";
    }
}
