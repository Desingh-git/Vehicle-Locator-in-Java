package com.vehicle.ww;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DataFetchingServlet", urlPatterns = {"/DataFetchingServlet"})
public class DataFetchingServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetch data from booking table
            String bookingDataQuery = "SELECT name, mobile, bikeName, problem, latitude, longitude FROM booking";
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "");
                    PreparedStatement bookingDataStatement = connection.prepareStatement(bookingDataQuery);
                    ResultSet bookingDataResult = bookingDataStatement.executeQuery()) {
                out.println("<h1>Booking Details</h1>");
                while (bookingDataResult.next()) {
                    String name = bookingDataResult.getString("name");
                    String mobile = bookingDataResult.getString("mobile");
                    String bikeName = bookingDataResult.getString("bikeName");
                    String problem = bookingDataResult.getString("problem");
                    String latitude = bookingDataResult.getString("latitude");
                    String longitude = bookingDataResult.getString("longitude");

                    // Display fetched data
                    out.println("Name: " + name + "<br>");
                    out.println("Mobile: " + mobile + "<br>");
                    out.println("Bike Name: " + bikeName + "<br>");
                    out.println("Problem: " + problem + "<br>");
                    out.println("Latitude: " + latitude + "<br>");
                    out.println("Longitude: " + longitude + "<br><br>");
                }
            } catch (SQLException ex) {
                out.println("Error fetching booking data: " + ex.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DataFetchingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DataFetchingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Fetches booking data from the booking table";
    }
}
