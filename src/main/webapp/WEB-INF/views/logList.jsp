<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/3/29
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>展示日志列表</title>
    <style type="text/css">
        #userName {
            text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
            color: #cc8f14;
        }

        #headtitle .row {
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">

    <%--日志主题部分--%>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10"
             style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
            <div class="col-sm-2" style="margin-left: 50px;"><span
                    style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>日志</h3></span>
            </div>
            <div class="col-sm-2 " style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><a href="${pageContext.request.contextPath}/log/inter/writelog">写日志</a></div>
            <div class="col-sm-5 "></div>
            <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                    href="#">返回日志列表</a></div>
        </div>
        <div class="col-sm-1"></div>
    </div>
    <%--日志列表--%>
    <c:forEach items="${userLogs}" var="log" >
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <div class="row"
                 style="border-bottom:1px dashed #dedede;"></div>
            <div class="hidden-sm col-md-1"></div>
            <div class="hidden-sm col-md-1"><img
                    style="height: 54px;width: 54px;border-radius: 2px;border: #3a9d9a 3px solid;"
                    src="${pageContext.request.contextPath}/img/${userInfo.mypig}"></div>
            <div class="col-sm-9">
                <label class="col-sm-12"><a href="${pageContext.request.contextPath}/log/getOneLog/${log.id}">${log.title}</a></label>
                <span class="col-sm-12" style="overflow:hidden;height:50px;text-overflow :ellipsis">${log.content}</span>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
