<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.5.0/css/bootstrap.min.css">
    <style>
        .btn {
            height: 30px;
            width: 300px;
            margin-top: 5px;
            background-color: green;
            color: #fff;
            margin-left: 5px;
        }
        
        .label {
            border: none;
            text-align: center;
            border-bottom: solid 2px;
            height: 30px;
            width: 300px;
            margin-top: 0px;
            font-size: 16px;
        }
        
        .container form {
            width: 90%;
            max-width: 600px;
            padding: 50px 50px 50px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            position: relative;
            margin: 0 auto;
        }
        
        .container {
            min-height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        h1 {
            color: blue;
        }
        
        h3 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <a href="adminIndex.htm" class="btn btn-primary">Home</a>
      <h1>Edit Product</h1>
    <div class="container">
        <div class="mt-3">
          
          
        </div>
        
        <div class="container form">
            <form method="POST">
                <input type="text" name="id" class="label" value="${EditTrader[0].id}"><br>
                <input type="text" name="name" class="label" value="${EditTrader[0].username}"><br>
                <input type="text" name="description" class="label" value="${EditTrader[0].password}"><br>
               
                
                <hr>
                <input type="Submit" value="Submit" class="btn"><br>
            </form>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.5.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
