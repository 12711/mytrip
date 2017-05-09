<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/3/24
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>欢迎来到来到家庭互助旅游</title>
    <style type="text/css">
        ul {
            display: block;
            list-style-type: disc;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
            -webkit-padding-start: 40px;
        }

        ul, li {
            margin: 0;
            padding: 0;
        }

        ul li {
            list-style: none;
        }

        li {
            display: list-item;
            text-align: -webkit-match-parent;
            font-size: 8px;
            background: none;
            padding: 8px 0 8px 0;
        }

        .top .number {
            background: #3a9d9a;
        }

        .number {
            background: #464545;
            width: 16px;
            height: 16px;
            line-height: 16px;
            font-family: "宋体";
            font-size: 14px;
            font-weight: 700;
            margin: 0px 8px 0px 4px;
            text-align: center;
            color: #fff;
            display: inline-block;
        }

        #dizhuform .btn-default:hover, .btn-default:active, .btn-default:visited, .btn-default:focus {
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 10px">
        <form action="${pageContext.request.contextPath}/trip/toSearch" method="get" id="dizhuform">
            <div class="btn-group btn-group-lg col-sm-8"
                 style="margin-left: 23px;">

                <select class="btn btn-default" style="font-size: 17px;height: 40px;"
                        name="type">
                    <option value="p">地主</option>
                    <option value="d">地区</option>
                </select>
                <input type="text" class="btn btn-default" style="text-align: left;height: 40px;"
                       name="content">
                <button style="height: 40px;width: 45px;margin-left: 10px;background-color:#3A9D9A;border: none">
                    <span class="glyphicon glyphicon-search"
                          style="font-size: large;color: white"></span>
                </button>

            </div>
        </form>
    </div>
</div>
</div>
<div class="row" style="margin-top: 10px">
    <div class="row clearfix">
        <div class="col-sm-1"></div>
        <div class="col-sm-9 column" style="margin-left: 25px;">
            <div class="carousel slide" id="carousel-709956">
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#carousel-709956">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-709956">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-709956"
                        class="active">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item">
                        <img alt=""
                             src="${pageContext.request.contextPath}/img/default%20(2).jpg"/>
                        <div class="carousel-caption">
                            <h4>
                                First Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in,
                                egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh
                                ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img alt=""
                             src="${pageContext.request.contextPath}/img/default.jpg"/>
                        <div class="carousel-caption">
                            <h4>
                                Second Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in,
                                egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh
                                ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                    <div class="item active">
                        <img alt=""
                             src="${pageContext.request.contextPath}/img/default%20(1).jpg"/>
                        <div class="carousel-caption">
                            <h4>
                                Third Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in,
                                egestas eget quam. Donec id elit non mi porta
                                gravida at eget metus. Nullam id dolor id nibh
                                ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-709956"
                   data-slide="prev"><span
                        class="glyphicon glyphicon-chevron-left"></span></a> <a
                    class="right carousel-control" href="#carousel-709956"
                    data-slide="next"><span
                    class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </div>

</div>
<div class="row" >
    <div class="col-sm-2"></div>
    <div class="col-sm-8" >

    </div>
    <div class="col-sm-2"></div>
</div>
<div class="row" style="margin-top: 10px">

    <div class="col-sm-1 "></div>
    <%--热门相册--%>
    <div class="col-sm-10 " style="margin-left: -20px">
        <div class="col-sm-8">
            <div class="col-md-12 column" >
                <div class="col-md-12 column">
                    <div class="page-header"
                         style="margin-left: -10px;margin-top: -10px;border-bottom: 2px solid #fa7a20;">
                        <h1>
                            上榜相册
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${album}" var="a">
                        <div class="col-md-6" style="height: 340px">
                            <div class="thumbnail">
                                <div style="width: 323px;height: 200px;overflow: hidden" onclick="clickImg(${a.id},'${a.userShowInfo.userName}')">
                                <img alt="300x200" style="width: 100%;height: auto" title="${a.desc}" data-toggle="tooltip" data-placement="right" title="${a.desc}"
                                     src="${pageContext.request.contextPath}/album/${a.cover}"/>
                                </div>
                                <div style="margin-top: 20px"><a href="javaScript:;" rel="drevil" title="<img height='50' width='50' src='${pageContext.request.contextPath}/img/${a.userShowInfo.mypig}'><span style='position: relative;top: 20px;'>${a.userShowInfo.userName}<span>" data-content="<div class='row'><span>相册名:</span>${a.name}</div><div class='row'><span>创建于</span>${a.createTime}</div>" class="btn btn-warning">查看</a></div>

                            </div>



                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%--热门日志--%>
        <div class="col-sm-4">
            <div class="row clearfix"
                 style="margin-left: 35px;border: 1px solid gainsboro;width: 250px;max-height: 668px;min-height: 450px;">
                <div style="margin-left: 10px;border-bottom: 2px solid #fa7a20;"><h1 style="text-underline:dash ">
                    热门日志</h1></div>
                <div class="col-md-12 column" style="margin-left: 5px">
                    <ul id="logul">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    $(function () {
        $("[rel=drevil]").popover({
            trigger:'manual',
            placement : 'right', //placement of the popover. also can use top, bottom, left or right
            title : '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;"> Muah ha ha</div>', //this is the top title bar of the popover. add some basic css
            html: 'true', //needed to show html of course
            //content : '<div id="popOverBox"><img src="http://www.hd-report.com/wp-content/uploads/2008/08/mr-evil.jpg" width="251" height="201" /></div>', //this is the content of the html box. add the image here or anything you want really.
            animation: false
        }).on("mouseenter", function () {
            var _this = this;
            $(this).popover("show");
            $(this).siblings(".popover").on("mouseleave", function () {
                $(_this).popover('hide');
            });
        }).on("mouseleave", function () {
            var _this = this;
            setTimeout(function () {
                if (!$(".popover:hover").length) {
                    $(_this).popover("hide")
                }
            }, 100);
        });

         $("[data-toggle='tooltip']").tooltip();

         $('[data-toggle="popover"]').popover();
        $("#example").popover();

        if (${loginErrorInfoFR!=null}) {
            alert('${loginErrorInfoFR}');
        }
        //进页面第一次刷新
        getlog();
        setInterval("getlog()", 5000);

    });
    function clickImg(obj,name){
        location.href="${pageContext.request.contextPath}/img/showImg1/"+obj+"?name="+name;
    }


    function getlog() {
        $.ajax({
            url: '${pageContext.request.contextPath}/user/getHotLog',
            contextType: 'json',
            dateType: 'json',
            success: function (e) {
                // console.log("刷新成功了...."+JSON.stringify(e));
                $("#logul").html("");
                for (var logi in e) {
                    var title = e[logi].title
                    var id = e[logi].id;
                    var temp = " <li class='top'><span class='number'>" + (logi * 1 + 1) + "</span>" +
                        "<a href='${pageContext.request.contextPath}/log/getOneLog/" + id + "'>" + title + "</a></li>";
                    $("#logul").append($(temp));
                }

            }
        });
    }
</script>
</body>
<%@include file="footer.jsp" %>
</html>
