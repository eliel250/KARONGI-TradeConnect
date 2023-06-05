<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   
    <style>
        .payment-card {
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .payment-card .card-title {
            font-size: 24px;
            margin-bottom: 20px;
        }
        
       
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
 <link rel="stylesheet" href="navbar.css">
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
    <h2 class="mt-4">Payment</h2>

    <div class="row">
        <div class="col-md-6">
            <h4>Checkout Items:</h4>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">Checkout Items:</h5>
                    <div id="productTable" style="display: none;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                List<Map<String, Object>> cartItems = (List<Map<String, Object>>) request.getAttribute("cartItems");
                                double totalPrice = (double) request.getAttribute("totalPrice");

                                if (cartItems != null && !cartItems.isEmpty()) {
                                    for (Map<String, Object> item : cartItems) {
                                        String productName = (String) item.get("productName");
                                        int quantity = (int) item.get("quantity");
                                        double unitPrice = (double) item.get("unitPrice");
                                        double itemTotalPrice = quantity * unitPrice;
                                %>
                                <tr>
                                    <td><%= productName %></td>
                                    <td><%= quantity %></td>
                                    <td><%= unitPrice %></td>
                                    <td><%= itemTotalPrice %></td>
                                </tr>
                                <% 
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="4">No items in cart</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col text-right">
                                <button id="collapseTableBtn" class="btn btn-link">Collapse</button>
                            </div>
                        </div>
                    </div>
                    <div id="totalPriceSection">
                        <div class="row">
                            <div class="col text-right">
                                <h4>Total Price: <%= totalPrice %></h4>
                                <button id="expandTableBtn" class="btn btn-link">Show All</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <h4>Payee Details:</h4>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">Paye Details:</h5>
                    <p>Username: <%= request.getAttribute("username") %></p>
                    <p>Email: <%= request.getAttribute("email") %></p>
                </div>
            </div>
        </div>
    </div>

    <form id="paymentForm" method="post" onsubmit="return validatePaymentForm()">
        <div class="form-group">
            <label for="paymentMethod">Payment Method:</label>
            <select class="form-control" name="paymentMethod" id="paymentMethod">
                
                <option value="mobileMoney">Mobile Money</option>
            </select>
        </div>

        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
        <input type="hidden" name="cartItems" value="<%= cartItems %>">
        <div id="visaCardForm" style="display: none;">
            <div class="payment-card mb-4">
                <h4 class="card-title">Visa Card Details:</h4>
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="cardNumber" id="cardNumber" required>
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="mobileMoneyForm" style="display: none;">
            <div class="payment-card mb-4">
                <h4 class="card-title">Mobile Money Details:</h4>
                <div class="form-group">
                    <label for="mobileNumber">Mobile Number:</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">+250</span>
                        </div>
                        <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" required>
                    </div>
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-primary"> <a href="thankforshoping.htm">PAY NOW</a></button>
    </form>

   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

    <script>
        document.getElementById("paymentMethod").addEventListener("change", function() {
            var selectedPaymentMethod = this.value;
            var visaCardForm = document.getElementById("visaCardForm");
            var mobileMoneyForm = document.getElementById("mobileMoneyForm");

            if (selectedPaymentMethod === "visa") {
                visaCardForm.style.display = "block";
                mobileMoneyForm.style.display = "none";
            } else if (selectedPaymentMethod === "mobileMoney") {
                visaCardForm.style.display = "none";
                mobileMoneyForm.style.display = "block";
            } else {
                visaCardForm.style.display = "none";
                mobileMoneyForm.style.display = "none";
            }

       
            var form = document.getElementById("paymentForm");
            var totalPriceInput = document.querySelector('input[name="totalPrice"]');
            form.action = "processPayment.htm?paymentMethod=" + selectedPaymentMethod + "&totalPrice=" + totalPriceInput.value;
        });

        function validatePaymentForm() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var cardNumber = document.getElementById("cardNumber");
            var mobileNumber = document.getElementById("mobileNumber");
            var errorMessage = "";

            // Check if both payment methods are selected
            var visaCardForm = document.getElementById("visaCardForm");
            var mobileMoneyForm = document.getElementById("mobileMoneyForm");

            if (visaCardForm.style.display !== "none" && mobileMoneyForm.style.display !== "none") {
                errorMessage = "Please select only one payment method.";
            } else if (paymentMethod === "visa") {
                if (!validateVisaCardNumber(cardNumber.value)) {
                    errorMessage = "Invalid Visa card number. It should have 16 digits.";
                }
            } else if (paymentMethod === "mobileMoney") {
                if (!validateMobileMoneyNumber(mobileNumber.value)) {
                    errorMessage = "Invalid Mobile Money number. It should start with 078 or 079 and have 10 digits.";
                }
            } else {
                errorMessage = "Please select a payment method.";
            }

            if (errorMessage) {
                alert(errorMessage);
                return false;
            }

        
            if (paymentMethod === "visa") {
                mobileNumber.value = "";
            } else if (paymentMethod === "mobileMoney") {
                cardNumber.value = "";
            }

       
            var formData = {
                paymentMethod: paymentMethod,
                cardNumber: cardNumber.value,
                mobileNumber: mobileNumber.value
            };
            alert(JSON.stringify(formData));

            return true;
        }

        function validateVisaCardNumber(cardNumber) {
            var visaCardRegex = /^\d{16}$/;
            return visaCardRegex.test(cardNumber);
        }

        function validateMobileMoneyNumber(mobileNumber) {
            var mobileMoneyRegex = /^(078|079)\d{7}$/;
            return mobileMoneyRegex.test(mobileNumber);
        }
    </script>
</div>
</body>
</html>
