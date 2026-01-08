<!DOCTYPE html>
<html lang="en">
<head>
  <title>Mechanic Signup Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Import Google Fonts and Icons -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      
    }

    body {
      background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
      font-family: 'Poppins', sans-serif;
      
    }

    .signup-page {
      display: absolute;
      justify-content: center;
      align-items: center;
      height: 100vh;
      padding: 20px;
      backdrop-filter: blur(10px);
    }
    .signup-btn {
    background-color: #d93025;
    border: none;
    padding: 12px;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    grid-column: span 3; /* Span button across all columns */
    width: 110%; /* Increase width */
    margin-left: -5%;
}

    .form-bg {
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      padding: 30px;
      width: 100%;
      max-width: 800px; /* Increase max-width to fit the 3 columns */
      box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
      animation: fadeIn 1s ease-in-out;
      margin-top: 70px;
      margin-left: 430px;
      
    }

    .form-bg h2 {
      color: #202c39;
      font-size: 30px;
      text-align: center;
      margin-bottom: 20px;
    }

    .form-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr); /* 3 equal columns */
      gap: 20px;
    }

    .form-group {
      margin-bottom: 15px;
      
    }

    .form-control {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      transition: border-color 0.3s ease;
    }

    .form-control:focus {
      border-color: #40527A;
    }

    .signup-btn {
      background-color: #d93025;
      border: none;
      padding: 12px;
      color: white;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      grid-column: span 3; 
    }

    .signup-btn:hover {
      background-color: #b5291f;
    }

    .login-link {
      text-align: center;
      margin-top: 20px;
      grid-column: span 3; 
    }

    .login-link a {
      color: #d93025;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    .img1 {
            width: 600px;
            height: 600px; 
            position: absolute;
            left: -190px;
            bottom: 20px; 
            opacity: 0;
            animation: img1 1s forwards; 
            animation-delay: 0.5s; 
          
        
        }

    .login-link a:hover {
      color: #b5291f;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    @keyframes img1 {
            0% {
                left: -600px; 
                opacity: 0; 
            }
            100% {
                left: -90px;
                opacity: 1;
            }
        }

    @media (max-width: 740px) {
      .form-bg {
        padding: 20px;
        width: 90%;
        
      }

      .form-grid {
        grid-template-columns: 1fr; /* Stack items vertically on small screens */
      }

      .form-bg h2 {
        font-size: 24px;
      }

      .signup-btn {
        font-size: 14px;
        padding: 10px;
      }
    }
  </style>
</head>
<body>
  <div class="signup-page">
    <div class="form-bg">
      <h2>Mechanic Signup Form</h2>
      <form action="mechsign" method="post">
        <div class="form-grid">
          <div class="form-group">
            <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
          </div>
          <div class="form-group">
            <input type="text" name="fullname" class="form-control" placeholder="Full Name" required>
          </div>
          <div class="form-group">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
          </div>
          <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="Password" required>
          </div>
          <div class="form-group">
            <input type="password" name="cpassword" class="form-control" placeholder="Confirm Password" required>
          </div>
          <div class="form-group">
            <input type="text" name="phone" class="form-control" placeholder="Phone Number" required>
          </div>
          <div class="form-group">
            <input type="text" name="address" class="form-control" placeholder="Enter Address" required>
          </div>
          <div class="form-group">
            <select name="vehicle" class="form-control" required>
              <option value="" disabled selected>--Select Service Provider--</option>
              <option value="Two Wheeler">Two Wheeler</option>
              <option value="Four Wheeler">Four Wheeler</option>
              <option value="Both of Them">Both of Them</option>
            </select>
          </div>
          <div class="form-group">
            <input type="text" name="shop" class="form-control" placeholder="Enter Shop Name" required>
          </div>
          <div class="form-group">
            <select name="start" class="form-control" required>
              <option value="" disabled selected>Start Time</option>
              <option>6:00 AM</option>
              <option>7:00 AM</option>
              <option>8:00 AM</option>
               <option>9:00 AM</option>
              <option>10:00 AM</option>
              <option>11:00 AM</option>
              
              
            </select>
          </div>
          <div class="form-group">
            <select name="end" class="form-control" required>
              <option value="" disabled selected>End Time</option>
            
              <option>6:00 PM</option>
              <option>7:00 PM</option>
              <option>8:00 PM</option>
              <option>9:00 PM</option>
              <option>10:00 PM</option>
              <option>11:00 PM</option>
            </select>
          </div>
          <div class="form-group">
            <select name="city" class="form-control" required>
              <option value="" disabled selected>--Select City--</option>
              <option value="Vasanth Nagar">Vasanth Nagar</option>
              <option value="Richmond Circle">Richmond Circle</option>
              <option value="Shanthi Nagar">Shanthi Nagar</option>
            <option value="Shivaji Nagar">Shivaji Nagar</option>
            <option value="Bangalore">Bangalore</option>
            </select>
          </div>
          <div class="form-group" style="grid-column: span 3;">
    <button type="submit" class="signup-btn">Signup</button>
</div>

        </div>
      </form>
      <div class="login-link">
        <p>Have an account? <a href="mecLog.jsp">Log in</a></p>
      </div>
    </div>
  </div>
        <img src="java6.png" alt="Image Description" class="img1">
</body>
</html>
