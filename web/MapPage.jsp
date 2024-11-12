<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>View Map</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        /* General styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            min-height: 100vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        h2 {
            color: #007bff;
            text-align: center;
            font-weight: 600;
            margin-bottom: 20px;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Rectangular box */
        .rectangular-box {
            background-color: #bbfaf9;
            width: 800px;
            height: 120px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            top: 200px;
            left: 300px;
            opacity: 0;
            border-radius: 10px;
            padding: 0 20px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            animation: img1 1s forwards;
            animation-delay: 3s;  /* Delay after loader */
        }

        .map-link, .back-button {
            padding: 5px 10px;
            background-color: #ff8c00;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 400;
            font-size: 30;
            
        }

        .map-link:hover, .back-button:hover {
            background-color: #ff6f00;
            transform: scale(1.05);
        }

        .back-button {
            background-color: #ff6f00;
        }

        .back-button:hover {
            background-color: #0056b3;
        }

        .back-button i {
            margin-right: 8px;
        }

        @keyframes img1 {
            0% {
                top: -600px;
                opacity: 0;
            }
            100% {
                top: 200px;
                opacity: 1;
            }
        }

        /* SVG loader styles */
        .bike {
            display: block;
            margin: auto;
            width: 16em;
            height: auto;
            animation: fadeOut 1s forwards;
            animation-delay: 3s; 
        }

        * {
	border: 0;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
:root {
	--hue: 223;
	--bg: hsl(var(--hue),90%,90%);
	--fg: hsl(var(--hue),90%,10%);
	--primary: hsl(var(--hue),90%,50%);
	--trans-dur: 0.3s;
	font-size: calc(16px + (32 - 16) * (100vw - 320px) / (2560 - 320));
}

.bike {
	display: block;
	margin: auto;
	width: 16em;
	height: auto;
        margin-left: 470px;
}
.bike__body,
.bike__front,
.bike__handlebars,
.bike__pedals,
.bike__pedals-spin,
.bike__seat,
.bike__spokes,
.bike__spokes-spin,
.bike__tire {
	animation: bikeBody 1.5s ease-in-out infinite;
	stroke: var(--primary);
	transition: stroke var(--trans-dur);
}
.bike__front {
	animation-name: bikeFront;
}
.bike__handlebars {
	animation-name: bikeHandlebars;
}
.bike__pedals {
	animation-name: bikePedals;
}
.bike__pedals-spin {
	animation-name: bikePedalsSpin;
}
.bike__seat {
	animation-name: bikeSeat;
}
.bike__spokes,
.bike__tire {
	stroke: currentColor;
}
.bike__spokes {
	animation-name: bikeSpokes;
}
.bike__spokes-spin {
	animation-name: bikeSpokesSpin;
}
.bike__tire {
	animation-name: bikeTire;
}


@media (prefers-color-scheme: dark) {
	:root {
		--bg: hsl(var(--hue),90%,10%);
		--fg: hsl(var(--hue),90%,90%);
	}
}

/* Animations */
@keyframes bikeBody {
	from { stroke-dashoffset: 79; }
	33%,
	67% { stroke-dashoffset: 0; }
	to { stroke-dashoffset: -79; }
}
@keyframes bikeFront {
	from { stroke-dashoffset: 19; }
	33%,
	67% { stroke-dashoffset: 0; }
	to { stroke-dashoffset: -19; }
}
@keyframes bikeHandlebars {
	from { stroke-dashoffset: 10; }
	33%,
	67% { stroke-dashoffset: 0; }
	to { stroke-dashoffset: -10; }
}
@keyframes bikePedals {
	from {
		animation-timing-function: ease-in;
		stroke-dashoffset: -25.133;
	}
	33%,
	67% {
		animation-timing-function: ease-out;
		stroke-dashoffset: -21.991;
	}
	to {
		stroke-dashoffset: -25.133;
	}
}
@keyframes bikePedalsSpin {
	from { transform: rotate(0.1875turn); }
	to { transform: rotate(3.1875turn); }
}
@keyframes bikeSeat {
	from { stroke-dashoffset: 5; }
	33%,
	67% { stroke-dashoffset: 0; }
	to { stroke-dashoffset: -5; }
}
@keyframes bikeSpokes {
	from {
		animation-timing-function: ease-in;
		stroke-dashoffset: -31.416;
	}
	33%,
	67% {
		animation-timing-function: ease-out;
		stroke-dashoffset: -23.562;
	}
	to {
		stroke-dashoffset: -31.416;
	}
}
@keyframes bikeSpokesSpin {
	from { transform: rotate(0); }
	to { transform: rotate(3turn); }
}
@keyframes bikeTire {
	from {
		animation-timing-function: ease-in;
		stroke-dashoffset: 56.549;
		transform: rotate(0);
	}
	33% {
		stroke-dashoffset: 0;
		transform: rotate(0.33turn);
	}
	67% {
		animation-timing-function: ease-out;
		stroke-dashoffset: 0;
		transform: rotate(0.67turn);
	}
	to {
		stroke-dashoffset: -56.549;
		transform: rotate(1turn);
	}
}
        @media (prefers-color-scheme: dark) {
            :root {
                --bg: hsl(var(--hue), 90%, 10%);
                --fg: hsl(var(--hue), 90%, 90%);
            }
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
                visibility: hidden;
            }
        }
    </style>

    <!-- Include font-awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <% 
        String name = request.getParameter("name");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
    %>

    <!-- Loader section with SVG animation -->
    <svg class="bike" viewBox="0 0 48 30" width="48px" height="30px">
        <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1">
            <g transform="translate(9.5,19)">
                <circle class="bike__tire" r="9" stroke-dasharray="56.549 56.549" />
                <g class="bike__spokes-spin" stroke-dasharray="31.416 31.416" stroke-dashoffset="-23.562">
                    <circle class="bike__spokes" r="5" />
                    <circle class="bike__spokes" r="5" transform="rotate(180,0,0)" />
                </g>
            </g>
            <g transform="translate(24,19)">
                <g class="bike__pedals-spin" stroke-dasharray="25.133 25.133" stroke-dashoffset="-21.991" transform="rotate(67.5,0,0)">
                    <circle class="bike__pedals" r="4" />
                    <circle class="bike__pedals" r="4" transform="rotate(180,0,0)" />
                </g>
            </g>
            <g transform="translate(38.5,19)">
                <circle class="bike__tire" r="9" stroke-dasharray="56.549 56.549" />
                <g class="bike__spokes-spin" stroke-dasharray="31.416 31.416" stroke-dashoffset="-23.562">
                    <circle class="bike__spokes" r="5" />
                    <circle class="bike__spokes" r="5" transform="rotate(180,0,0)" />
                </g>
            </g>
            <polyline class="bike__seat" points="14 3,18 3" stroke-dasharray="5 5" />
            <polyline class="bike__body" points="16 3,24 19,9.5 19,18 8,34 7,24 19" stroke-dasharray="79 79" />
            <path class="bike__handlebars" d="m30,2h6s1,0,1,1-1,1-1,1" stroke-dasharray="10 10" />
            <polyline class="bike__front" points="32.5 2,38.5 19" stroke-dasharray="19 19" />
        </g>
    </svg>

  
    <h2>
        <div class="rectangular-box" id="infoBox">
            <a href="javascript:void(0);" class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <span>Customer Name: <%= name %></span>
            <a href="javascript:void(0);" class="map-link" onclick="confirmOpenMap('<%= name %>', '<%= latitude %>', '<%= longitude %>')">View Map</a>
        </div>
    </h2>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function confirmOpenMap(name, latitude, longitude) {
            Swal.fire({
                title: 'Do you want to open Google Maps?',
                showCancelButton: true,
                confirmButtonText: 'Yes',
                cancelButtonText: 'No',
                icon: 'question',
                width: '600px',
               
          
                confirmButtonColor: '#007bff',
                cancelButtonColor: '#ff8c00'
            }).then((result) => {
                if (result.isConfirmed) {
                    openMap(name, latitude, longitude);
                }
            });
        }

        function openMap(name, latitude, longitude) {
            window.open('https://www.google.com/maps?q=' + latitude + ',' + longitude, '_blank');
        }
    </script>
</body>
</html>
