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
        #showScan{
            text-align: center;
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
                    <a href="#" class="active"
                       style="-webkit-tap-highlight-color: rgba(0,0,0,0);text-decoration: none;cursor: auto;margin-top: 15px;position: relative;top: 15px;left: 25%;">他的主页</a>
                    <a href="#"
                       style="text-decoration: none;cursor: auto; margin-top: 15px;position: relative;top: 15px;left: 65%;">热门相册</a>
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
                                      style="position: relative;top: 14px;"></span><span
                                    style="position: relative;top: 12px;left: 2px;">联系方式:</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(电话)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.filexPhone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(手机)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.phone}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(qq)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.qq}</span><br/>
                                <span style="font-size: 10px;position: relative;top: 12px;">(邮箱)</span><span
                                    style="position: relative;top: 12px;">${userShowInfo.mail}</span>
                            </div>
                        </div>
                    </div>

                </div>
                <%--发布的景点--%>
                <div class="col-md-9" style="height: 400px;">
                    <div id="showScaneList">
                        <div class="col-md-1" style="height: 400px;">
                        </div>
                        <div class="col-md-11"
                             style="height: 400px;padding-left: 0px">
                            <div class="row" style="margin-right: -20px;height: 200px;background-color: white">
                                   <div><span>西湖</span></div>
                                   <div id="showScan" style="width: 100%;">
                                      &nbsp;&nbsp;&nbsp; 杭州之美，美在西湖。西湖旧称武林水、钱塘湖、西子湖，宋代始称西湖。西湖位于杭州城西，三面环山，东面濒临市区，是一个湖泊型的国家级风景名胜区。1982年西湖被确定为国家风景名胜区，1985年被评为&ldquo;中国十大风景名胜&rdquo;之一。湖中有三岛：三潭印月，湖心亭，阮公墩。绕湖一周约15公里。
                                       云山秀水是西湖的底色；山水与人文交融是西湖风景名胜区的格调。在西湖11个景区里，分布着100多个景点，60多处国家及省、市级重点文物保护单位，20多座博物馆（纪念馆）。
                                       &ldquo;一湖两塔三岛三堤&rdquo;是西湖全景的&ldquo;名片&rdquo;；城区与湖水的门厅是以绿地公园、遗址雕像为主的湖滨景区；吴山景区以吴山为中心，城隍阁为标志；一衣带水的南山路串联了南线景区的24个自然与人文景点；形如飞凤的凤凰山和南宋皇城遗址形成了凤凰山景区；玉皇飞云和八卦田是玉皇山景区的亮点；自然野逸的杨公堤景区回归生态；钱塘江沿岸有&ldquo;六和如将军&rdquo;和钱塘江大桥长虹卧波；北线景区以北山街为主干道，组成了&ldquo;没有围墙的博物馆&rdquo;；西湖西南以泉水出名，满陇桂雨成为西湖秋游的首选；杭州城区的胡雪岩故居和杭州碑林在现代繁华之地另辟天地，镌刻历史。</span>
                                   </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-10">
                                    <div style="height: 200px;width:200px;overflow: hidden">
                                    <img style="height: 30%;width: 30%" src="${pageContext.request.contextPath}/img/xihu.jpg">
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                            </div>

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
