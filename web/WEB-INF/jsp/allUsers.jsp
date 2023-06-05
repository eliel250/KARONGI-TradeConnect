
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>users view</title>
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
            <li><a href="adminIndex.htm">Home</a></li>
        </ul>
    
        <ul>
            <li><a href="homepage.htm">Logout</a></li>
        </ul>
    </nav>
          
        <a href="registerUser.htm" class="">new user</a>
        
        <table>
            <tr>
                <th>ID</th>   
                 <th>NAME</th>   
                  
                  
                
            </tr>   
            <c:forEach items="${Users}" var="user">
                <tr>
                    <td>${user.id}</td>    
                    <td>${user.username}</td>
                    
                    
                    <td>
                        
                        <a href="edit.htm?id=${user.id}">EDIT</a>    
                         <a href="delet.htm?id=${user.id}">DELETE</a> 
                    </td>
                    
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
