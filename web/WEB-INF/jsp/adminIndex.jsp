<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Control Panel</title>
    <link rel="stylesheet" href="navbar.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-right: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .product-image {
            width: 150px;
            height: 200px;
        }
    </style>
</head>

<body>
<nav class="navbar">
        <a class="navbar-brand" href="#">logo</a>
  
        <ul>
            <li><a href="index.htm">Home</a></li>
        </ul>
    
        <ul>
            <li><a href="homepage.htm">Logout</a></li>
        </ul>
    </nav>
    <div class="container mt-4">
        <div class="row">
            <div class="col">
                <h3>Admin Control Panel</h3>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <a href="register.htm" class="btn btn-primary">Add Product</a>
                <a href="allUsers.htm" class="btn btn-primary">View Users</a>
                <a href="registerUser.htm" class="btn btn-primary">Add User</a>
                
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
           <table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Product Image</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ProductList}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>
                    <img src="data:image/jpeg;base64,${product.imageBase64}" alt="Product Image"
                        class="product-image">
                </td>
                <td>
                    <a href="edit.htm?id=${product.id}" class="btn btn-primary">Edit</a>
                    <a href="delete.htm?id=${product.id}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>
