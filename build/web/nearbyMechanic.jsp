<%@page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Place Search</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        h2 {
            text-align: center;
            color: #080600;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            animation: fadeIn 1.5s ease-in-out;
        }

        form {
            width: 50%;
            padding: 30px;
            border: none;
            border-radius: 15px;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            animation: slideIn 1.5s ease-in-out;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 1.2rem;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn {
            background-color: #ffc107;
            color: #212529;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            background-color: #28a745;
            color: white;
            transform: translateY(-5px);
        }

        table {
            display: none;
            width: 85%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease-in-out;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .edit-link {
            color: #ff8c00;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .edit-link:hover {
            background-color: #ff8c00;
            color: white;
        }
       .img2 {
            width: 400px;
            height: 400px; 
            position: absolute;
           
            bottom: -10px; 
            opacity: 0;
            animation: img2 2s forwards; 
            animation-delay: 0.5s; 
          
        
        }
        @keyframes img2 {
            0% {
                left: -600px; 
                opacity: 0; 
            }
            100% {
                left: -40px;
                opacity: 1;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Media Query for Smaller Screens */
        @media (max-width: 768px) {
            form {
                width: 90%;
            }

            table {
                width: 95%;
            }

            h2 {
                font-size: 1.8rem;
            }

            select, .btn {
                font-size: 0.9rem;
            }
        }
    </style>
    <script>
        function showTable() {
            var table = document.getElementById("resultTable");
            table.style.display = "table"; // Display the table when called
        }
    </script>
</head>
<body>

<%
    // Check if the user has submitted the form
    String placeName = request.getParameter("city");

    if (placeName != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "");
            String query = "SELECT * FROM mechlogin WHERE city = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, placeName);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // Retrieve profile details from the database
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String mobile = rs.getString("phone");
                String vehicle = rs.getString("vehicle");
                String start = rs.getString("start");
                String end = rs.getString("end");
                String shop = rs.getString("shop");

                // Store values in session
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("address", address);
                session.setAttribute("mobile", mobile);
                session.setAttribute("vehicle", vehicle);
                session.setAttribute("start", start);
                session.setAttribute("end", end);
                session.setAttribute("shop", shop);
%>
                <!-- Display the table at the bottom of the page -->
                <table id="resultTable">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Mobile No</th>
                        <th>Vehicle Service</th>
                        <th>Open Time</th>
                        <th>Close Time</th>
                        <th>Shop Name</th>
                        <th>Action</th> 
                    </tr>
                    <tr>
                        <td><%= name %></td>
                        <td><%= email %></td>
                        <td><%= address %></td>
                        <td><%= mobile %></td>
                        <td><%= vehicle %></td>
                        <td><%= start %></td>
                        <td><%= end %></td>
                        <td><%= shop %></td>
                        <td>
                            <a class="edit-link" href="customerBook.jsp?address=<%= address %>"
                            onclick="setAddressCookie('<%= URLEncoder.encode(address, "UTF-8") %>')">Book</a>
                        </td>
                    </tr>
                </table>
                <script>
                    showTable(); // Call the JavaScript function to display the table
                </script>
<%
            } else {
%>
                <p>No profile details found for the specified place.</p>
<%
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

<form action="" method="get" class="form">
    <h2 class="mb-4">Search Nearby Mechanic Place</h2>

    <div class="form-group">
        <label for="place">Select Your Place:</label>
        <select class="form-control" name="city" required>
            <option value="Vasanth Nagar">Vasanth Nagar</option>
            <option value="Richmond Circle">Richmond Circle</option>
            <option value="Shanthi Nagar">Shanthi Nagar</option>
            <option value="Shivaji Nagar">Shivaji Nagar</option>
            <option value="Bangalore">Bangalore</option>
        </select>
    </div>

    <button type="submit" class="btn">Search</button>
</form>
      <img src="java5.png" alt="Image Description" class="img2">
</body>
</html>
