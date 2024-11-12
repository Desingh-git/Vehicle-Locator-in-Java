/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sathiyamoorthi A
 */
@WebServlet(urlPatterns = {"/DisplayDetailsServlet"})
public class DisplayDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        
         try {
            HttpSession session = request.getSession();
            String mobileNo = (String) session.getAttribute("mobileNo");

            if (mobileNo != null) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "");

                // Fetch details based on mobileNo
                String query = "SELECT * FROM booking WHERE mobileNo='" + mobileNo + "'";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Display details in a portrait-sized format
                out.println("<html><head><title>User Details</title></head><body>");
                out.println("<h2>User Details</h2>");

                if (rs.next()) {
                    out.println("<p><strong>Customer Name:</strong> " + rs.getString("customerName") + "</p>");
                    out.println("<p><strong>Bike Name:</strong> " + rs.getString("bikeName") + "</p>");
                    out.println("<p><strong>Problem:</strong> " + rs.getString("problem") + "</p>");
                    out.println("<p><strong>Mobile No:</strong> " + rs.getString("mobileNo") + "</p>");
                    out.println("<p><strong>Latitude:</strong> " + rs.getString("latitude") + "</p>");
                    out.println("<p><strong>Longitude:</strong> " + rs.getString("longitude") + "</p>");
                } else {
                    out.println("<p>No details found for the provided mobile number.</p>");
                }

                out.println("</body></html>");

            } else {
                out.println("<p>Session expired. Please log in again.</p>");
            }
        } catch (Exception e) {
            out.println(e);
        }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
