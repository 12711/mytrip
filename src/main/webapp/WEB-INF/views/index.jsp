<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/2/10
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #header {
            background-color: #353535;
            height: 40px;
        }

        #header a {
            padding: 0 5px;
            color: white;
            margin-top: -50px;
            height: 10px;
        }

        #header2 {
            background-color: #3A9D9A;
            margin-top: -2px;
        }

        #test>ul>li>a:hover,
        #test>ul>li>a:active,
        #test>ul>li>a:visited {
            background-color: #3A9D9A;
        }

        label span:hover {
            margin-top: 10px;
        }

        .nav>li>a:hover,
        .nav>li>a:focus {
            background-color: #3A9D9A;
        }

        .blur {
            border: 1px solid red;
        }
    </style>
</head>

<body>
<div class="container-fluid">

    <div class="row " id="header">
    <div class="col-md-1 hidden-sm " style="margin-top: 10px; ">  </div>
    <div class="col-md-8 hidden-sm " style="margin-top: 10px; ">
        <a href="# ">收藏本站</a>
        <a>|</a>
        <a href="# ">设为首页</a>
    </div>
    <div class="col-sm-3 "  style="margin-top: 10px; ">
        <c:if test="${userInfo==null}">
            <a id="modal-964764" href="#modal-container-964764" data-toggle="modal" >登录</a>
            <a href="${pageContext.request.contextPath}/user/toregist" style="margin-top: 10px; ">注册</a>
            <a href="# " style="margin-top: 10px; ">忘记密码</a>
        </c:if>
        <c:if test="${userInfo!=null}">
            <img style="width: 30px;height: 30px;margin-top: -5px" src="${pageContext.request.contextPath}/img/${userInfo.mypig}">
            <a  href="${pageContext.request.contextPath}/user/inter/showUserInfo" >${userInfo.userName}</a>
            <a href="${pageContext.request.contextPath}/user/inter/showUserInfo " style="margin-top: 10px; ">个人信息</a>
            <a href="${pageContext.request.contextPath}/user/logout">注销</a>
        </c:if>
        <div class="modal fade" id="modal-container-964764" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width:500px ">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span>欢迎登录</span>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal"  id="loginForm" role="form"  style="width: 700px; ">
                            <div class="form-group" style="width: 450px; ">
                                <label class="col-sm-2"></label><label id="message" class="col-sm-10"></label>
                                <label for="userName"  class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10 ">
                                    <input type="text" class="form-control" required="required" name="userName" id="userName" />
                                </div>
                            </div>
                            <div class="form-group" style="width: 450px;">
                                <label for="passWord" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                                <div class="col-sm-10 ">
                                    <input type="password" class="form-control" name="passWord" required="required" id="passWord" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 12%; ">
                                    <div class="checkbox">
                                        <label><input type="checkbox"/>记住我</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 12%; ">
                                    <input  id="tologin" class="btn btn-danger" style="width:300px;height: 45px;" value="登录">
                                </div>
                            </div>
                        </form>

                    </div>

                </div>

            </div>

        </div>


    </div>
</div>

<div class="row " id="header2" style="height: 176px">
    <div class="col-lg-1 "> </div>
    <div class="col-lg-3 col-md-3 hidden-sm " id="logoEvent">
        <img alt="logo "  src="${pageContext.request.contextPath}/img/logo.png " />
    </div>
    <div class="col-lg-8 " id="test ">
        <ul class="nav navbar-nav navbar-right " style="margin-right: 60px; ">
            <li>
                <a href="${pageContext.request.contextPath}/album/inter/getAlbums" style="color:#AFD9EE "><h1 > <label ><span  class="glyphicon glyphicon-envelope "></span></label></h1><h4><span >相册</span></h4></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/scane/inter/getScanes" style="color:#AFD9EE "><h1 > <label><span  class="glyphicon glyphicon-new-window"></span></label></h1><h4><span >景点</span></h4></a>
            </li>
            <li>
                <a href="# " style="color:#AFD9EE "><h1 > <label><span  class="glyphicon glyphicon-comment "></span></label></h1><h4><span >消息</span></h4></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/log/inter/logList" style="color:#AFD9EE "><h1 > <label><span  class="glyphicon glyphicon-list-alt "></span></label></h1><h4><span >日志</span></h4></a>
            </li>
        </ul>

    </div>
</div>

</div>
<script>
   $(function(){
        window.user={
            userName:null,
            passWord:null
        };
        $("#logoEvent").click(function(){
             location.href="${pageContext.request.contextPath}/user/index"
        });


       $("#userName").keydown(function (event) {
           if (event.which == "13") {//回车键,移动光标到密码框
               $("#passWord").focus();
           }
       });
       $("#passWord").keydown(function (event) {
           if (event.which == "13") {//回车键，用.ajax提交表单
               $("#tologin").trigger("click");
           }
       });
       //登录表单的提交
      $("#tologin").click(function(){

          var userName=$("#userName").val();
          var passWord=$("#passWord").val();
          user.passWord=passWord;
          user.userName=userName;
            if(userName==''&&passWord==''){
                alert("用户名密码不能为空!");
            }else if(userName==''){
                alert("请输入用户名!");
                $("#userName").addClass("blur");
            }else if(passWord==''){
                alert("密码不能为空!");
                $("#passWord").addClass("blur");
            }else{
                var url="${pageContext.request.contextPath}/user/login"
                $.ajax({
                    url:url,
                    data:user,
                    type:'get',
                    ContextType:'json',
                    dataType:'json',
                    success:function(data){
                       if(data==='0'){
                          $("#message").text("账号不正确或者密码错误,请重新登录!");
                          $("#message").css("color","red");
                       }else if(data==='1'){
                           console.log();
                           var path="${thePath}";
                           if(${thePath==null}){
                           location.href="${pageContext.request.contextPath}/user/index";
                           }else{
                               var name=new Array();
                               name.push("add");
                               name.push("update");
                               name.push("delete");
                               console.log("name="+name)
                               for(var i in name){
                                   if(path.indexOf(name[i])!==-1){
                                       location.href="${pageContext.request.contextPath}/user/index";
                                       return;
                                   }
                               }
                               location.href="${pageContext.request.contextPath}"+path;
                           }
                       }
                    }

                });
            }
      });
   });

</script>

