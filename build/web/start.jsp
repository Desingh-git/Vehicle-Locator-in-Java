<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roadside Vehicle Breakdown Assistant Locator</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
             background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            min-height: 100vh;
            overflow: hidden;
        }

        /* Header Styles */
        .header {
            text-align: center;
            padding: 1.5rem;
            color: white;
            background-color: #5a9bd5;
            animation: fadeIn 2s ease-in-out;
        }

        .header h1 {
            font-size: 2.5rem;
            margin: 0;
        }

        /* Container Flexbox to center elements horizontally */
        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Keep container below the header */
            padding-top: 50px; /* Space between the header and the box */
        }

        /* Flux Box Styles */
        .flux-box {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 1rem;
            padding: 2rem;
            width: 400px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: slideIn 1.5s ease-in-out;
        }

        .flux-box h2 {
            margin-bottom: 1.5rem;
        }

        /* Button Styles */
        button {
            padding: 15px 25px;
            border: none;
            font-size: 18px;
            margin: 8px 0;
            cursor: pointer;
            border-radius: 30px;
            width: 100%;
            background-color: #5a9bd5;
            color: white;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #357ABD;
            transform: translateY(-5px);
        }

        button:active {
            background-color: #285a8d;
            transform: translateY(-2px);
        }
        .img1 {
            width: 500px;
            height: 500px; 
            position: absolute;
            right: -100px;
            bottom: 20px; 
            opacity: 0;
            animation: img1 2s forwards; 
            animation-delay: 0.5s; 
          
        
        }
        .img2 {
            width: 500px;
            height: 500px; 
            position: absolute;
            right: -100px;
            bottom: 20px; 
            opacity: 0;
            animation: img2 2s forwards; 
            animation-delay: 0.5s; 
          
        
        }

        /* Link Styles */
        a {
            text-decoration: none;
            display: block;
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
                right: -40px;
                opacity: 1;
            }
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
        
        

        
        @media (max-width: 480px) {
            .flux-box {
                width: 90%;
                padding: 1.5rem;
            }

            .header h1 {
                font-size: 2rem;
            }

            button {
                font-size: 16px;
                padding: 12px 20px;
            }
        }
        
    </style>
</head>
<body>
    <div class="header">
        <h1>Roadside Vehicle Breakdown Assistant Locator</h1>
    </div>

    <!-- Container for the centered flux-box under the header -->
    <div class="container">
        <div class="flux-box">
            <h2>Join our services</h2>
            <a href="nearbyMechanic.jsp"><button>Find Shop</button></a>
            <a href="mecLog.jsp"><button>Mechanic Login</button></a>
        </div>
    </div>
    <img src="java1 .png" alt="Image Description" class="img1">
      <img src="java2.png" alt="Image Description" class="img2">
</body>
</html>
