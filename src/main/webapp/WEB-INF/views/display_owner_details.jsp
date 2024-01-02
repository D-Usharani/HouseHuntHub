<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.househunt.model.RentalData" %>

<html>
<head>
    <title>Admin Dashboard</title>
 <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
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
          

        .sidebar a {
            padding: 16px;
            text-decoration: none;
            font-size: 20px;
            color: white;
            display: block;
        }

       
 h1 {
             color: rgb(163, 16, 119); 
        }
        .profile-container {
            text-align:center;
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            text-align: center;
            max-width: 150px;
            width: 100%;
            float: right;
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

      
     h2 {
             color: rgb(163, 16, 119); 
        }

  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: rgba(159, 248, 248, 0.301);
    margin: 0;
    padding: 0;
    display: flex;
    height: 100vh;
}

.sidebar {
    float: left;
    width: 270px;
    height: 100%;
    background-color: black;
    padding-top: 20px;
    overflow-x: hidden;
    padding-top: 20px;
    position: sticky;
    top: 0; /* Stick to the top */
}


.content {
    margin: 0 auto; /* Center the content horizontally */
    padding: 1px 16px;
    flex-grow: 1;
    overflow: auto; /* Allow the content to scroll */
    max-width: 1200px; /* Adjust the maximum width as needed */
    
}

/* Rest of your styles... */

table {
    width: 100%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    max-height: calc(100vh - 30px); /* Set maximum height for the table */
    overflow-y: auto; /* Enable vertical scrolling for the table */
}
  

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
       background-color: rgba(159, 248, 248, 0.301);
        color: black;
    }

    tbody tr:hover {
        background-color: #f5f5f5;
    }
    </style>
</head>
<body>
 <!-- Sidebar -->
     <div class="sidebar">
        <a href="HouseHunt"><img src="images/logo-png.png" alt="" width="130px " height="70px"></a>
        <a href="OwnerDetails">Owners List</a>
        <a href="TenantDetails">Tenants List</a>
        <a href="details">Queries</a>
    </div>

    <!-- Page content -->
    <div class="content">
        <div class="dashboard-container">
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
                           
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="HouseHunt"><i class="fas fa-sign-out-alt fa-fw"></i> Log Out</a>
                        </div>
                        </li>
                    </ul>
                </div>
            </nav>

    <h2>Owners List</h2>
    
    <table border="1">
        <tr>
            <th>Rental ID</th>
            <th>Owner ID</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Area</th>
            <th>Rent</th>
            <th>Size</th>
            <th>Family Status</th>
        </tr>
        
        <% List<RentalData> ownerDetailsList = (List<RentalData>)request.getAttribute("ownerDetailsList");
           for (RentalData rentalData : ownerDetailsList) { %>
            <tr>
                <td><%= rentalData.getRentalId() %></td>
                <td><%= rentalData.getOwnerId() %></td>
                <td><%= rentalData.getFullName() %></td>
                <td><%= rentalData.getPhone() %></td>
                <td><%= rentalData.getAddress() %></td>
                <td><%= rentalData.getArea() %></td>
                <td><%= rentalData.getRent() %></td>
                <td><%= rentalData.getSize() %></td>
                <td><%= rentalData.getFamilyStatus() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
