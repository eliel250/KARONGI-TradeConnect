<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
     <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
       .container {
   margin-top: 20px;
   margin-bottom: 20px;
}

.product-card {
   margin-bottom: 20px;
   border: 1px solid #ccc;
   border-radius: 5px;
   box-shadow: 5px 5px 5px #ccc;
}

.card-img-top {
   height: 200px;
   object-fit: cover;
}

.card-title {
   font-size: 1.2rem;
   font-weight: bold;
}

.card-text {
   margin-bottom: 10px;
}

.btn-primary {
   background-color: #007bff;
   border-color: #007bff;
}

.btn-primary:hover {
   background-color: #0069d9;
   border-color: #0062cc;
}

.btn-secondary {
   background-color: #6c757d;
   border-color: #6c757d;
}

.btn-secondary:hover {
   background-color: #5a6268;
   border-color: #545b62;
}

a {
   text-decoration: none;
   color: white;
}
    </style>
</head>
<body>
<nav class="navbar">
        <a class="navbar-brand" href="#">logo</a>
  
        <ul>
            <li><a href="home.htm">Home</a></li>
        </ul>
    
        <ul>
            <li><a href="index.htm">Logout</a></li>
        </ul>
    </nav>
    <h2>Available Products</h2>
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${ProductList}">
                <div class="col-md-4">
                    <div class="card product-card">
                        <img src="data:image/jpeg;base64,${product.imageBase64}" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Price: $${product.price}</p>
                            <button class="btn btn-primary" onclick="addToCart(${product.id}, ${product.price})">Add to Cart</button>
                            <button class="btn btn-secondary"><a href="checkout.htm?id=${product.id}" style="color: white;">View Details</a></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        function addToCart(productId, price) {
            // Check if the user is logged in
            var currentUser = '${currentUser}';
            if (currentUser != null && currentUser.length > 0) {
                var quantity = prompt("Enter the quantity:", "1");

                if (quantity != null && quantity !== "" && !isNaN(quantity)) {
                    var totalPrice = parseFloat(quantity) * parseFloat(price);

                    var form = document.createElement("form");
                    form.method = "post";
                    form.action = "viewCart.htm";

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
                    userIdInput.value = currentUser[0].id; // Assuming user ID is stored in 'id' field

                    form.appendChild(productIdInput);
                    form.appendChild(quantityInput);
                    form.appendChild(totalPriceInput);
                    form.appendChild(userIdInput);

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
