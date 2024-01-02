<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <title>Owner Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script>
    
    /*inspect mode*/
    // Disable right-click context menu
document.addEventListener("contextmenu", function (e) {
    e.preventDefault();
});
 
    </script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: rgba(159, 248, 248, 0.301);
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden; /* hide the scroll bars */
        }

        .sidebar {
            float: left;
            width: 250px;
            height: 100%;
            background-color: black;
            padding-top: 20px;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 16px;
            text-decoration: none;
            font-size: 20px;
            color: white;
            display: block;
        }

        .content {
            margin-left: 0;
            padding: 1px 16px;
            flex-grow: 1;
            overflow: auto; /* enable scrolling in the content area */
        }

        h2 {
            color: rgb(163, 16, 119);
        }

        .profile-container {
            text-align: center;
            margin-top: 20px;
            padding: 20px;
            background-color: rgba(159, 248, 248, 0.301);
            text-align: center;
            width: 50%; /* adjust the width as needed */
            margin: 0 auto; /* center the container */
        }

        .profile-container table {
            width: 100%;
        }

        .profile-container table td {
            padding: 10px;
        }

        .profile-pic {
            display: inline-block;
            vertical-align: middle;
            width: 50px;
            height: 50px;
            overflow: hidden;
            border-radius: 50%;
        }

        .profile-pic img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .profile-menu .dropdown-menu {
            right: 0;
            left: unset;
        }

        .profile-menu .fa-fw {
            margin-right: 10px;
        }

        .toggle-change::after {
            border-top: 0;
            border-bottom: 0.3em solid;
        }

        /* Navbar styles */
        .navbar {
            background-color: white !important; /* Use !important to override Bootstrap styles */
        }

        .navbar-nav {
            margin-left: auto;
        }

        .navbar-nav .nav-item {
            padding: 0 10px;
        }

        .navbar-nav .nav-link {
            color: black;
        }

        .sidebar a:hover {
            transform: scale(1.1); /* Increase the size on hover */
            z-index: 2; /* Ensure the hovered link is on top of other elements */
            box-shadow: 0 0 10px white; /* Add a subtle box shadow on hover */
            transition: all 0.3s ease; /* Add a smooth transition effect */
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="HouseHunt"><img src="images/logo-png.png" alt="" width="130px " height="70px"></a>
        <a href="OwnerProfile">View Profile</a>
        <a href="AddProperty">Add Property</a>
        <a href="ownerProperties">Property List</a>
        <a href="update_status">Booking Requests</a>
    </div>

    <!-- Page content -->
    <div class="content">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 profile-menu">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="profile-pic">
                                <img src="images/icons8-user-48.png" alt="Profile Picture">
                            </div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="OwnerProfile"><i class="fas fa-sliders-h fa-fw"></i> Account</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="LogoutServlet"><i class="fas fa-sign-out-alt fa-fw"></i> Log Out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
<br><br><br>
        <div class="profile-container">
            <h2>Owner Profile</h2>

            <%-- Retrieve owner details from the database --%>
            <%
                String username = (String) session.getAttribute("username");

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish a connection
                    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/househunthub", "root", "root")) {
                        // Prepare SQL query
                        String sql = "SELECT * FROM ownerregister WHERE username = ?";
                        try (PreparedStatement statement = connection.prepareStatement(sql)) {
                            statement.setString(1, username);

                            // Execute the query
                            try (ResultSet resultSet = statement.executeQuery()) {
                                // Check if the result set has data
                                if (resultSet.next()) {
                                    String fullName = resultSet.getString("full_name");
                                    String phone = resultSet.getString("phone");
                                    String address = resultSet.getString("address");

                                    // Display the retrieved details
                            %>
                                    <table>
                                        <tr>
                                            <td><strong>Full Name:</strong></td>
                                            <td><%= fullName %></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Phone:</strong></td>
                                            <td><%= phone %></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Address:</strong></td>
                                            <td><%= address %></td>
                                        </tr>
                                    </table>
                            <%
                                } else {
                                    out.println("No data found for the owner.");
                                }
                            }
                        }
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("Error retrieving owner details.");
                }
            %>
        </div>
    </div>

</body>
</html>
