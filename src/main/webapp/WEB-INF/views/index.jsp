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
        .green {
            border: 1px solid green;
        }
        #pass-button-new1 {
            width: 100px;
            height: 32px;
            border: 1px solid #ccc;
            background: #f7f7f7;
            color: #666;
            line-height: 32px;
            margin-left: -20px;
            text-align: center;
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
            <a href="#forget" style="margin-top: 10px; " data-toggle="modal">忘记密码</a>
        </c:if>
        <c:if test="${userInfo!=null}">
            <img style="width: 30px;height: 30px;margin-top: -5px" src="${pageContext.request.contextPath}/img/${userInfo.mypig}">
            <a  href="${pageContext.request.contextPath}/user/inter/showUserInfo" >${userInfo.userName}</a>
            <a href="${pageContext.request.contextPath}/user/inter/showUserInfo " style="margin-top: 10px; ">个人信息</a>
            <a href="${pageContext.request.contextPath}/user/logout">注销</a>
        </c:if>
            <div class="modal fade" id="forget" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width:500px ">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabelforget">
                                <span>找回密码</span>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal"  id="forgetform" role="form"  style="width: 700px; ">
                                <div class="form-group" style="width: 450px; ">
                                    <div class="col-sm-1"></div>
                                   <div class="col-sm-10 ">
                                        <input type="text" class="form-control" placeholder="请输入你的用户名" name="userName" id="userforgetName" />
                                    </div>
                                </div>
                                <div class="form-group" style="width: 450px; ">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-10 ">
                                        <input type="text" class="form-control" placeholder="请输入你的密码" name="passWord" id="userforgetpwd" />
                                    </div>
                                </div>
                                <div class="form-group" style="width: 450px; ">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-4 ">
                                        <input type="text" class="form-control"  name="code" id="userforgetcode" />
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pass-button-timer" id="pass-button-new1">发送验证码</div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div style="margin-top: 5px;margin-left: -40px;">
                                           <span style="color: green;" id="afterSendInfo"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="width: 450px; ">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-10">
                                        <input type="button" style="height: 40px" class="form-control btn btn-danger"  value="提交" id="userforgetsumbit" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
                            <div class="form-group" style="width: 450px;display: none" id="codeGroup">
                                        <label  for="code" class="col-sm-2 control-label">验证码</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="code" id="code">
                                        </div>
                                        <div  class="col-sm-3" style="margin-left: -17px"><img src="${pageContext.request.contextPath}/code/getCodeImg" onclick="refresh(this)" id="codeIng"></div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 12%; ">
                                    <input  id="tologin" class="btn btn-danger" style="width:300px;height: 45px;" value="登录">
                                </div>
                            </div>
                            <input type="hidden" name="count"  id="count">
                        </form>

                    </div>

                </div>

            </div>

        </div>


    </div>
</div>

<div class="row " id="header2" style="height: 176px;">
    <div class="col-lg-1 " > </div>
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
       //发送验证码
       $("#pass-button-new1").click(function () {
           var userName=$("#userforgetName").val();
           if(userName===''){
               alert("请输入你的用户名!");
               return;
           }
           $.ajax({
               url:"${pageContext.request.contextPath}/user/sendCode",
               data:{"userName":userName},
               type:"get",
               dataType:"json",
               success:function (data) {
                   if(data==="1"){
                       $("#afterSendInfo").html("验证码已发送");
                   }
               }
           });
       });

       //输入验证码修改密码
       $("#userforgetsumbit").click(function () {
           var userName=$("#userforgetName").val();
           var pwd=$("#userforgetpwd").val();
           var code=$("#userforgetcode").val();
           if(userName===""||pwd===""||code===""){
               alert("请填写所有信息!");
               return;
           }
           var formData=$("#forgetform").serialize();
           $.ajax({
               url:"${pageContext.request.contextPath}/user/findPwd",
               data:formData,
               dataType:"json",
               type:"get",
               success:function (data) {
                   if(data==="1"){
                       alert("修改成功!");
                       location.href="${pageContext.request.contextPath}/user/index";
                   }else if(data=="0"){
                       alert("修改失败,请检查您的账号!");
                   }else{
                       alert("验证码错误!");
                       $("#userforgetcode").css("border-color","red");
                   }
               }
           });
       });


       $("#code").change(function () {
           $.ajax({
               url:"${pageContext.request.contextPath}/code/checkCode",
               data:{"code":$("#code").val()},
               dataType:'json',
               type:'get',
               success:function(data){
                   if(data==="0"){
                       $("#code").removeClass("green");
                       $("#code").addClass("blur");
                   }else{
                       $("#code").removeClass("blur");
                       $("#code").addClass("green");
                   }
               }
           });

       });


        window.user={
            userName:null,
            passWord:null,
            count:0,
            code:null
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
       window.count=0;
       //登录表单的提交
      $("#tologin").click(function(){

          var userName=$("#userName").val();
          var passWord=$("#passWord").val();
          var code=$("#code").val();
          user.passWord=passWord;
          user.userName=userName;
          user.count=window.count;
          user.code=code;
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
                       $("#count").val(count);
                       console.log("$('#count').val(count)=="+$("#count").val())
                       if(data==='0'){
                          $("#message").text("账号不正确或者密码错误,请重新登录!");
                          $("#message").css("color","red");
                          count+=1;
                          console.log("count=="+count)
                          if(count>=3){
                              $("#codeGroup").css("display","block");
                          }
                          $("#codeIng")[0].src="${pageContext.request.contextPath}/code/getCodeImg?t="+new Date().getTime();

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


   function refresh(obj) {
       console.log(obj);
       obj.src="${pageContext.request.contextPath}/code/getCodeImg?t="+new Date().getTime();
   }
</script>

