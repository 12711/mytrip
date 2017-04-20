<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/2/4
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<style>
.li_style{
     list-style-type:none
}


</style>
<script>
   function changImg(){
         alert("确认要上传这张图片!");
    }
</script>
   <div class="row " style="border:1px solid gray">
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
       <div class="col-sm-8" style="margin-left: -30px" >
       <div class="tabbable" id="tabs-637123">
           <ul class="nav nav-tabs" style="margin-top: 5px">
               <li class="active">
                   <a href="#panel-772339" data-toggle="tab">基本信息</a>
               </li>
               <li >
                   <a href="#panel-568572" data-toggle="tab">联系方式</a>
               </li>
               <li >
                   <a href="#panel-568573" data-toggle="tab">教育情况</a>
               </li>
           </ul>
           <div class="tab-content">

               <div class="tab-pane active" id="panel-772339"  style="height: 300px">
                   <div class="col-sm-7">
                   <table class="table table-condensed" style="border-collapse: inherit;border-spacing: 20px">
                       <tr>
                           <td>用户名</td>
                           <td>${userInfo.userName}</td>
                       </tr>
                       <tr>
                           <td>真实姓名</td>
                           <td>${userInfo.realName}</td>
                       </tr>
                       <tr>
                           <td>性别</td>
                           <td>${userInfo.sex}</td>
                       </tr>
                       <tr>
                           <td>生日</td>
                           <td>${userInfo.birthday}</td>
                       </tr>
                       <tr>
                           <td>居住地</td>
                           <td>${userInfo.address}</td>
                       </tr>
                       <tr>
                           <td>工作地址</td>
                           <td>${userInfo.workAddress}</td>
                       </tr>

                   </table>
                   </div>
                   <div class="col-sm-5" style="margin-top: 10px">
                       <div style="width: 126px;height: 126px;border-radius: 20px;border: 1px solid gray" >
                         <img style="height: 120px;width: 120px;margin-top: 2px;margin-left: 2px;border-radius: 20px" src="${pageContext.request.contextPath}/img/${userInfo.mypig}" /><br/>
                       </div>
                     <form style="margin-left: 20px" action="${pageContext.request.contextPath}/user/inter/changeImg" method="post" enctype="multipart/form-data">
                          <input type="file"  name="pig"/>
                          <input type="submit"  value="上传图片">
                       </form>
                   </div>
               </div>
               <div class="tab-pane" id="panel-568572" style="height: 300px" >
                   <table class="table table-condensed" style="border-collapse: inherit;border-spacing: 20px">
                       <tr>
                           <td>电话</td>
                           <td>${userInfo.phone}</td>
                       </tr>
                       <tr>
                           <td>qq</td>
                           <td>${userInfo.qq}</td>
                       </tr>
                       <tr>
                           <td>邮箱</td>
                           <td>${userInfo.mail}</td>
                       </tr>
                       <tr>
                           <td>固定电话</td>
                           <td>${userInfo.filexPhone}</td>
                       </tr>
                   </table>
               </div>
           </div>


       </div>
   </div>
   </div>
   <jsp:include page="footer.jsp" flush="true"></jsp:include>

<script >

</script>

</body>
</html>
