<%-- 
    Document   : meclogin
    Created on : Dec 28, 2023, 4:30:24 PM
    Author     : Sathiyamoorthi A
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Mechanic Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: absolute;
            justify-content: center;
            align-items: center;
            margin: 0;
            overflow: hidden;
            
        }

        .signup-page {
            
            width: 100%;
            max-width: 400px;
            padding: 20px;
            animation: fadeIn 1.5s ease-in-out;
         margin-top:100px;
         margin-left:100px;
        }

        .form-bg {
             
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            animation: slideIn 1.5s ease-in-out;
            width: 1100px;
            height: 350px;
        }

        h2 {
            font-size: 30px;
            color: #202c39;
            text-align: center;
            margin-bottom: 20px;
            max-width: 50%;
            animation: fadeIn 1.5s ease-in-out;
        }

        .form-group {
            margin-bottom: 20px;
            max-width: 50%;
            
        }

        .form-control {
            height: 45px;
            border-radius: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
        }

        .signup-btn {
            background-color: #d93025;
            color: #fff;
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .signup-btn:hover {
            background-color: #45a049;
            transform: translateY(-5px);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 20px;
            max-width: 70%;
        }

        .login-link a {
            color: #d93026;
            
        }

        .login-link a:hover {
            text-decoration: underline;
        }
         .img1 {
            width: 500px;
            height: 500px; 
            position: absolute;
            bottom: 150px; 
            opacity: 0;
            animation: img1 1s forwards; 
            animation-delay: 0.5s; 
          
        
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
         @keyframes img1 {
            0% {
                right: -600px; 
                opacity: 0; 
            }
            100% {
                right: 70px;
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="signup-page">
        <div class="form-bg">
            <h2>Mechanic Login Form</h2>
            <form action="mechlogin" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="signup-btn">Login</button>
                     <div class="login-link">
            <p>Don't have an account? <a href="mecSign.jsp">Sign up</a></p>
        </div>
                </div>
            </form>
        </div>
       
    </div>
    <img src="java3.png" alt="Image Description" class="img1">
</body>
</html>
