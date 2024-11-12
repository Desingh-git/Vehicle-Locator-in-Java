<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        table {
            width: 85%;
            border-collapse: collapse;
            margin: 20px;
            background-color: #f8f9fa;
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

        .map-link {
            color: #ff8c00;
            text-decoration: none;
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #ff8c00;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .map-link:hover {
            background-color: #ff8c00;
            color: white;
        }
    </style>
</head>

<body>
    <div class="container mt-4">
        <div class="booking-heading">
            <h2 style="color:white; text-align:center; font-size: 20px; background-color: #bd8749; padding: 10px;">See place in Map.</h2>
        </div><br>
    
        <table>
            <tr>
                <th>Name</th>
                <th>Mobile</th>
                <th>Bike Name</th>
                <th>Problem</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Action</th>
            </tr>
            <%
                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclelocator", "root", "");

                    // Query only from booking table
                    String query = "SELECT name, mobile, bikeName, problem, latitude, longitude FROM booking";
                    
                    statement = connection.prepareStatement(query);
                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        String name = resultSet.getString("name");
                        String mobile = resultSet.getString("mobile");
                        String latitude = resultSet.getString("latitude");
                        String longitude = resultSet.getString("longitude");
                        %>
                        <tr>
                            <td><%= name %></td>
                            <td><%= mobile %></td>
                            <td><%= resultSet.getString("bikeName") %></td>
                            <td><%= resultSet.getString("problem") %></td>
                            <td><%= latitude %></td>
                            <td><%= longitude %></td>
                            <td>
                                <a href="MapPage.jsp?name=<%= name %>&latitude=<%= latitude %>&longitude=<%= longitude %>"
                                   class="map-link">View</a>
                            </td>
                        </tr>
                        <%
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    try {
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>  
</body>
</html>
