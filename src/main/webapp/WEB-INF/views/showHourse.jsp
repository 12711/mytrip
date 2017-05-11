<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/3/26
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<html>
<head>
    <title>我的住房</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <style type="text/css">

      #showmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}

        #userName{
            text-shadow: 1px 1px 1px rgba(0,0,0,.2);
            color: #cc8f14;
        }
        #headtitle .row{
            margin-top: 5px;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A739765f9a84bee561d30fa0b537ccb9"></script>
    <script src="${pageContext.request.contextPath}/js/viewer.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/viewer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="container">
    <%--头部用来显示用户的一些信息--%>
    <div class="row" style="margin-top: 20px">
        <div class="col-sm-1" >
            <img style="height: 120px;width: 120px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/img/${userInfo.mypig}">
        </div>
        <div class="col-sm-1" ></div>
        <div class="col-sm-8" style="margin-left: -20px" id="headtitle">
            <div class="row">
                <div class="col-sm-6"><span id="username" style="font-size: 20px">${showRank.userName}</span></div>
            </div>
            <div class="row" >
                <div class="col-sm-6"><label>信誉等级:</label><img src="${pageContext.request.contextPath}/img/rank/${showRank.rank}" alt=""></div>
            </div>
            <div class="row" >
                <div class="col-sm-12"><label>签名:</label>${showRank.sign}</div>
            </div>
        </div>
    </div>

    <%--日志主题部分--%>
    <div class="row" style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
        <div class="col-sm-2" style="margin-left: 50px;"><span style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>我的房屋信息</h3></span></div>
        <div class="col-sm-7 .hidden-md"></div>
    </div>
    <div>
        <div class="col-md-12 column">
            <div class="row">
                <div class="row">
                    <div class="col-md-12 column" style="min-height:200px;">
                        ${hourse.content}
                    </div>
                    <div class="col-md-12">
                        <div >
                        要查询的地址：<input id="text_" type="text"  style="margin-right:100px;"/>
                        查询结果(经纬度)：<input id="result_" type="text" />
                        <input type="button" value="查询" onclick="searchByStationName();"/>
                        </div>
                       <div id="showmap" style="margin-top: 20px"></div>
                        <script type="text/javascript">
                            // 百度地图API功能
                            var map = new BMap.Map("showmap");    // 创建Map实例
                            map.centerAndZoom(new BMap.Point(111.73,27.25), 11);  // 初始化地图,设置中心点坐标和地图级别
                            map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
                            map.setCurrentCity("邵东");          // 设置地图显示的城市 此项是必须设置的
                            map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                        </script>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <div class="panel-group" id="panel-859591">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-859591" href="#panel-element-286058">点击查看详情图片</a>
                            </div>
                            <div id="panel-element-286058" class="panel-collapse collapse">
                                <div class="panel-body">
                                   <c:if test="${imges.size()==0}" var="t">
                                       <h1>你还没有添加图片!<a href="${pageContext.request.contextPath}/hourse/inter/toAddHourseImg?hid=${hourse.hid}">是否现在添加?</a></h1>

                                   </c:if>
                                    <c:if test="${!t}" >
                                    <div >
                                        <c:forEach items="${imges}"  var="img">
                                           <div class="col-sm-3" style="margin-left: 30px">
                                               <div style="width: 300px;height: auto;overflow: hidden;"><img style="margin-top: 0px" src="${pageContext.request.contextPath}/hourse/${img.name}" data-original="${pageContext.request.contextPath}/hourse/${img.name}"></div>
                                            </div>

                                        </c:forEach>

                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<script >
    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport(); //允许自动调节窗体大小
    $(function () {
        search('${showRank.city}');
    })

   function searchByStationName(){
       var keyword = document.getElementById("text_").value;
       search(keyword);
   }

   function  search(keyword) {
       localSearch.setSearchCompleteCallback(function (searchResult) {
           var poi = searchResult.getPoi(0);
           document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat; //获取经度和纬度，将结果显示在文本框中
           map.centerAndZoom(poi.point, 13);
       });
       localSearch.search(keyword);
   }

</script>
</body>
</html>
