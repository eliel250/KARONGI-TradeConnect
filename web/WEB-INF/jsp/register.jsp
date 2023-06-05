<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form {
            width: 90%;
            max-width: 600px;
            padding: 50px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            margin-top: -150px;
        }

        h1 {
            color: blue;
            text-align: center;
            margin-bottom: 20px;
        }

        .label {
            border: none;
            text-align: center;
            border-bottom: solid 2px;
            height: 30px;
            width: 100%;
            margin-top: 10px;
            font-size: 16px;
        }

        input[type="number"],
        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        input[type="submit"] {
            background-color: green;
            color: #fff;
            height: 30px;
            width: 100%;
            margin-top: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        ::file-selector-button {
            padding: 8px 15px;
            background-color: green;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>

    <script>
        function validateForm() {
            var name = document.forms["myForm"]["name"].value;
            var description = document.forms["myForm"]["description"].value;
            var price = document.forms["myForm"]["price"].value;
            var image = document.forms["myForm"]["image"].value;

            if (name == "") {
                alert("Please enter a name.");
                return false;
            }

            if (description == "") {
                alert("Please enter a description.");
                return false;
            }

            if (price == "") {
                alert("Please enter a price.");
                return false;
            }

            if (image == "") {
                alert("Please select an image.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div>
        <h1>NEW Product</h1>
    </div>
    <div class="container">
        <form method="POST" onsubmit="return validateForm()" class="form">
            <input type="text" name="name" placeholder="Enter Name" class="label"><br>
            <input type="text" name="description" placeholder="Enter Description" class="label"><br>
            <input type="number" name="price" placeholder="Enter Price" class="label"><br>
            <hr>
            <input type="file" name="image">
            <br>
            <input type="submit" name="submit" value="INSERT">
        </form>
    </div>
</body>
</html>
