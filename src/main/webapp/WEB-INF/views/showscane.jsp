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
        <c:if test="${uid!=null}">
        <div class="col-sm-3" style="margin-top: 60px;"><a href="${pageContext.request.contextPath}/trip/getUserById/${userScane.uid}?pageIndex=-1">返回主页>></a></div>
        </c:if>
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
                <h3>查看住房信息</h3>
                <a href="${pageContext.request.contextPath}/hourse/inter/toShowHourse" data-toggle="modal">查看住房信息</a>
                <h3>预约游玩</h3>
                公告:<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于地主可能收到较多的游玩预约,如果你想去此地游玩请提前预约之后等待地主的审核!
                <c:if test="${userScane.uid!=userInfo.uid}">
                    <a href="#orderScanemodel" data-toggle="modal">>>点击预约</a>
                </c:if>
                <div id="orderScanemodel" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" >
                                    选择游玩日期
                                </h4>
                            </div>
                            <div class="modal-body">
                               <div class="row">
                                   <div class="col-sm-1"></div>
                                   <div class="col-sm-10">
                                <form id="orderScaneInfo">
                                    <input type="hidden" value="${userScane.sid}" name="sid" >
                                    <input type="hidden" value="${userScane.uid}" name="dzuid">
                                    <input type="hidden" value="${userInfo.uid}" name="ykuid" id="ykuid">
                                    <input class="form-control" id="orderScaneDate" name="travleTime">
                                </form>
                                   </div>
                                   <div class="col-sm-1"></div>
                               </div>
                                <div class="row">
                                    <div class="col-sm-10 hidden-sm"></div>
                                    <div class="col-md-1 ">
                                       <input type="button" id="orderScaneSubmit"  class="btn btn-danger" value="提交">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h3>门票及开放时间</h3>
                <h4>门票</h4>
                ${userScane.ticket}
                <h4>开放时间</h4>
                ${userScane.opentime}
                <h3>优惠政策</h3>
                ${userScane.favourable}
                <h3>攻略详情

                    <c:if test="${userScane.uid ==userInfo.uid}">
                      <a style="margin-left: 100px;" href="#modal-container-37989" data-toggle="modal" title="发布攻略"><span class="glyphicon glyphicon-pencil"></span></a>
                      <a href="javaScript:void(0)"style="margin-left: 40px;"  id="todeleteRadier"  title="删除攻略" ><span class="glyphicon glyphicon-trash"></span></a>
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
                                            <input type="text" class="form-control" id="title" required name="title" placeholder="请输入一个关于攻略的标题">
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
                    <div style="margin-top: 25px" id="${radier.rid}">
                       <div class="col-md-10">
                         ${r.count}.<a href="#modal-container-see-${radier.rid}"  data-toggle="modal">${radier.title}</a>
                       </div>
                        <c:if test="${userScane.uid ==userInfo.uid}">
                        <div class="col-md-2 updateRadier" style="display: block"><a href="#modal-container-update-${r.count}"  title="修改攻略" data-toggle="modal"><span class="glyphicon glyphicon-wrench"></span></a></div>
                        <div class="col-md-2 deleteRadier" style="display: none"><input type="hidden"   value="${radier.rid}"><span class="glyphicon glyphicon-trash deleteButton" ></span></div>
                        </c:if>
                        <div class="modal fade"  id="modal-container-update-${r.count}" aria-hidden="true" role="dialog" aria-labelledby="myModalLabel2">
                            <div class="modal-dialog">
                                <div class="modal-content" style="min-height: 400px;">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <div >
                                            <form id="updateForm" action="${pageContext.request.contextPath}/radier/updateRadier" method="post" >
                                            <div  style="margin-left: 20px">
                                                <div class="form-group">
                                                    <label for="title" class="col-sm-2 control-label">标题</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control"  required name="title" value="${radier.title}">
                                                    </div>
                                                </div>
                                                <div class="form-group" style="margin-top: 20px">
                                                    <label for="content" class="col-sm-2 control-label">内容</label>
                                                    <div class="col-sm-10">
                                                <textarea id="lsm${r.count}" name="content" required id="updatecontent"></textarea>
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
        $("#orderScaneDate").change(function () {
            var selectDate=$("#orderScaneDate").val();
            var data=new Date(selectDate)
            var nowDate=new Date();
            if(data.getTime()-nowDate.getTime()<0){
                swal("错误","请选择有效日期","error");
                $("#orderScaneDate").val("");
                return;
            }
        });
        $("#orderScaneSubmit").click(function () {
            var selectDate=$("#orderScaneDate").val();
            if(selectDate===""){
                swal("错误","请选择日期","error");
                return ;
            }else if($("#ykuid").val()===""){
                swal("错误","你未登录","error");
                return ;
            } else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/orderScane/inter/order",
                    data:$("#orderScaneInfo").serialize(),
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        if(data==="0"){
                            swal("成功","预约成功!","success");
                            $("#orderScanemodel").modal('hide');
                        }else{
                            swal("失败","你已经预约或者别的错误","error");
                            $("#orderScanemodel").modal('hide');
                        }
                    }
                });
            }

        });
        $("#orderScaneDate").datetimepicker({
            minView: "month", //选择日期后，不会再跳转去选择时分秒
            format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式
            language: 'zh-CN', //汉化
            autoclose:true //选择日期后自动关闭
        });
        $(".deleteButton").click(function () {
            var $span=$(this);
            var rid=$span.prev().val();
            swal({
                title: "您确定要删除吗？",
                text: "您确定要删除这条数据？",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "是的，我要删除",
                confirmButtonColor: "#ec6c62"
            }, function() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/radier/deleteRadier/"+rid,
                    type: "post",
                    dataType:"json"
                }).done(function(data) {
                    if(data==="1"){
                        swal("操作成功!", "已成功删除数据！", "success");
                        $("#"+rid).remove();
                    }else{
                        swal("OMG", "删除操作失败了!", "error");
                    }

                });
            });
        });

        window.deleteRadierflag=false;
        $("#todeleteRadier").click(function () {
            if(!deleteRadierflag){
                $(".deleteRadier").css("display","block");
                $(".updateRadier").css("display","none");
                deleteRadierflag=true;
            }else{
                $(".deleteRadier").css("display","none");
                $(".updateRadier").css("display","block");
                deleteRadierflag=false;
            }

        });



        $("#radierSubmit").click(function () {
            console.log("sfddsfasd");
             var text=CKEDITOR.instances.content.getData();
             var title=$("#title").val();
             if(text===""||title===""){
                 swal("错误","请填写所有内容","error");
                 return;
             }
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
