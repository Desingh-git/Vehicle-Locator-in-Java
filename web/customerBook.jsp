<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Booking Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: absolute;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            text-align: center;
            color: #080600;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            animation: fadeIn 1.5s ease-in-out;
        }

        form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            animation: slideIn 1.5s ease-in-out;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-left: 600px;
            margin-top: 40px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 1.1rem;
        }

        input[type="text"],
        input[type="tel"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group {
            width: 48%;
            margin-bottom: 25px; /* Increased spacing between fields */
        }

        
        .full-width {
            width: 100%;
        }

        .get-position-btn, .book-btn {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-bottom: 15px;
        }

        .get-position-btn {
            background-color: #2E2BE2;
            color: #fff;
        }

        .get-position-btn:hover {
            background-color: #2be22e;
            transform: translateY(-5px);
        }

        .book-btn {
            background-color: #E22E2B;
            color: #fff;
        }

        .book-btn:hover {
            background-color: #45a049;
            transform: translateY(-5px);
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
        @keyframes img2 {
            0% {
                left: -600px; 
                opacity: 0; 
            }
            100% {
                left: -10px;
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            form {
                max-width: 90%;
            }

            .form-group {
                width: 100%;
            }

            h1 {
                font-size: 1.8rem;
            }

            input[type="text"], input[type="tel"], .get-position-btn, .book-btn {
                font-size: 1rem;
            }
        }
        .img2 {
            width: 650px;
            height: 650px; 
            position: absolute;
            bottom: -10px; 
            opacity: 0;
            animation: img2 1s forwards; 
            animation-delay: 0.0s; 
          
        
        }
    </style>
</head>
<body>
    <form id="registrationForm">
        <h1>Book Mechanic Shop</h1>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>
        </div>

        <div class="form-group">
            <label for="bikeName">Vehicle Name:</label>
            <input type="text" id="bikeName" name="bikeName" required>
        </div>

        <div class="form-group">
            <label for="problem">Problem:</label>
            <input type="text" id="problem" name="problem" required>
        </div>

        <div class="form-group">
            <label for="latitude">Latitude:</label>
            <input type="text" id="latitude" name="latitude" required readonly>
        </div>

        <div class="form-group">
            <label for="longitude">Longitude:</label>
            <input type="text" id="longitude" name="longitude" required readonly>
        </div>

        <div class="form-group full-width">
            <input type="button" class="get-position-btn" value="Get Current Position" onclick="getCurrentPosition()">
        </div>

        <div class="form-group full-width">
            <input type="button" class="book-btn" value="Book" onclick="submitForm()">
        </div>
        
    </form>
    <img src="java7.png" alt="Image Description" class="img2">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script>
        function getCurrentPosition() {
            if (navigator.geolocation) {
                const confirmation = confirm("This page wants to access your location. Do you allow?");
                if (confirmation) {
                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                } else {
                    alert("Location access denied by the user.");
                }
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            document.getElementById("latitude").value = position.coords.latitude;
            document.getElementById("longitude").value = position.coords.longitude;
        }

        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("Location information is unavailable.");
                    break;
                case error.TIMEOUT:
                    alert("The request to get user location timed out.");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.");
                    break;
            }
        }

        function submitForm() {
            var name = document.getElementById("name").value;
            var mobile = document.getElementById("mobile").value;
            var bikeName = document.getElementById("bikeName").value;
            var problem = document.getElementById("problem").value;
            var latitude = document.getElementById("latitude").value;
            var longitude = document.getElementById("longitude").value;

            // Validation for empty fields
            if (name === "" || mobile === "" || bikeName === "" || problem === "" || latitude === "" || longitude === "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please fill in all the required fields.',
                });
                return;  // Exit the function if validation fails
            }

            // If validation passes, proceed with the booking
            Swal.fire({
                icon: 'success',
                title: 'Your Booking has been Submitted Successfully!',
                showCancelButton: false,
                confirmButtonText: 'OK',
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'BookingServlet?' + 
                    'name=' + encodeURIComponent(name) +
                    '&mobile=' + encodeURIComponent(mobile) +
                    '&bikeName=' + encodeURIComponent(bikeName) +
                    '&problem=' + encodeURIComponent(problem) +
                    '&latitude=' + encodeURIComponent(latitude) +
                    '&longitude=' + encodeURIComponent(longitude);
                }
            });
        }
    </script>
</body>
</html>
