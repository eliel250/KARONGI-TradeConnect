<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ktconnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .main {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #header {
            text-align: center;
            padding: 10px 0;
        }

        #logo {
            width: 80px;
            height: 80px;
        }

        #logoText {
            margin: 10px 0;
        }

        #body {
            margin-top: 20px;
        }

        h3 {
            text-align: center;
            margin-bottom: 10px;
        }

        h6 {
            text-align: center;
            margin-bottom: 20px;
        }

        .loginform {
            text-align: center;
            margin-bottom: 20px;
        }

        .loginform h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .loginform p {
            margin-bottom: 10px;
        }

        .loginform input[type="text"],
        .loginform input[type="password"] {
            padding: 8px;
            width: 200px;
            border-radius: 3px;
            border: 1px solid #ddd;
        }

        .loginform .submit {
            margin-top: 10px;
        }

        .loginform input[type="submit"] {
            padding: 8px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .login-help {
            text-align: center;
        }

        .login-help a {
            color: #2196f3;
            text-decoration: none;
        }

        #footer {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="main">
        <div id="header">
           
            <a href="#"> <img src="logo.jpg" id="logo" alt=" logo" align="left" /></a>
            <h5 id="logoText">KARONGI TRADE CONNECT</h5>
        </div>

        <div id="body">
            <h3>Welcome to welcome to karongi trade connect</h3>
            <h6>
                We aim to provide traders at Karongi market with an enhanced platform to list their products, expand their customer reach, and improve their overall business performance.
                Customers will benefit from a convenient online shopping experience, enabling them to explore a wide range of products.
            </h6>

            

            <div class="login-help">
                <p>
                    already registered? <a href="login.htm">Click here to login</a>.
                </p>
                <p>
                    New User? <a href="registerUser.htm">Click here to Register</a>.
                </p>
            </div>
        </div>
    </div>

    <div id="footer">
        <p>&nbsp;</p>
        <h6>Copyright 2023 level 7 it group 1</h6>
    </div>
</body>
</html>
