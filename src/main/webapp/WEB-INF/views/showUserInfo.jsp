<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/2/4
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>个人信息</title>
    <script src="${pageContext.request.contextPath}/ck/ckeditor/ckeditor.js"></script>
</head>
<body>
<style>
    .li_style {
        list-style-type: none
    }


</style>
<script>
    function changImg() {
        alert("确认要上传这张图片!");
    }
</script>
<div class="row " style="border:1px solid gray;border-bottom: none;margin-bottom: 20px;">
    <div class="col-sm-1"></div>
    <div class="col-sm-3 ">
        <ul>
            <li class="li_style"><h3>设置</h3></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/user/inter/showUserInfo">个人信息</a></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style">密码安全</li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style">修改信息</li>
        </ul>
    </div>
    <div class="col-sm-8" style="margin-left: -30px">
        <div class="tabbable" id="tabs-637123">
            <ul class="nav nav-tabs" style="margin-top: 5px">
                <li class="active">
                    <a href="#panel-772339" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-568572" data-toggle="tab">联系方式</a>
                </li>
                <li>
                    <a href="#panel-568573" data-toggle="tab">教育情况</a>
                </li>
            </ul>
            <div class="tab-content">

                <div class="tab-pane active" id="panel-772339" style="height: 300px">
                    <div class="col-sm-7">
                        <form action="${pageContext.request.contextPath}/user/inter/updateUserInfo" method="post">
                        <div class="col-sm-12"><span>用户名</span><input class="form-control" type="text" name="userName"
                                                                      value="${userInfo.userName}"></div>
                        <div class="col-sm-12"><span>真实姓名</span><input class="form-control" type="text" name="realName"
                                                                       value="${userInfo.realName}"></div>
                        <div class="col-sm-12"><span>性别</span>

                          <select  class="form-control" name="sex">
                                <c:if test="${userInfo.sex=='男'}" var="t">
                                   <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${!t}">
                                   <option value="女" selected>女</option>
                                    <option value="男" >男</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="col-sm-12"><span>生日</span><input class="form-control" type="text" name="birthday" id="birthday"
                                                                     value="${userInfo.birthday}"></div>
                        <div class="col-sm-12"><span>居住地</span><input class="form-control" type="text" name="address"
                                                                      value="${userInfo.address}"></div>
                        <div class="col-sm-12"><span>工作地址</span><input class="form-control" type="text" name="workAddress"
                                           value="${userInfo.workAddress}"></div>
                            <div class="col-sm-4" ></div>
                         <div class="col-sm-4" style="margin-top: 20px">
                            <input type="submit" class="btn btn-danger" value="修改">
                         <input type="reset" class="btn btn-primary" value="取消">
                        </div>
                        </form>
                    </div>
                    <div class="col-sm-5" style="margin-top: 10px">
                        <div style="width: 126px;height: 126px;border-radius: 20px;border: 1px solid gray">
                            <img id="UserImg"
                                 style="height: 120px;width: 120px;margin-top: 2px;margin-left: 2px;border-radius: 20px"
                                 src="${pageContext.request.contextPath}/img/${userInfo.mypig}"/><br/>
                        </div>
                        <form style="margin-left: 20px" action="${pageContext.request.contextPath}/user/inter/changeImg"
                              method="post" enctype="multipart/form-data">
                            <input type="file" name="pig" id="sImgF"/>
                            <input type="submit" value="上传图片">
                        </form>
                    </div>
                </div>
                <div class="tab-pane" id="panel-568572" style="height: 300px">

                </div>
            </div>


        </div>
    </div>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>

<script>
    //当用户选择照片是显示预览图
    $("#sImgF").change(function () {
        console.log($("#sImgF")[0].files[0]);
        var fileObject = $("#sImgF")[0].files[0];
        //重要步骤
        $("#UserImg")[0].src = URL.createObjectURL(fileObject);
    });

    $("#birthday").datetimepicker({
        format: 'yyyy-mm-dd',

        autoclose: true,
        startView: 4,
        minView: 4,
        forceParse: false,
        language: 'zh-CN',
        todayBtn:true
    });


</script>

</body>
</html>
