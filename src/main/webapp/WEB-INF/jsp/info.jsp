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
	<link rel="stylesheet" href="./css/common.css">
</head>

<body>
	
	<div class = "container">
		<div id = "bannerId"><img src = "./images/banner.png"></div>
		<h1 class="text-primary text-center">服务器使用情况A</h1>
		<div class = "row">
			<div class = "col-md-8 offset-3">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline" name="customRadioInline1" checked = "checked" class="custom-control-input">
					<label class="custom-control-label" for="customRadioInline">所有服务器</label>
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
	</div>
	<div class = "container" id = "context">
		<div class = "row">
			<div class = "col-md-10 offset-1">

				<table class = "table table-hover text-center">
				<thead>
					<tr>
					<td>Hostname</td>
					<td>IP</td>
					<td>CPU</td>
					<td>使用情况</td>
					<td>连线情况</td>
					<td>空闲时通知我</td>
					</tr>
				</thead>
				
				<c:forEach items="${allInfo.list }" var = "info">

					<tr>
					<td>${info.hostname }</td>
					<td>${info.ip }</td>
					<td>${info.cpu }</td>
					<td class = "text-danger">
					<c:if test="${info.cpu<10 }">Free</c:if>
					<c:if test="${info.cpu>=10 }"><a id="reserve" class="btn secondary|success|info|warning|danger btn-sm" href="#" role="button">预定</a></c:if>
					</td>
					<td>
					<c:if test = "${info.time<2 }">连线正常</c:if>
					<c:if test = "${info.time>= 2 }">disconnected</c:if>
					</td>
										
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-3">
			共有<kbd>${allInfo.total }</kbd>条信息，当前为第${allInfo.pageNum }页
			</div>
			<div class = "col-md-6">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test = "${allInfo.hasPreviousPage }">
							<li class="page-item"><a class="page-link" href="/butterfly/info/all?pn=${allInfo.pageNum-1 }">Previous</a></li>
						</c:if>
						
						<c:forEach items = "${allInfo.navigatepageNums }" var = "navPage">
							<c:if test = "${allInfo.pageNum == navPage }">
								<li class="page-item active"><a class="page-link" href="#">${navPage }</a></li>
							</c:if>
							<c:if test = "${allInfo.pageNum != navPage }">
								<li class="page-item"><a class="page-link" href="/butterfly/info/all?pn=${navPage }">${navPage }</a></li>
							</c:if>
						</c:forEach>
						
						<c:if test ="${allInfo.hasNextPage }">
							<li class="page-item"><a class="page-link" href="/butterfly/info/all?pn=${allInfo.pageNum+1 }">Next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class = "col-md-2">
			<button class = "btn btn-primary" id="reload"><i class="fa fa-refresh" aria-hidden="true"></i>刷新</button>
			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		function reloading() {
			window.location.replace("all");
        }
        
        var el = document.getElementById("reload");
		el.addEventListener("click",reloading);

		//检查单选按钮的点击情况
        $(':radio').on('click',function(){
            var value = $(this).attr('id')
			window.alert(value)
			$("#context").load("test.html #context")
		})

	</script>
	</body>
</html>