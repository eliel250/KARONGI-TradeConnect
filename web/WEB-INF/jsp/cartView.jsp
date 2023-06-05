<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
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
    <title>Cart</title>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar">
        <a class="navbar-brand" href="#">logo</a>
  
        <ul>
            <li><a href="homepage.htm">Home</a></li>
        </ul>
    
        <ul>
            <li><a href="login.htm">Logout</a></li>
        </ul>
    </nav>
<div class="container">
    <h2>Cart</h2>

    <table class="table">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>${item.unitPrice}</td>
                <td>${item.unitPrice * item.quantity}</td>
                <td>
                    <button class="btn btn-sm btn-danger" onclick="removeFromCart(${item.id})">Remove</button>
                   
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <th colspan="3">Total:</th>
            <th>${totalPrice}</th>
            <th></th>
        </tr>
        </tfoot>
    </table>
   <form id="checkoutForm" action="checkout.htm" method="post">
    <button class="btn btn-primary" type="submit">Checkout</button>
</form>
    <button class="btn btn-secondary" onclick="continueShopping()">Continue Shopping</button>
    <button class="btn btn-danger" onclick="cancelCart()">Cancel Cart</button>
    

</div>

<!-- Include Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- ... -->
<script>
    function removeFromCart(productId) {
        document.getElementById("removeFormProductId").value = productId;
        document.getElementById("removeForm").submit();
    }

    function replaceProduct(productId) {
        if (${not empty currentUser}) {
            window.location.href = "replaceProduct.htm?productId=" + productId;
        } else {
            window.location.href = "login.htm";
        }
    }

    function continueShopping() {
        alert("Redirecting to continue shopping page...");
        window.location.href = "home.htm";
    }

    function cancelCart() {
        var confirmation = confirm("Are you sure you want to cancel the cart? This will remove all items.");

        if (confirmation) {
            document.getElementById("cancelAllForm").submit();
        } else {
            alert("Cart cancellation canceled.");
        }
    }

function checkout() {
    document.getElementById("checkoutForm").submit();
}


</script>
<!-- ... -->

<!-- Hidden forms -->
<form id="removeForm" action="removeFromCart.htm" method="post">
    <input type="hidden" id="removeFormProductId" name="productId" value="">
</form>

<form id="cancelAllForm" action="cancelAllCart.htm" method="post"></form>

</body>
</html>
