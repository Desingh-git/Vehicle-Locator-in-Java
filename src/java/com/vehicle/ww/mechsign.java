/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vehicle.ww;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author desingh
 */
@WebServlet(name = "mechsign", urlPatterns = {"/mechsign"})
public class mechsign extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String name = request.getParameter("fullname");
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String cpass = request.getParameter("cpassword");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String vehicle = request.getParameter("vehicle");
        String shop = request.getParameter("shop");
        String start =request.getParameter("start");
        String end = request.getParameter("end");
        String city=request.getParameter("city");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "");

            // Validate if the username already exists
            if (isUsernameExists(uname, con)) {
                out.println("<script>");
                out.println("alert('Username already exists. Please choose a different username.');");
                out.println("window.location='mecSign.jsp';");
                out.println("</script>");
                return; // Exit the process if username exists
            }

            // Validate if the password and confirm password match
            if (!pass.equals(cpass)) {
                out.println("<script>");
                out.println("alert('Password and Confirm Password do not match. Please enter matching passwords.');");
                out.println("window.location='mecSign.jsp';");
                out.println("</script>");
                return; // Exit the process if passwords do not match
            }

            // Insert the new record if all validations pass
          String q = "INSERT INTO mechlogin(email, name, username, password, cpassword, phone, address, vehicle, shop, start, end, city) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(q)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, name);
                preparedStatement.setString(3, uname);
                preparedStatement.setString(4, pass);
                preparedStatement.setString(5, cpass);
                preparedStatement.setString(6, phone);
                preparedStatement.setString(7, address);
                preparedStatement.setString(8, vehicle);
                preparedStatement.setString(9, shop);
                preparedStatement.setString(10, start);
                preparedStatement.setString(11, end);
                preparedStatement.setString(12, city);

                preparedStatement.executeUpdate();
            }

            response.sendRedirect("mecLog.jsp");
        } catch (Exception e) {
            out.println(e);
        }
    }

    private boolean isUsernameExists(String username, Connection con) {
        try {
            String query = "SELECT * FROM mechlogin WHERE username = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                ResultSet resultSet = preparedStatement.executeQuery();

                return resultSet.next(); // Returns true if username exists
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false in case of an error
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
