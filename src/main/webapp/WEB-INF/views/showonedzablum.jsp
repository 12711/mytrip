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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.css"></link>
    <script src="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.js"></script>
    <style>
        #showimg {
            width: 136px;
            position: absolute;
            top: 50px;
            left: 45%;
            z-index: 100;
        }

        #showimgpalce {
            height: 100px;
            width: 100px;
            border-radius: 48px;
            margin-left: auto;
            margin-right: auto;
            overflow: hidden;
        }

        #showname {
            position: absolute;
            top: 160px;
            z-index: 100;
            left: 45%;
            width: 136px;
            text-align: center;
            color: white;
        }

        #showsign {
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
        #albumCss{
            z-index: 200;
            position: relative;
            top: 200px;
            background-color: rgba(0, 0, 0, 0.6);
            width: 200px;
            text-align: center;
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
                <div id="showImg">
                    <div id="showimgpalce">
                        <img style="width: 100px;height: 100px"
                             src="${pageContext.request.contextPath}/img/${userShowInfo.mypig}">
                    </div>
                </div>
                <div id="showname"><h3><span>${userShowInfo.userName}</span></h3></div>
                <div id="showsign"><span>${userShowInfo.sign}</span>
                </div>
            </div>
            <div class="row" style="padding-left: 0px;padding-right: 10px;">
                <div style="background-color: white;height: 45px">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-2">
                            <a href="${pageContext.request.contextPath}/trip/getUserById/${uid}?pageIndex=-1" class="active"
                               style="-webkit-tap-highlight-color: rgba(0,0,0,0);text-decoration: none;cursor: auto;margin-top: 15px;position: relative;top: 15px;" >他的主页</a>
                    </div>
                    <div  class="col-sm-2">
                        <div style="border-bottom: 3px solid #eb7350;height: 45px;width: 60px">
                        <a href="${pageContext.request.contextPath}/trip/getAlbumInIndex"
                           style="text-decoration: none;cursor: auto; margin-top: 15px;position: relative;top: 15px;">热门相册</a>
                        </div>

                    </div>
                    <div class="col-sm-2">
                        <a href="${pageContext.request.contextPath}/evaluate/getEvaluateByPage"
                           style="text-decoration: none;cursor: auto; margin-top: 15px;position: relative;top: 15px;">对他评论</a>
                    </div>
                    <div class="col-sm-2">
                        <div >
                            <a href="${pageContext.request.contextPath}/log/getLogInIndex/${userShowInfo.uid}?pageIndex=-1"
                               style="text-decoration: none;cursor: auto; margin-top: 15px;position: relative;top: 15px;">他的日志</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-3"
                     style="background-color:white;height: 400px;padding-left: 0px">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px solid gainsboro">
                            <div style="height: 60px">
                                <div class="col-sm-4">
                                    <div style="margin-top: 4px;;height: 50px;width: 50px;border-radius: 25px;overflow: hidden">
                                        <img style="height: 50px;width: 50px"
                                             src="${pageContext.request.contextPath}/img/${userShowInfo.mypig}">
                                    </div>
                                </div>
                                <div class="col-sm-6"><span
                                        style="font-size: 15px;position: relative;top: 20px;">${userShowInfo.userName}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 65px">
                                <span class="glyphicon glyphicon-map-marker"
                                      style="position: relative;top: 14px;"></span>
                                <span style="font-size: 10px;position: relative;top: 12px;">信誉等级</span>
                                <span style="font-size: 10px;position: relative;top: 12px;left: 20px;"><a href="javaScript:void(0);" onclick="supportuser('${userShowInfo.uid}')"><span class="glyphicon glyphicon-thumbs-up"></span>(<span id="userhotnum">${userShowInfo.hotnum}</span>)</a></span>
                                <img src="${pageContext.request.contextPath}/img/rank/${userShowInfo.rank}"
                                     style="position: relative;top: 12px;">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 45px">
                                <span class="glyphicon glyphicon-map-marker"
                                      style="position: relative;top: 14px;"></span>
                                <span style="font-size: 10px;position: relative;top: 12px;">(家庭地址)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.city}&nbsp;&nbsp;邵阳</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 45px">
                                <span class="glyphicon glyphicon-gift"
                                      style="position: relative;top: 14px;"></span>
                                <span style="position: relative;top: 12px;">${userShowInfo.birthday}</span>
                            </div>
                        </div>
                    </div>
                    <%--工作地址--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 45px">
                                <span class="glyphicon glyphicon-screenshot"
                                      style="position: relative;top: 14px;"></span>
                                <span style="font-size: 10px;position: relative;top: 12px;">(工作地址)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.address}</span>
                            </div>
                        </div>
                    </div>
                    <%--练习方式--%>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10"
                             style="border-bottom: 1px dashed gainsboro">
                            <div style="height: 130px">
                                <span class="glyphicon glyphicon-list"
                                      style="position: relative;top: 18px;"></span><span
                                    style="position: relative;top: 18px;left: 2px;">联系方式:</span><br/>
                                <span style="font-size: 10px;position: relative;top: 18px;">(电话)</span><span
                                    style="position: relative;top: 20px;">${userShowInfo.filexPhone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 18px;">(手机)</span><span
                                    style="position: relative;top: 20px;">${userShowInfo.phone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 18px;">(qq)</span><span
                                    style="position: relative;top: 20px;">${userShowInfo.qq}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 18px;">(邮箱)</span><span
                                    style="position: relative;top: 20px;">${userShowInfo.mail}</span>
                            </div>
                        </div>
                    </div>

                </div>
                <%--发布的景点--%>
                <div class="col-md-9" style="height: 510px;">
                    <div class="row">
                        <div id="showScaneList">
                            <div class="col-md-1" style="height: 400px;">
                            </div>
                            <div class="col-md-11"
                                 style="padding-left: 0px">

                                    <div class="row" style="height: 500px;background-color: white">
                                        <c:forEach items="${albums}" var="album">

                                            <div class="col-sm-5 col-sm-offset-1">
                                                <div id="albumCss" >
                                                    <span style="font-size: 20px;color: white">${album.name}</span>
                                                </div>
                                                <div style="overflow: hidden;width: 200px;height: 200px; cursor:pointer;" onclick="showAlbum(${album.id})">
                                                    <img src="${pageContext.request.contextPath}/album/${album.cover}">
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-1 hidden-sm"></div>
    </div>
</div>
<script>
    function showAlbum(obj) {
        location.href="${pageContext.request.contextPath}/img/showImg1/"+obj+"?name="+"--1";
    }

    function supportuser(obj) {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/supportUser/'+obj,
            type:'post',
            success:function (data) {
                if("1"===data){
                    var hotnum=$("#userhotnum").text();
                    console.log("999999999999999="+hotnum)
                    if(hotnum==='undefined'){
                        hotnum=0;
                    }
                    var finalHotnum=hotnum*1+1;
                    swal("成功","感谢你的支持","success");
                    console.log("999999999999999====="+finalHotnum)
                    $("#userhotnum").text(finalHotnum);
                }else {
                    alert("点赞失败....")
                }
            }
        });
    }
</script>
</body>
<%@ include file="footer.jsp" %>
</html>
