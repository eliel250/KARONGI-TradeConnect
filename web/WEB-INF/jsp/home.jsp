<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Available Products</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="cart-icon">
                    <a href="cartView.htm">
                        <img src="cart-icon.png" alt="Cart">
                        <c:if test="${not empty cartItems}">
                            <div class="notification-sign"></div>
                        </c:if>
                    </a>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="product" items="${ProductList}">
                <div class="col-md-4">
                    <div class="card product-card">
                        <img src="data:image/jpeg;base64,${product.imageBase64}" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Price: $${product.price}</p>
                            <button class="btn btn-primary" onclick="addToCart(${product.id}, ${product.price}, '${product.name}', ${product.price})">Add to Cart</button>
                            
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="row h-50 p-0 sticky-top mb-3">
            <div class="col-md-9  ">
                <div class="profile d-inline">
                    <h2>User Profile</h2>
                    <p>Username: ${currentUser.username}</p>
                    <p>Email: ${currentUser.email}</p>
                    <p>Joined At: ${currentUser.createdAt}</p>
                <div class="cart-icon">
        <a href="cartView.htm">
            <img src="cart-icon.png" alt="Cart">
            <c:if test="${not empty cartItems}">
                <div class="notification-sign"></div>
            </c:if>
        </a>
    </div>
                </div>
            </div>
        </div>
    </div>
    
  

    <div class="container mt-5">
        <h2>Available Products</h2>
        <div class="row">
            <c:forEach var="product" items="${ProductList}">
                <div class="col-md-4">
                    <div class="card product-card">
                        <img src="data:image/jpeg;base64,${product.imageBase64}" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Price: $${product.price}</p>
                            <button class="btn btn-primary" onclick="addToCart(${product.id}, ${product.price}, '${product.name}', ${product.price})">Add to Cart</button>
                            <button class="btn btn-secondary"><a href="prod_details.htm?id=${product.id}" style="color: white;">View Details</a></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        function addToCart(productId, price, productName, productPrice) {
            // Check if the user is logged in
            var currentUser = '${currentUser}';
            if (currentUser != null && currentUser.length > 0) {
                var quantity = prompt("Enter the quantity:", "1");

                if (quantity != null && quantity !== "" && !isNaN(quantity)) {
                    var totalPrice = parseFloat(quantity) * parseFloat(price);

                    var form = document.createElement("form");
                    form.method = "POST";
//                    form.action = "prod_details.htm";

                    var productIdInput = document.createElement("input");
                    productIdInput.type = "hidden";
                    productIdInput.name = "id";
                    productIdInput.value = productId;

                    var quantityInput = document.createElement("input");
                    quantityInput.type = "hidden";
                    quantityInput.name = "quantity";
                    quantityInput.value = quantity;

                    var totalPriceInput = document.createElement("input");
                    totalPriceInput.type = "hidden";
                    totalPriceInput.name = "totalPrice";
                    totalPriceInput.value = totalPrice.toFixed(2); // Rounded to 2 decimal places

                    var userIdInput = document.createElement("input");
                    userIdInput.type = "hidden";
                    userIdInput.name = "userId";
                    userIdInput.value = ${currentUser.id}; 

                    var productNameInput = document.createElement("input");
                    productNameInput.type = "hidden";
                    productNameInput.name = "productName";
                    productNameInput.value = productName;

                    var productPriceInput = document.createElement("input");
                    productPriceInput.type = "hidden";
                    productPriceInput.name = "productPrice";
                    productPriceInput.value = productPrice;

                    form.appendChild(productIdInput);
                    form.appendChild(quantityInput);
                    form.appendChild(totalPriceInput);
                    form.appendChild(userIdInput);
                    form.appendChild(productNameInput);
                    form.appendChild(productPriceInput);

                    document.body.appendChild(form);
                    form.submit();

                    alert("Product added to cart! Total Price: $" + totalPrice.toFixed(2));
                } else {
                    alert("Invalid quantity!");
                }
            } else {
                alert("Please login to add products to your cart.");
                window.location.href = "login.htm";
            }
        }
    </script>
</body>
</html>
