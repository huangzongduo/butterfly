<%--
  Created by IntelliJ IDEA.
  User: Caleb
  Date: 2018/11/20
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册用户</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>
<div class = "container">
    <div class = "row">
        <div class = "col-md-4 offset-4">
            <form id = 'register' action = "/butterfly/admin/register" method = "post">
                <div class="form-group">
                    <label for="exampleInputEmail1">username</label>
                    <input type="text" class="form-control" id="username" name = "username" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" name = "email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" name = "password" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-check">
                    <input type="checkbox" id="check">
                    <label class="form-check-label" for="check">我已阅读相关条例并同意</label>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">相关条例</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                                相关解释权归黄宗铎所有</br>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id = "finished">阅读完毕</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" id = 'submit'>Submit</button>
        	</form>
        </div>
    </div>
</div>


</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<script>
    function showModal(){
        $('#exampleModalLong').modal('show')
    }
    $('#check').on('click',showModal)
    $('#finished').on('click',function () {
        $('#exampleModalLong').modal('hide')
    })
    $('#submit').on('click',function (e) {
        e.preventDefault()
        if(!$('#check').prop('checked'))
            alert('请阅读相关条例')
        if($('#check').prop('checked')){
            var details = $('#register').serialize()
            $.post('register',details,function (data) {
                $('#register').html(data)
            })
        }

    })


</script>
</body>
</html>
