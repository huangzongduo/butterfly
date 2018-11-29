<%@ page import="ink.grouphu.bean.Admin" %>
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
	
</head>


<body>

	<div id = "context">
        <div class = "container">
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
                        <td>Group</td>
                        </tr>
                    </thead>

                    <c:forEach items="${infoGroup.list }" var = "info">
                        <c:set var="free" value="0"/>
                        <tr>
                        <td>${info.hostname }</td>
                        <td>${info.ip }</td>
                        <td>${info.cpu }</td>
                        <td class = "text-danger">
                        <c:if test="${info.cpu<10 }">Free</c:if>
                        <c:if test="${info.cpu>=10 }">
                            <%
                                Admin admin = (Admin)session.getAttribute("admin");
                                if(admin==null) {%>
                            <a href="/butterfly/admin/preLogin" class = "login">登录后可预定</a>
                            <%}else{%>
                            <a id="reserve" class="btn secondary|success|info|warning|danger btn-sm msg" href="/butterfly/admin/reserve" role="button">预定</a>
                            <% }

                            %>
                        </c:if>
                        </td>
                        <td>
                        <c:if test = "${info.time<2 }">连线正常</c:if>
                        <c:if test = "${info.time>= 2 }">disconnected</c:if>
                        </td>
                        <td>
                            <c:if test="${info.gid==1 }">胡</c:if>
                            <c:if test="${info.gid==2 }">黄</c:if>
                            <c:if test="${info.gid==3 }">刘</c:if>
                            <c:if test="${info.gid==-1}">
                                <%
                                    Admin admin = (Admin)session.getAttribute("admin");
                                    if(admin==null) {%>
                                        <a href="/butterfly/admin/preLogin" class = "login">登录后可认领</a>
                                    <%}else{%>
                                        <button type="button" class="btn btn-primary" id = '${info.hostname }' data-toggle="modal" data-target="#exampleModalCenter">
                                                Claim
                                                </button>
                                   <% }

                                %>

                            </c:if>
                        </td>
                        </tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">认领申请</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <select class="custom-select" id = "select_group">
                                <option value="1">胡</option>
                                <option value="2">黄</option>
                                <option value="3">刘</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" id= 'claim'>Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="PATH" value="/butterfly/info/groupBy"/>
            <div class = "footer">
                <div class = "row">
                    <div class = "col-md-3">
                        <div class="alert alert-primary justify-content-center" role="alert">
                            <p>共有${infoGroup.total }台服务器</p>
                            <p>
                                    <% Admin admin = (Admin)session.getAttribute("admin");
                                    if(admin==null){%>
                                        异乡人,欢迎 <a href="/butterfly/admin/preLogin" class = "login">登录</a>
                                    <%}else{%>
                                    ${sessionScope.admin.username },<a href="/butterfly/admin/logout">想走就走</a>
                                    <%}%>
                            </p>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test = "${infoGroup.hasPreviousPage }">
                                    <li class="page-item"><a class="page-link" href="${PATH }" id="${1 }">Previous</a></li>
                                </c:if>

                                <c:forEach items = "${infoGroup.navigatepageNums }" var = "navPage">
                                    <c:if test = "${infoGroup.pageNum == navPage }">
                                        <li class="page-item active"><a class="page-link" href="${PATH }" id="${navPage }">${navPage }</a></li>
                                    </c:if>
                                    <c:if test = "${infoGroup.pageNum != navPage }">
                                        <li class="page-item"><a class="page-link" href="${PATH }" id="${navPage }">${navPage }</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${infoGroup.hasNextPage }">
                                    <li class="page-item"><a class="page-link" href="${PATH }?" id="${2 }">Next</a></li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('.page-link').on('click',function (e) {
                e.preventDefault()
                var gid = ${gid }
                var url = this.href
                var pn = this.id
                $.ajax({
                    type:"GET",
                    url:url,
                    timeout:2000,
                    data:{gid:gid,pn:pn},
                    success:function (data) {
                        var obj = $('<code></code>').append($(data))
                        var table = $('#context',obj)
                        $('#context').html(table.html())
                    }
                })
            })
            function openWin(url,name,iWidth,iHeight) {
                //获得窗口的垂直位置
                var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
                //获得窗口的水平位置
                var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
                window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
            }
            $(".login").on('click',function (e) {
                e.preventDefault()
                var url = this.href
                openWin(url,'登录',400,400)

            })

            $('#claim').on('click',function(e){
                e.preventDefault()

                    var gid = $('#select_group').find("option:selected").attr('value')
                    var hostname = $('td > button').attr('id')
                    var url = "/butterfly/admin/claimGroup"
                    var $hostname = $('#' + hostname)
                    $.ajax({
                        type: "GET",
                        url: url,
                        timeout: 2000,
                        data: {gid: gid, hostname: hostname},
                        success: function (data) {
                            var obj = $('<code></code>').append($(data))

                            var table = $('#context', obj)

                            alert(table)

                            if (gid == 1)
                                $hostname.after('胡').remove()
                            if (gid == 2)
                                $hostname.after('黄').remove()
                            if (gid == 3)
                                $hostname.after('刘').remove()
                        }
                    })


            })
            $('#logout').on('click',function () {
                
            })
        </script>

    </div>
<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 -->
    <script
			src="https://code.jquery.com/jquery-3.3.1.js"
			integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	</body>
</html>