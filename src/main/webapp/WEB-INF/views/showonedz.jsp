<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/4/12
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>地主详情</title>
    <style>
        #showimg{
            width: 136px;
            position: absolute;
            top: 50px;
            left: 45%;
            z-index: 100;
        }
        #showimgpalce{
            height: 100px;
            width: 100px;
            border-radius: 48px;
            margin-left: auto;
            margin-right: auto;
            overflow: hidden;
        }
        #showname{
            position: absolute;
            top: 160px;
            z-index: 100;
            left: 45%;
            width: 136px;
            text-align: center;
            color: white;
        }
        #showsign{
            width: 544px;
            position: absolute;
            top: 210px;
            z-index: 100;
            left: 30%;
            /* width: 136px; */
            text-align: center;
            color: white;
            word-break: break-all;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
        }
    </style>
</head>
<body style="background-color:#f2f2f2 ">
<div class="container">
    <div class="row">
        <div class="col-md-1 hidden-sm"></div>
        <div class="col-md-10 " style="padding-left: 0px">
            <div class="row" style="padding-left: 0px">
                <img src="${pageContext.request.contextPath}/img/042.jpg">
                <div id="showImg"><div id="showimgpalce">
                    <img style="width: 100px;height: 100px" src="${pageContext.request.contextPath}/img/${userShowInfo.mypig}">
                </div></div>
                <div id="showname"><h3><span>陌生人甲</span></h3></div>
                <div id="showsign"><span>告诉你,我并不是没有你就会痛苦的死掉,没有了你我才能活的更自由更洒脱告诉你,我并不是没有你就会痛苦的死掉,没有了你我才能活的更自由更洒脱告诉你,我并不是没有你就会痛苦的死掉,没有了你我才能活的更自由更洒脱告诉你,我并不是没有你就会痛苦的死掉,没有了你我才能活的更自由更洒脱</span></div>
            </div>
            <div class="row" style="padding-left: 0px;padding-right: 10px;">
                <div style="background-color: white;height: 45px">
                    <a href="#" class="active" style="-webkit-tap-highlight-color: rgba(0,0,0,0);text-decoration: none;cursor: auto;margin-top: 15px;position: relative;top: 15px;left: 25%;">他的主页</a>
                    <a href="#" style="text-decoration: none;cursor: auto; margin-top: 15px;position: relative;top: 15px;left: 65%;">热门相册</a>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-3" style="background-color:white;height: 400px;padding-left: 0px">
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px solid gainsboro">
                           <div style="height: 60px">
                               <div class="col-sm-4">
                               <div style="margin-top: 4px;;height: 50px;width: 50px;border-radius: 25px;overflow: hidden" >
                                   <img style="height: 50px;width: 50px" src="${pageContext.request.contextPath}/img/${userShowInfo.mypig}">
                               </div>
                               </div>
                              <div class="col-sm-6"><span style="font-size: 15px;position: relative;top: 20px;">${userShowInfo.userName}</span></div>
                           </div>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 65px">
                                <span class="glyphicon glyphicon-map-marker" style="position: relative;top: 14px;"></span>
                                <span style="font-size: 10px;position: relative;top: 12px;">信誉等级</span>
                                <img src="${pageContext.request.contextPath}/img/rank/${userShowInfo.rank}" style="position: relative;top: 12px;">
                            </div>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px dashed gainsboro">
                           <div style="height: 45px">
                               <span class="glyphicon glyphicon-map-marker" style="position: relative;top: 14px;"></span>
                               <span style="font-size: 10px;position: relative;top: 12px;">(家庭地址)</span><span style="position: relative;top: 12px;">${userShowInfo.city}&nbsp;&nbsp;邵阳</span>
                           </div>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 45px">
                                <span class="glyphicon glyphicon-gift" style="position: relative;top: 14px;"></span>
                                <span style="position: relative;top: 12px;">${userShowInfo.birthday}</span>
                            </div>
                        </div>
                    </div>
                    <%--工作地址--%>
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 45px">
                                <span class="glyphicon glyphicon-screenshot" style="position: relative;top: 14px;"></span>
                                <span style="font-size: 10px;position: relative;top: 12px;">(工作地址)</span><span style="position: relative;top: 12px;">${userShowInfo.address}</span>
                            </div>
                        </div>
                    </div>
                    <%--练习方式--%>
                    <div class="row" >
                        <div class="col-md-1"></div>
                        <div class="col-md-10" style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 130px">
                                <span class="glyphicon glyphicon-list" style="position: relative;top: 14px;"></span><span style="position: relative;top: 12px;left: 2px;">联系方式:</span><br/>

                                <span style="font-size: 10px;position: relative;top: 12px;">(电话)</span><span style="position: relative;top: 12px;">${userShowInfo.filexPhone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(手机)</span><span style="position: relative;top: 12px;">${userShowInfo.phone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(qq)</span><span style="position: relative;top: 12px;">${userShowInfo.qq}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(邮箱)</span><span style="position: relative;top: 12px;">${userShowInfo.mail}</span>
                            </div>
                        </div>
                    </div>

                </div>
                <%--发布的景点--%>
                <div class="col-md-9" style="height: 400px;">
                   <div class="col-md-1"  style="height: 400px;">
                   </div>
                    <div class="col-md-11" style="height: 400px;padding-left: 0px">
                        <div class="row" style="margin-right: -20px;height: 200px;background-color: white">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1 hidden-sm"></div>
    </div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>
