<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/3/31
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>我的照片</title>
    <script src="${pageContext.request.contextPath}/js/viewer.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/viewer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
    <style>
        img {
            max-width: 300px;
            myimg: expression(onload=function(){
             this.style.width=(this.offsetWidth > 300)?'300px':'auto';
             this.style.height=(this.offsetHeight > 300)?'300px':'auto'
             });
        }
        .checkboximg{
            position: absolute;
            z-index: 200;
            top: 18px;
            width: 20px;
            height: 21px;
        }

    </style>
    <div class="container">
        <div class="row">
            <div class="col-sm-12"
                 style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
                <div class="col-sm-2" style="margin-left: 50px;">
                    <c:if test="${name==null}" var="t">
                    <span style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>我的相册</h3></span>
                    </c:if>
                    <c:if test="${!t}">
                        <span style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>他的相册</h3></span>
                    </c:if>
                </div>
                <c:if test="${name==null}">
                  <div class="col-sm-1" style="margin-top: 20px"><a href="javaScript:void(0);"  onclick="batchDelete()">批量删除</a></div>
                </c:if>
                <div class="col-sm-4 "></div>
            <c:if test="${name==null}">
                <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                        href="${pageContext.request.contextPath}/album/inter/getAlbums">返回相册列表</a></div>
                <div class="col-md-2 hidden-sm" style="margin-top: 20px"><a href="javaScript:void(0);" onclick="support('${alid}')">点赞</a>&nbsp;(<span id="hotnum">${album.hotnum}</span>)</div>
            </div>
            </c:if>
        </div>
        <div class="row" style="padding-left:20px">
            <div class="docs-galley">
                <ul class="docs-pictures clearfix">
                    <c:forEach items="${imges}" var="img">

                        <li > <div class="col-sm-2 " id="showimg" style="height: 180px;width: 280px;overflow: hidden">
                                <img  style="margin-top: 20px" data-original="${pageContext.request.contextPath}/album/${img.name}"
                                src="${pageContext.request.contextPath}/album/${img.name}">
                              <input type="checkbox" class="checkboximg" style="display: none">
                              <input type="hidden" value="${img.id}" id="${img.id}">
                            </div>
                        </li>

                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="row" style="margin-top: 20px;padding: 5px;display: none" id="batchBtn">
            <input type="button" style="margin-left: 30px;" class="btn btn-danger" onclick="deleteBtn()" value="删除"><input type="button" style="margin-left: 10px" class="btn btn-info" value="取消">
        </div>
    </div>
</head>
<body>
<script>
    //点赞
    function support(obj) {
        $.ajax({
            url:'${pageContext.request.contextPath}/album/updateAlbum/'+obj,
            dataType:'json',
            type:'post',
            success:function (data) {
                if(data==="1"){
                    $("#hotnum").text($("#hotnum").text()*1+1);
                }else {
                    alert("服务器异常,请稍后再试...");
                }
            }
        });
    }
    window.flag=false;
    function batchDelete() {
        if(!window.flag){
            $(".checkboximg").css("display","block");
            $("#batchBtn").css("display","block");
            window.flag=true;
        }else{
            $(".checkboximg").css("display","none");
            $("#batchBtn").css("display","none");
            window.flag=false;
        }

    }
    
    function  affirm() {
        if(confirm("你确定要删除选中的图片?")){
            return true;
        }
        return false;
    }
    function deleteBtn() {
        if(!affirm()) return ;
        var ids="";
        var imgs=$(".checkboximg:checked");
        for(var i=0 ; i<imgs.length;i++){
           var id=$(imgs[i]).next().val();
           ids+=id+",";
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/img/delete",
            data:{'ids':ids},
            type:'post',
            dataType:'json',
            ContentType:'text/json',
            success:function (data) {
                console.log("删除成功---->"+data);
                for(var i=0 ; i<imgs.length;i++){
                    var id1=$(imgs[i]).next().val();
                    console.log("====---")
                    $("#"+id1).parent().parent().remove();
                }
            }
        });
    }
</script>

</body>
</html>
