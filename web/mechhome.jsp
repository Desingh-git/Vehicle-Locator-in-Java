<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* Navbar styling */
        .navbar {
            width: 100%;
            background-color:#5a9bd5;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: fadeIn 1s ease-in-out;
        }

        .topBar h2 {
            color: #fff;
            font-size: 20px;
            display: flex;
            align-items: center;
        }

        .topBar h2 i {
            margin-right: 8px;
        }

        ul.navMenu {
            display: flex;
            align-items: center;
        }

        ul.navMenu li {
            list-style: none;
        }

        ul.navMenu li a {
            color: #eee;
            text-decoration: none;
            padding: 10px 20px;
            margin: 5px;
            font-size: 17px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 25px;
        }

        ul.navMenu li a:hover, ul.navMenu li a.active {
            background-color: #eee;
            color: #222831;
            transform: scale(1.05);
        }

        /* Toggle icon for mobile */
        .topBar .toggle {
            display: none;
        }

        /* Responsive design */
        @media (max-width: 740px) {
            ul.navMenu {
                display: none;
                flex-direction: column;
                background: #161a20;
                width: 100%;
                margin-top: 20px;
                border-radius: 10px;
                text-align: center;
            }

            .topBar .toggle {
                display: block;
                font-size: 30px;
                color: #eee;
                cursor: pointer;
            }

            ul.navMenu li {
                margin: 15px 0;
                animation: slideIn 0.5s ease forwards;
            }

            ul.navMenu li a {
                font-size: 20px;
                padding: 15px;
            }
        }

        /* Keyframes for animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateX(50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        /* Content container styling */
        #contentContainer {
            width: 100%;
            max-width: 1200px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            display: none;
            animation: fadeIn 1s ease-in-out;
        }

        /* Smooth scroll */
        html {
            scroll-behavior: smooth;
        }
        @keyframes img2 {
            0% {
                bottom: -600px; 
                opacity: 0; 
            }
            100% {
                bottom: 20px;
                opacity: 1;
            }
        }
         .img2 {
            width: 600px;
            height: 600px; 
            position: relative;
       
            
            opacity: 0;
            animation: img2 1s forwards; 
            animation-delay: 0.5s; 
          
        
        }
    </style>

    <title>Mechanic Dashboard</title>
</head>
<body>
    <nav class="navbar">
        <div class="topBar">
            <h2>
                <i class="material-icons" style="color: green;">account_circle</i>&nbsp;
                <% String username = (String) request.getSession().getAttribute("username");
                   if (username != null) {
                       out.println("Welcome&nbsp;Mr.&nbsp;" + username + "!");
                   }
                %>
            </h2>
            <i class="material-icons toggle">menu</i>
        </div>

        <ul class="navMenu">
            <li><a href="#" id="live"><i class="material-icons" style="color: purple;">location_on</i>&nbsp;Show Customer</a></li>
            <li><a href="start.jsp" id="logoutLink"><i class="material-icons" style="color: red;">logout</i>&nbsp;Logout</a></li>
        </ul>
    </nav>

    <div id="contentContainer">
        <!-- Dynamic content will be loaded here -->
    </div>
            <img src="java4.png" alt="Image Description" class="img2">

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const toggle = document.querySelector('.toggle');
            const navMenu = document.querySelector('.navMenu');
            const navLinks = document.querySelectorAll('.navMenu li a');

            // Toggle navbar menu on small screens
            toggle.addEventListener('click', function () {
                navMenu.style.display = navMenu.style.display === 'flex' ? 'none' : 'flex';
            });

            // Add 'active' class to the clicked link and remove from others
            navLinks.forEach(function (link) {
                link.addEventListener('click', function (event) {
                    if (!link.href.includes('start.jsp')) {
                        link.classList.toggle('active');
                        navLinks.forEach(function (otherLink) {
                            if (otherLink !== link) {
                                otherLink.classList.remove('active');
                            }
                        });
                    }
                });
            });
        });

        // Load content into the container
        document.getElementById('live').addEventListener('click', function (event) {
            event.preventDefault();
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'livemap.jsp', true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('contentContainer').innerHTML = xhr.responseText;
                    document.getElementById('contentContainer').style.display = 'block';
                    document.getElementById('contentContainer').scrollIntoView({ behavior: 'smooth' });
                }
            };

            xhr.send();
        });
    </script>
</body>
</html>
