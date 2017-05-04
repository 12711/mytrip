<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/4/6
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>我周围的景点</title>
    <style>
        .tit {
            top: 170px;
            background-color: rgba(0, 0, 0, 0.6);
            position: absolute;
            width: 316px;
            left: 0px;
            line-height: 30px;
            color: #FFFFFF;
            font-size: 14px;
            font-family: "微软雅黑";
            text-align: center;
            margin-left: 15px;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="row">
        <div class="col-sm-12"
             style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
            <div class="col-sm-2" style="margin-left: 50px;"><span
                    style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>我发布的景点</h3></span>
            </div>
            <div class="col-sm-2" style="margin-top: 20px;"><a href="${pageContext.request.contextPath}/scane/inter/toWriteScane">发布新景点</a></div>
            <div class="col-sm-5" style="margin-top: 20px;"><a href="javascript:void(0)" id="batchDeleteScane">批量删除景点</a></div>
            <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                    href="${pageContext.request.contextPath}/user/index">返回首页</a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" >
           <c:forEach items="${scanes}" var="scane">
            <div class="col-sm-4" style="margin-top: 20px" id="${scane.sid}">
                <div>
                    <a href="${pageContext.request.contextPath}/scane/getScane/${scane.sid}">
                        <img src="${pageContext.request.contextPath}/img/${scane.sImg}"
                             style="width: 316px;height: 200px;">
                        <span class="tit">${scane.sName}</span>
                    </a>
                    <input style="display: none;position: absolute;top: 5px;left: 80%;z-index: 100" type="checkbox" value="${scane.sid}" class="scaneCheck">
                    <a href="${pageContext.request.contextPath}/scane/toupdateScane/${scane.sid}" style="position: absolute;left: 20px;top: 7px;" title="修改景点"><span style="color: black;" class="glyphicon glyphicon-list"></span></a>
                </div>
            </div>
           </c:forEach>

        </div>

    </div>
    <div col-sm-1></div>
    <div class="row" style="margin-top: 20px">
        <div class="col-md-1"></div>
        <div class="col-md-6" id="scaneAction" style="display: none">
            <input type="button" class="btn btn-danger"  id="updateScaneBtn" value="修改">
            <input type="button" class="btn btn-warning" id="caleneScaneBtn" value="取消">
        </div>
    </div>

</div>
</div>
<script>
    $(function () {

        $("#caleneScaneBtn").click(function () {
            var logs=$(".scaneCheck:checked");
            for(var i=0 ; i<logs.length;i++){
                $(logs[i]).attr("checked",false)
            }
        });
        window.flag=false;
         $("#batchDeleteScane").click(function () {
             if(!window.flag){
                 $(".scaneCheck").css("display","block");
                 $("#scaneAction").css("display","block");
                 window.flag=true;
             }else{
                 $(".scaneCheck").css("display","none");
                 $("#scaneAction").css("display","none");
                 window.flag=false;
             }

         });
         
         $("#updateScaneBtn").click(function () {
             var scanes=$(".scaneCheck:checked");
             var ids="";
             for(var i=0 ; i<scanes.length;i++){
                 var id=$(scanes[i]).val();
                 ids+=id+",";
             }
             console.log("ids==="+ids)
             $.ajax({
                 url:"${pageContext.request.contextPath}/scane/batchDeleteScane",
                 data:{ids:ids},
                 dataType:"json",
                 type:"post",
                 success:function(data){
                     console.log(data);
                     if(data[1]==="0"){
                         alert("删除出现问题,部分景点已被删除!")
                     }else{
                         var idss=data[0].split(",");
                         console.log(idss);
                         for(var id in idss){
                             var aid=idss[id];
                             console.log("aid=="+aid);
                             console.log($("#"+aid));
                             $("#"+aid).remove();
                         }


                     }
                 }
             });
         });


    });
</script>

</body>
<%@ include file="footer.jsp" %>
</html>
