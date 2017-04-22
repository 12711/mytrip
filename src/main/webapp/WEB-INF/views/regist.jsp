
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<html>
<head>
    <title>欢迎注册</title>
    <style type="text/css">
               .form-control{
                   width: 300px;
               }
    </style>
</head>
<body>
   <div class="container">
       <div class="row">
            <div class="col-sm-12" style="background-color: #F8F8F8">
                <h3 style="font-size: 20px !important;" class="col-sm-2">注册互助旅游</h3>
                <div class="col-sm-8"></div>
                <a href="#modal-container-964764" style="margin-top: 26px" data-toggle="modal" class="col-sm-2">已有账号?马上登陆</a>
            </div>
           <div class="col-sm-12" style="border: 1px solid gainsboro;padding: 10px;">

               <form class="form-horizontal" onsubmit="return fromForm()" role="form" style="margin-top: 20px" action="${pageContext.request.contextPath}/user/regist" method="post">
                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="inputEmail3" class="col-sm-2 control-label">用户名:</label>
                       <div class="col-sm-3">
                           <input type="text" class="form-control" name="userName" id="inputEmail3" />
                       </div>
                       <label class="col-sm-4" id="nameInfo" style="margin-left: 15px;margin-top: 8px"></label>
                   </div>
                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
                       <div class="col-sm-3">
                           <input type="password" class="form-control" name="passWord" id="inputPassword3" />
                       </div>
                       <label class="col-sm-4" id="passwordInfo" style="margin-left: 15px;margin-top: 8px"></label>
                   </div>

                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="rePassword3" class="col-sm-2 control-label">确认密码</label>
                       <div class="col-sm-3">
                           <input type="password" class="form-control"  id="rePassword3" />
                       </div>
                       <label class="col-sm-4" id="repasswordInfo" style="margin-left: 15px;margin-top: 8px"></label>
                   </div>
                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="realName" class="col-sm-2 control-label">姓名:</label>
                       <div class="col-sm-3">
                           <input type="text" class="form-control" required name="realName" id="realName13" />
                       </div>
                       <label class="col-sm-4" id="realName" style="margin-left: 15px;margin-top: 8px"></label>
                   </div>

                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="rePassword3" class="col-sm-2 control-label">性别</label>
                       <div class="col-sm-8">
                           <select name="sex"  class="form-control" >
                               <option value="男" >男</option>
                               <option value="女" selected>女</option>
                           </select>
                       </div>
                   </div>

                   <div class="form-group">
                       <label class="col-sm-2"></label>
                       <label for="phone" class="col-sm-2 control-label">手机</label>
                       <div class="col-sm-3">
                           <input type="text" class="form-control" name="phone" id="phone" />
                       </div>
                       <label class="col-sm-4" id="phoneInfo" style="margin-left: 15px;margin-top: 8px"></label>
                   </div>
                   <div class="col-sm-5"></div>
                   <div class="col-sm-7">
                       <c:if test="${errInfo!=null}"><label id="errInfo" style="color: red">${errInfo}</label></c:if>
                   </div>
                   <div class="form-group">
                       <label class="col-sm-4"></label>
                       <div class=" col-sm-5" style="margin-left: 10px">
                           <button type="submit" style="width: 100px" class="btn btn-danger">注册</button>
                           <button type="reset"  style="width: 100px" class="btn btn-warning" style="margin-left: 10px">重置</button>
                       </div>
                   </div>

               </form>

           </div>

       </div>
   </div>
   <script>
       /*检查注册用户是否已经存在*/
       window.nameflag=false;
       $(function () {
            $("#inputEmail3").change(function () {
                 var name=$("#inputEmail3").val();
                 if(name===""){
                     alert("请输入你的用户名.....");
                 }else{
                     $.ajax({
                         url:"${pageContext.request.contextPath}/user/checkUserName/"+name,
                         type:"get",
                         dataType:"json",
                         success:function(data){
                             if(data==="1"){
                                 $("#nameInfo").text("**用户名可用!");
                                 $("#nameInfo").css("color","green");
                                 nameflag=true;
                             }else {
                                 console.log("用户已存在")
                                 $("#nameInfo").text("**用户已存在!");
                                 $("#nameInfo").css("color","red");
                                 nameflag=false;
                             }
                         }
                     });
                 }

            });

            /*密码输入实时校验位数*/
           $("#inputPassword3").keyup(function(){
               var password=$("#inputPassword3").val();
               if(password.length<6){
                   $("#passwordInfo").text("密码不能小于6位,请重新输入!");
                   $("#passwordInfo").css("color","red");
               }else{
                   $("#passwordInfo").text("密码格式正确!");
                   $("#passwordInfo").css("color","green");
               }
           });
           /*防止密码为空*/
           $("#inputPassword3").blur(function(){
               if($("#inputPassword3").val()===""){
                   alert("密码不能为空,请输入密码!");
               }else if($("#inputPassword3").val().length<6){
                   $("#passwordInfo").text("密码不能小于6位,请重新输入!");
                   $("#passwordInfo").css("color","red");
               }else{
                   /*保存密码用来做密码确认*/
                   window.oldpassword=$("#inputPassword3").val();
               }

           });


           /*确认密码*/
          $("#rePassword3").blur(function(){
              var repassword=$("#rePassword3").val();
              if(repassword===window.oldpassword){

                  $("#repasswordInfo").text("密码一致!");
                  $("#repasswordInfo").css("color","green");
              }else{
                  $("#repasswordInfo").text("密码不一致!");
                  $("#repasswordInfo").css("color","red");
              }
          });
         /*手机要验证*/
         $("#phone").blur(function(){
                var reg=/^[1-9][0-9]{10}$/;
                var phone=$("#phone").val();

                console.log("---"+reg.test(phone));
                if(reg.test(phone)===false){
                     $("#phoneInfo").text("手机号码格式不对,请输入11位数字");
                     $("#phoneInfo").css("color","red");
                }else {
                    $("#phoneInfo").text("");
                }
           });
       });

       /*当输入信息不全防止表单提交*/
       function fromForm() {
           if($("#realName13").val()!==""&&nameflag&&$("#inputEmail3").val()!==""&&$("#inputPassword3").val()!==""&&$("#rePassword3").val()!==""&&$("#phone").val!==""){
               return true;
           }else{
               alert("注册内容未填写完整或者你的用户名已存在!");
               return false;
           }
       }

   </script>
<%@ include file="footer.jsp"%>
</body>
</html>
