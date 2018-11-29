<%--
  Created by IntelliJ IDEA.
  User: Caleb
  Date: 2018/11/20
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>
<div class = 'context'>
<div class = "container">
    <div class = "row">
        <div style="margin: auto">
            <form id = 'register' action = "login" method = "post">
                <div class="form-group">
                    <label for="username">username</label>
                    <input type="text" class="form-control" id="username" name = "username" placeholder="Enter username">
                </div>
                <small id="username-msg" class="form-text text-muted"></small>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" name = "password" id="exampleInputPassword1" placeholder="Password">
                </div>
                <small id="password-msg" class="form-text text-muted"></small>
                <div class="form-check">
                    <input type="checkbox" id="check">
                    <label class="form-check-label" for="check">remember me</label>
                </div>
                <button class="btn btn-primary" id = 'submit'>Submit</button>
            </form>
        </div>
    </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

</body>
</html>
