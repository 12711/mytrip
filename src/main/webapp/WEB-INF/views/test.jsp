<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.css"></link>
    <script src="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.js"></script>
    <style>
        .signshow{
            width: 200px;
            word-break: break-all;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
        }
    </style>
</head>
<body style="background-color: #f2f2f2">
<div class="container">
    <div class="row" style="margin-left: -50px;margin-top: 20px;">
        <div >
            <div class="btn-group btn-group-lg col-sm-8"
                 style="margin-left: 23px;">

                <select class="btn btn-default" style="font-size: 17px;height: 40px;"
                        name="type" id="type">
                    <option value="p">地主</option>
                    <option value="c">日志</option>
                    <option value="d">地区</option>
                </select>
                <input type="text" class="btn btn-default" style="height: 40px;"
                       name="content" id="content">
                <button id="formsub" style="height: 40px;width: 45px;margin-left: 10px;background-color:#3A9D9A;border: none">
                    <span class="glyphicon glyphicon-search"
                          style="font-size: large;color: white"></span>
                </button>

            </div>
        </div>
    </div>

    <div class="row" style="background-color: white;height: 650px;margin-top: 10px;">
        <div class="col-md-12 column" style="margin-top: 10px">
            <div class="row" id="showUser">

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-1 hidden-sm"></div>
        <div class="col-md-10">
            <ul id="demo1" class="pagination">
            </ul>
        </div>
        <div class="col-md-1 hidden-sm"></div>
    </div>
</div>

<script type="application/html" id="showUserInfoTem">
<div class="col-md-3" style="height:300px;margin-top:20px">
    <div class="thumbnail" style="height:300px" >
        <img alt="300x200" style="width:120px;height:120px" src=""  class="myImg"/>
        <div class="caption">
            <div class="col-md-12"><lable style="font">用户名:</lable><span class="uname"></span></div>
            <div class="col-md-12"><lable>地区:</lable><span class="uaddr"></span></div>
            <div class="col-md-12"><lable>信用等级:</lable><img src="" class="rankImg"></div>
            <div class="col-md-12"><lable>个性签名:</lable><div style="width:100%;;word-break: break-all;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;"><span class="usign"></span><div></div>
        </div>
    </div>
</div>
</script>

