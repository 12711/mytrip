<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<html>
<head>

    <title>在线聊天</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/upload/webuploader.css">
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/demo.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/font-awesome.css"
          rel="stylesheet"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/upload/webuploader.js"></script>
    <script type="text/javascript">

    </script>

    <style type="text/css">
        . yyy{
            position:relative;
            width:150px;
            height:35px;
            background:#F8C301;
            border-radius:5px; /* 圆角 */
            margin:30px auto 0;
        }

        .send {
            position:relative;
            width:150px;
            height:35px;
            background:#F8C301;
            border-radius:5px; /* 圆角 */
            margin:30px auto 0;
        }

        .send .arrow {
            position:absolute;
            top:5px;
            right:-16px; /* 圆角的位置需要细心调试哦 */
            width:0;
            height:0;
            font-size:0;
            border:solid 8px;
            border-color:#4D4948 #4D4948 #4D4948 #F8C301;
        }
    </style>
</head>
<body >
<div class="container">
       <div class="row">
           <div style="width:100%;height:420px; overflow :auto; border:1px solid;">
               <div class="row">你正在和<span id="toname"></span>聊天</div>
               <div class="row" >

                   <div class="col-sm-12">
                   <div id="infoList">

                   </div>
                   </div>
               </div>
           </div>
       </div>
    <div class="row">
        <input class="form-control" type="text" id="messageInfo" placeholder="请输入你的内容。。。">
        <input type="hidden" value="${touid}" id="toid">
        <input class="form-control" type="button" value="发送" id="messageInfoBtn">
    </div>

</div>

</body>
<script>

    //接受数据出发函数
    websocketChat.onmessage=function (event) {
        console.log("e====="+event.data)
        if(event.data==='-1'){
            swal("error","对方不在线，请稍后联系","error");
        }

        var infos=event.data.split(":::");
        var datePost=infos[0];
        console.log("t====="+datePost)
        var info=infos[1];
        console.log("1====="+info)
        console.log(infos[2]==='${touid}');
        if(infos[2]==='${touid}') {
            $("#infoList").append("<div class='row' style='width: 100%;margin-left: 20px;'>" +
                "<div style='position: relative;float: left;right: 50px;'><label class='row' style='max-width: none;margin-left: 50px'>" + datePost + "</label>" +
                "<div class='send' style='position: relative;width: auto;height: 35px;background: #eadede;border-radius: 5px;margin: 30px auto 0;left: 50px;'>" +
                "<span style='color: black'>" + info + "</span><div class='arrow' style='position: absolute;top: 5px;left: -16px;width: 0;height: 0;font-size: 0;border: solid 8px;border-color: #fff #eadede #fff #ffffff ;'></div>" +
                "</div> </div> </div>");
        }
    }
    //前段发送数据
    $(function () {
       var dataInfo='${content}';
       console.log("----------------"+typeof dataInfo);
        console.log(dataInfo=='');
       if(dataInfo!=='') {
           console.log(dataInfo)
           var infoss=dataInfo.split(":::");

           $("#infoList").append("<div class='row' style='width: 100%;margin-left: 20px;'>" +
               "<div style='position: relative;float: left;right: 50px;'><label class='row' style='max-width: none;margin-left: 50px'>" + infoss[0] + "</label>" +
               "<div class='send' style='position: relative;width: auto;height: 35px;background: #eadede;border-radius: 5px;margin: 30px auto 0;left: 50px;'>" +
               "<span style='color: black'>" + infoss[1] + "</span><div class='arrow' style='position: absolute;top: 5px;left: -16px;width: 0;height: 0;font-size: 0;border: solid 8px;border-color: #fff #eadede #fff #ffffff ;'></div>" +
               "</div> </div> </div>");
           $("#toname").text(infoss[2]);
       }

        $("#messageInfoBtn").click(function () {
            var messageInfo=$("#messageInfo").val();
            var toid=$("#toid").val();
            var datenow=formatDateTime(new Date());
            $("#infoList").append("<div class='row' style='width: 100%;margin-left: 20px;'>"+
                "<div style='position: relative;float: right;'><label class='row' style='max-width: none;margin-right: 50px'>"+datenow+"</label>"+
                "<div class='send' style='position: relative;width: auto;height: 35px;background: #eadede;border-radius: 5px;margin: 30px auto 0;right: 50px;'>"+
                "<span style='color: black'>"+messageInfo+"</span><div class='arrow' style='position: absolute;top: 5px;right: -16px;width: 0;height: 0;font-size: 0;border: solid 8px;border-color: #fff  #fff #ffffff #eadede;'></div>"+
                "</div> </div> </div>");
            websocketChat.send(datenow+":::"+messageInfo+"&&"+toid+"&&"+'${userInfo.uid}');
            $("#messageInfo").val("");

        });
    })
  //格式化日期
    var formatDateTime = function (date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        var minute = date.getMinutes();
        minute = minute < 10 ? ('0' + minute) : minute;
        var second=date.getSeconds();
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
    };
</script>
</html>