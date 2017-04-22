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
            <div class="col-sm-2"><a href="${pageContext.request.contextPath}/scane/inter/toWriteScane">发布新景点</a></div>
            <div class="col-sm-5"></div>
            <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                    href="${pageContext.request.contextPath}/user/index">返回首页</a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
           <c:forEach items="${scanes}" var="scane">
            <div class="col-sm-4">
                <div>
                    <a href="${pageContext.request.contextPath}/scane/getScane/${scane.sid}">
                        <img src="${pageContext.request.contextPath}/img/${scane.sImg}"
                             style="width: 316px;height: 200px;">
                        <span class="tit">${scane.sName}</span>
                    </a>
                </div>
            </div>
           </c:forEach>
        </div>
    </div>
    <div col-sm-1></div>
</div>
</div>


</body>
<%@ include file="footer.jsp" %>
</html>
