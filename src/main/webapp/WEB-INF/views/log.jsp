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
    <title>我的日志</title>

    <style type="text/css">
        #userName{
            text-shadow: 1px 1px 1px rgba(0,0,0,.2);
            color: #cc8f14;
        }
        #headtitle .row{
            margin-top: 5px;
        }
    </style>
</head>
<body>
   <div class="container">
       <%--头部用来显示用户的一些信息--%>
       <div class="row" style="margin-top: 20px">
          <div class="col-sm-1" >
              <img style="height: 120px;width: 120px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/img/${userLog.userInfo.mypig}">
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
           <div class="col-sm-2" style="margin-left: 50px;"><span style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>日志</h3></span></div>
           <div class="col-sm-7 .hidden-md"></div>
           <c:if test="${userLog.uid==userInfo.uid}" var="t">
           <div class="col-sm-2 .hidden-md" style="margin-top: 20px"><a href="${pageContext.request.contextPath}/log/inter/logList">返回日志列表</a></div>
           </c:if>
           <c:if test="${!t&&uid!=null}">
               <div class="col-sm-2 .hidden-md" style="margin-top: 20px"><a href="${pageContext.request.contextPath}/log/getLogInIndex/${userLog.uid}?pageIndex=-1">返回他的日志</a></div>

           </c:if>
       </div>
       <div>
           <div class="col-md-12 column">
               <div class="page-header" style="margin-top: 5px">

                   <h2>
                       ${userLog.title}
                   </h2>
                   <span style="margin-left: 10px">${userLog.createDate}  阅读量(${userLog.hotNum})</span>
                   <span style="margin-left: 10px"><a href="${pageContext.request.contextPath}/log/inter/writelog">写日志</a> </span>
               </div>
               <%--日志正文--%>
               <div class="row">
                    <div class="row">
                        <div class="col-md-12 column" style="min-height:200px;">
                            ${userLog.content}
                        </div>
                    </div>
               </div>
           </div>
       </div>
   </div>
<%@include file="footer.jsp"%>
</body>
</html>
