<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<title>远程服务器CPU使用情况</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<style type="text/css">
		
		body{
            background-color:#252525;
            background:url("../images/friends.png") right bottom / auto 100% no-repeat fixed ,url("../images/texture.jpg") 0% 0% / auto repeat scroll;
			
        }
		.banner{
			width:100%;
		}
		.design_by {
			font-size: 10px;
			border-radius: 8px 0 0 0;
			padding: 3px;
			position: absolute;
			bottom: 0;
			right: 15px;
			color: #ddd;
			background-color: rgba(0, 0, 0, .5);
			opacity: 0.4;
		}
		.well{
			background-color: oldlace;
		}
	</style>

</head>


<body>
	
	<div class = "container">
		<div class = "banner">
			<img id = "bannerImg" class="banner" src="${pageContext.request.contextPath }/images/banner.png" >
		</div>
		<div class = "well">
			<h1 class="text-primary text-center">服务器使用情况</h1>
			<div class = "row">
				<div class = "col-md-8 offset-3">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline0" name="customRadioInline1" checked = "checked" class="custom-control-input">
						<label class="custom-control-label" for="customRadioInline0">所有服务器</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
						<label class="custom-control-label" for="customRadioInline1">只看胡老师组</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
						<label class="custom-control-label" for="customRadioInline2">只看黄老师组</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
						<label class="custom-control-label" for="customRadioInline3">只看刘老师组</label>
					</div>
				</div>
			</div>
			<div id = "context">

			</div>
		</div>
	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; My Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 -->
	<script
			src="https://code.jquery.com/jquery-3.3.1.js"
			integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>


		//检查单选按钮的点击情况
		 $(function(){
            $.ajax({
                type: "GET",
                url: "groupBy",
                data:{gid:0,pn:1},
                timeout: 2000,
                success: function (data) {
                    var obj = $('<code></code>').append($(data))
					var table = $("#context",obj)
                    $('#context').html(table.html())
                }
            })
		})
		$(':radio').on('click',function() {
			var gid = this.id[this.id.length-1]
            $.ajax({
                type: "GET",
                url: "groupBy",
				data:{gid:gid},
                timeout: 2000,
                success: function (data) {
                    var obj = $('<code></code>').append($(data))
                    var table = $('#context',obj)

                    $('#context').html(table.html())

                }
            })
        })




	</script>
</body>
</html>