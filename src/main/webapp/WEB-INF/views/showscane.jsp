<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/4/5
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>景点详情</title>
    <style>
        .spot_info {
            border-top-width: 2px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            border-top-color: #589614;
            border-right-color: #D9D9D9;
            border-bottom-color: #D9D9D9;
            border-left-color: #D9D9D9;
            background-color: #FFFFFF;
            overflow: hidden;
            padding-top: 10px;
            padding-right: 12px;
            padding-bottom: 10px;
            padding-left: 12px;
            width: 300px;
            height: 500px;
            margin-left: -100px;
        }
        .spot_info h3 {
            font-family: "微软雅黑";
            font-size: 18px;
            line-height: 24px;
            font-weight: normal;
            border-bottom-width: 1px;
            border-bottom-style: dotted;
            border-bottom-color: #D9D9D9;
            margin-bottom: 5px;
            padding-bottom: 10px;
            color: #589614;
        }
        .sname {
            top: 196px;
            background-color: rgba(0, 0, 0, 0.6);
            transition: top 250ms;
            position: absolute;
            width: 639px;
            left: 0px;
            margin-left: 10px;
            line-height: 60px;
            color: #FFFFFF;
            font-size: 36px;
            font-family: "微软雅黑";
            text-align: center;
            height: 95px;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="background-color: #F2F2F2;padding-left: 0px;padding-right: 0px">
    <div class="row-fluid" style="height:100px;background-color: white">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <div class="col-sm-12">
                <h1>${userScane.sName}</h1>
            </div>
            <div class="col-sm-12">地址:${userScane.address}</div>
        </div>
    </div>
    <div class="row-fluid"
         style="margin-left: 0px;margin-right:0px;;margin-top: 20px">
        <div class="col-md-8" style="margin-left: 80px">
            <div class="row">
                <div class="hidden-sm col-md-1"></div>
                <div class=" col-sm-6" style="padding-left: 0px">
                    <div style="height: 300px;width: 659px;overflow: hidden;border: 10px gainsboro solid">
                        <img src="${pageContext.request.contextPath}/img/${userScane.sImg}">
                        <span class="sname">${userScane.sName}<br/>
                    </span>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-md-10">
                    <div class="hidden-sm col-md-1"></div>
                    <div class="col-md-11 column"
                         style="background-color: #FFF">
                        <div class="tabbable" id="tabs-983519">
                            <ul class="nav nav-tabs"
                                style="border-left: hidden">
                                <li class="active">
                                    <a href="#introduce"
                                       style="padding-left: 0px;border-left: 0px"
                                       data-toggle="tab">景点介绍</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="introduce">
                                    ${userScane.introduce}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-2">
            <div class="spot_info">
                <h3>门票及开放时间</h3>
                <h4>门票</h4>
                ${userScane.ticket}
                <h4>开放时间</h4>
                ${userScane.opentime}
                <h3>优惠政策</h3>
                ${userScane.favourable}
            </div>
        </div>
    </div>

</div>
</body>
<%@include file="footer.jsp" %>
</html>
