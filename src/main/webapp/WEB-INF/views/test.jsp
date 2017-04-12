<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.css"></link>
    <script src="${pageContext.request.contextPath}/bootstrappage/bootstrap-pagination.min.js"></script>
</head>
<body style="background-color: #f2f2f2">
<div class="container">
    <div class="row" style="margin-left: -50px;margin-top: 20px;">
        <form action="${pageContext.request.contextPath}/trip/toSearch" method="get" id="dizhuform">
            <div class="btn-group btn-group-lg col-sm-8"
                 style="margin-left: 23px;">

                <select class="btn btn-default" style="font-size: 17px;height: 40px;"
                        name="type">
                    <option value="p">地主</option>
                    <option value="c">日志</option>
                    <option value="d">地区</option>
                </select>
                <input type="text" class="btn btn-default" style="height: 40px;"
                       name="content">
                <button style="height: 40px;width: 45px;margin-left: 10px;background-color:#3A9D9A;border: none">
                    <span class="glyphicon glyphicon-search"
                          style="font-size: large;color: white"></span>
                </button>

            </div>
        </form>
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
        <img alt="300x200" style="width:120px;height:120px" src="" />
        <div class="caption">
            <span>用户名:</span><h3 style="margin-left:10px;display:inline-block"></h3>
            <br/>
            <span>信用等级:</span><img src="">
            <br/>
            <br/>
            <span>个性签名:</span><lable></lable>
        </div>
    </div>
</div>
</script>

<script>


    $(function () {
        window.totle = '${totle}' * 1;
        var demo = BootstrapPagination($("#demo1"), {
            //记录总数。
            total: window.totle,
            //当前页索引编号。从其开始（从0开始）的整数。
            pageIndex: 1,
            //当分页更改后引发此事件。
            pageChanged: function (pageIndex, pageSize) {
                var pageInfo = {
                    param: "l",
                    pageIndex: pageIndex,
                    pageSize: pageSize,
                    type: 'p'
                }
                $.ajax({
                    url: '${pageContext.request.contextPath}/trip/getUserLogAddr',
                    type: 'get',
                    dataType: 'json',
                    data: pageInfo,
                    success: function (data) {
                        totle = data.totle;
                        if(data.rows==null){
                            $("#showUser").html("");
                            $("#showUser").append("<div class='col-sm-4'></div><div class='col-sm-4'><span><h3>没有查到任何地主....</h3></span></div>");
                        }else{
                            var row=data.rows;
                            $("#showUser").html("");
                            for(var i in row) {
                                var $template = $($("#showUserInfoTem").html()).clone();
                                console.log("-----");
                                console.dir($template.children().children("img"))
                                $template.children().children("img").attr("src",'${pageContext.request.contextPath}/img/'+row[i].mypig);
                                $template.children().children("div").children("h3").text(row[i].userName);
                                $template.children().children("div").children("img").attr("src",'${pageContext.request.contextPath}/img/rank/'+row[i].rank);
                                $template.children().children("div").children("lable").text(row[i].sign);
                                $template.append("<input type='hidden' value='"+row[i].uid+"'/>");
                                $("#showUser").append($template);
                            }
                        }
                    }
                });
            }
        });

    });
    $(document).on("click",".thumbnail",function(event){
         console.dir(event);
         //获取当前点击的div所对应的用户的id
         var id=$(this).parent().children("input").val();
         $.ajax({
             url:"${pageContext.request.contextPath}/user/"+id,
             type:'get',
             dataType:'json',
             success:function (data) {
                 console.log(data);
             }
         });
    });
    

</script>
</body>

</html>