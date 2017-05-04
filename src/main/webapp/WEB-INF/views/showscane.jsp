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
    <script src="${pageContext.request.contextPath}/ck/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="container-fluid" style="background-color: #F2F2F2;padding-left: 0px;padding-right: 0px">
    <div class="row-fluid" style="height:100px;background-color: white">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <div class="col-sm-12">
                <h1>${userScane.sName}</h1>
            </div>
            <div class="col-sm-12">地址:${userScane.address}</div>
        </div>
        <div class="col-sm-3" style="margin-top: 60px;"><a href="${pageContext.request.contextPath}/trip/getUserById/${userScane.uid}?pageIndex=-1">返回主页>></a></div>
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
            <div class="spot_info" style="height: 900px">
                <h3>门票及开放时间</h3>
                <h4>门票</h4>
                ${userScane.ticket}
                <h4>开放时间</h4>
                ${userScane.opentime}
                <h3>优惠政策</h3>
                ${userScane.favourable}
                <h3>攻略详情

                    <c:if test="${userScane.uid ==userInfo.uid}">
                      <a style="margin-left: 160px;" href="#modal-container-37989" data-toggle="modal" title="发布攻略"><span class="glyphicon glyphicon-pencil"></span></a>
                    </c:if>
                </h3>

                <div class="modal fade" id="modal-container-37989" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">
                                    发布关于${userScane.sName}的攻略
                                </h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form" id="radierFrom">
                                    <input type="hidden" name="sid" value="${userScane.sid}">
                                    <input type="hidden" name="author" value="${userInfo.userName}">
                                    <div class="form-group">
                                        <label for="title" class="col-sm-2 control-label">标题</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="title" name="title" placeholder="请输入一个关于攻略的标题">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="content" class="col-sm-2 control-label">内容</label>
                                        <div class="col-sm-10">
                                           <textarea id="content" name="content"></textarea>
                                            <script>
                                                var ckeditor= CKEDITOR.replace("content");
                                            </script>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" id="radierSubmit" class="btn btn-primary">保存</button>
                            </div>
                        </div>

                    </div>

                </div>

                <c:forEach items="${radiers}" var="radier" varStatus="r">
                    <div style="margin-top: 25px">
                       <div class="col-md-10">
                         ${r.count}.<a href="#modal-container-see-${radier.rid}"  data-toggle="modal">${radier.title}</a>
                       </div>
                        <c:if test="${userScane.uid ==userInfo.uid}">
                        <div class="col-md-2"><a href="#modal-container-update-${r.count}" id="updateRadier" title="修改攻略" data-toggle="modal"><span class="glyphicon glyphicon-wrench"></span></a></div>
                        </c:if>
                        <div class="modal fade"  id="modal-container-update-${r.count}" aria-hidden="true" role="dialog" aria-labelledby="myModalLabel2">
                            <div class="modal-dialog">
                                <div class="modal-content" style="min-height: 400px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <div >
                                            <form id="updateForm" action="${pageContext.request.contextPath}/radier/updateRadier" method="post" onsubmit="return test()">
                                            <div  style="margin-left: 20px">
                                                <div class="form-group">
                                                    <label for="title" class="col-sm-2 control-label">标题</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control"  name="title" value="${radier.title}">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-top: 20px">
                                                    <label for="content" class="col-sm-2 control-label">内容</label>
                                                    <div class="col-sm-10">
                                                <textarea id="lsm${r.count}" name="content" id="updatecontent"></textarea>
                                                <div id="ti${r.count}" style="display: none">${radier.content}</div>
                                                <script>
                                                    var ckeditor= CKEDITOR.replace("lsm${r.count}");
                                                     var content=$("#ti${r.count}").html();
                                                    CKEDITOR.instances.lsm${r.count}.setData(content);
                                                </script>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="sid" value="${radier.sid}">
                                                <input type="hidden" name="rid" value="${radier.rid}">
                                            </div>
                                            <div class="modal-footer" style="border-top:none">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit" id="radierupdate" class="btn btn-primary">修改</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal-container-see-${radier.rid}" aria-hidden="true" role="dialog" aria-labelledby="myModalLabel1">

                        <div class="modal-dialog">
                            <div class="modal-content" style="min-height: 400px;">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <h3>${radier.title}<span style="margin-left: 20px;font-size: 10px;color: gainsboro">${radier.author}发表于${radier.posttime}</span></h3>
                                    </div>
                                    <div >
                                        <div id="radierContent"  style="margin-left: 20px">
                                            <span >${radier.content}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

</div>
<script>
    $(function () {
        $("#radierSubmit").click(function () {
            console.log("sfddsfasd");
             var text=CKEDITOR.instances.content.getData();
             var form=$("#radierFrom").serialize();
             form+=text;
             $.ajax({
                 url:'${pageContext.request.contextPath}/radier/addRadier',
                 data:form,
                 dataType:'json',
                 type:'post',
                 success:function (data) {
                     location.href="${pageContext.request.contextPath}/scane/getScane/${userScane.sid}"
                 }
             });


        });

    });

    function test() {
        console.log($("#updateForm").find("input"));
        console.log($($("#updateForm").find("input")[0]).val());
        console.log($($("#updateForm").find("input")[0]).val().length);
        return false;
    }


</script>
</body>
<%@include file="footer.jsp" %>
</html>