<script>


    $(function () {
        var pageInfoFirst = {
            param: "${content}",
            pageIndex: 1,
            pageSize: 4,
            type: '${type}'
        }
        $.ajax({
            url: '${pageContext.request.contextPath}/trip/getUserLogAddr',
            type: 'get',
            dataType: 'json',
            data: pageInfoFirst,
            success: function (data) {
                totle = data.totle;
                if(data.rows.length==0){
                    $("#showUser").html("");
                    $("#showUser").append("<div class='col-sm-4'></div><div class='col-sm-4'><span><h3>没有查到任何数据....</h3></span></div>");
                }else{
                    var row=data.rows;
                    $("#showUser").html("");
                    for(var i in row) {
                        var $template = $($("#showUserInfoTem").html()).clone();
                        console.log("-----");
                        console.dir($template.children().children("div").children("div"))
                        $template.find(".myImg").attr("src",'${pageContext.request.contextPath}/img/'+row[i].mypig);
                        $template.find(".uname").text(row[i].userName);
                        $template.find(".uaddr").text(row[i].city);
                        $template.find(".rankImg").attr("src",'${pageContext.request.contextPath}/img/rank/'+row[i].rank);
                        $template.find(".usign").text(row[i].sign);
                        $template.append("<input type='hidden' value='"+row[i].uid+"'/>");
                        $("#showUser").append($template);
                    }
                }
            }
        });


        window.totle = '${totle}' * 1;
        var demo = BootstrapPagination($("#demo1"), {
            //记录总数。
            total: window.totle,
            //当前页索引编号。从其开始（从0开始）的整数。
            pageIndex: 0,
            //当分页更改后引发此事件。
            pageChanged: function (pageIndex, pageSize) {
                var pageInfo = {
                    param: $("#content").val(),
                    pageIndex: pageIndex+1,
                    pageSize: pageSize,
                    type: $("#type").val()
                }
                $.ajax({
                    url: '${pageContext.request.contextPath}/trip/getUserLogAddr',
                    type: 'get',
                    dataType: 'json',
                    data: pageInfo,
                    success: function (data) {
                        totle = data.totle;
                        if(data.rows.length==0){
                            $("#showUser").html("");
                            $("#showUser").append("<div class='col-sm-4'></div><div class='col-sm-4'><span><h3>没有查到任何数据....</h3></span></div>");
                        }else{
                            var row=data.rows;
                            $("#showUser").html("");
                            for(var i in row) {
                                var $template = $($("#showUserInfoTem").html()).clone();
                                $template.find(".myImg").attr("src",'${pageContext.request.contextPath}/img/'+row[i].mypig);
                                $template.find(".uname").text(row[i].userName);
                                $template.find(".uaddr").text(row[i].city);
                                $template.find(".rankImg").attr("src",'${pageContext.request.contextPath}/img/rank/'+row[i].rank);
                                $template.find(".usign").text(row[i].sign);
                                $template.append("<input type='hidden' value='"+row[i].uid+"'/>");
                                $("#showUser").append($template);
                            }
                        }
                    }
                });
            }
        });
        
        $("#formsub").click(function () {
            var pageInfo = {
                param: $("#content").val(),
                pageIndex: 1,
                pageSize: 4,
                type: $("#type").val()
            }
             $.ajax({
                  url:"${pageContext.request.contextPath}/trip/getUserLogAddr",
                 data:pageInfo,
                 type:'get',
                 dataType:'json',
                 success:function(data){
                      console.log("totle="+data.totle);
                      //初始化一次分页组件
                     var demo = BootstrapPagination($("#demo1"), {
                         //记录总数。
                         total: data.totle,
                         //当前页索引编号。从其开始（从0开始）的整数。
                         pageIndex: 0,
                         //当分页更改后引发此事件。
                         pageChanged: function (pageIndex, pageSize) {
                             var pageInfo = {
                                 param: $("#content").val(),
                                 pageIndex: pageIndex+1,
                                 pageSize: pageSize,
                                 type: $("#type").val()
                             }
                             $.ajax({
                                 url: '${pageContext.request.contextPath}/trip/getUserLogAddr',
                                 type: 'get',
                                 dataType: 'json',
                                 data: pageInfo,
                                 success: function (data) {
                                     totle = data.totle;
                                     if(data.rows.length==0){
                                         $("#showUser").html("");
                                         $("#showUser").append("<div class='col-sm-4'></div><div class='col-sm-4'><span><h3>没有查到任何数据....</h3></span></div>");
                                     }else{
                                         var row=data.rows;
                                         $("#showUser").html("");
                                         for(var i in row) {
                                             var $template = $($("#showUserInfoTem").html()).clone();
                                             $template.find(".myImg").attr("src",'${pageContext.request.contextPath}/img/'+row[i].mypig);
                                             $template.find(".uname").text(row[i].userName);
                                             $template.find(".uaddr").text(row[i].city);
                                             $template.find(".rankImg").attr("src",'${pageContext.request.contextPath}/img/rank/'+row[i].rank);
                                             $template.find(".usign").text(row[i].sign);
                                             $template.append("<input type='hidden' value='"+row[i].uid+"'/>");
                                             $("#showUser").append($template);
                                         }
                                     }
                                 }
                             });
                         }
                     });
                     if(data.rows.length==0){
                         $("#showUser").html("");
                         $("#showUser").append("<div class='col-sm-4'></div><div class='col-sm-4'><span><h3>没有查到任何数据....</h3></span></div>");
                     }else{
                         var row=data.rows;
                         $("#showUser").html("");
                         for(var i in row) {
                             var $template = $($("#showUserInfoTem").html()).clone();
                             $template.find(".myImg").attr("src",'${pageContext.request.contextPath}/img/'+row[i].mypig);
                             $template.find(".uname").text(row[i].userName);
                             $template.find(".uaddr").text(row[i].city);
                             $template.find(".rankImg").attr("src",'${pageContext.request.contextPath}/img/rank/'+row[i].rank);
                             $template.find(".usign").text(row[i].sign);
                             $template.append("<input type='hidden' value='"+row[i].uid+"'/>");
                             $("#showUser").append($template);
                         }
                     }
                 }
             });
        });

    });
    $(document).on("click",".thumbnail",function(event){
         console.dir(event);
         //获取当前点击的div所对应的用户的id
         var id=$(this).parent().children("input").val();
         location.href="${pageContext.request.contextPath}/trip/getUserById/"+id;
    });


</script>
</body>

</html>