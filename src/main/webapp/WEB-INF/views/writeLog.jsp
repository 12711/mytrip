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
    <script src="${pageContext.request.contextPath}/ck/ckeditor/ckeditor.js"></script>
        <%--<script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>--%>
   <title>写日志</title>

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
            <img style="height: 120px;width: 120px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/img/my.gif">
        </div>
        <div class="col-sm-8" style="margin-left: 30px" id="headtitle">
            <div class="row">
                <div class="col-sm-6"><span id="username" style="font-size: 20px">~陌生人甲~</span></div>
            </div>
            <div class="row" >
                <div class="col-sm-6"><label>信誉等级:</label>~等级高~</div>
            </div>
            <div class="row" >
                <div class="col-sm-12"><label>签名:</label>~做事之前将所有的流程先弄清楚将会事半功倍~</div>
            </div>
        </div>
    </div>
        <form action="${pageContext.request.contextPath}/log/newlog" method="post" onsubmit="return isNull()">
    <%--日志主题部分--%>
    <div class="row" style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
        <div class="col-sm-2" style="margin-left: 50px;"><span style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>日志</h3></span></div>
        <div class="col-sm-7 ">
             <label class="col-sm-2" style="margin-top: 16px" >请输入标题:</label>
            <div class="col-sm-8" style="margin-top: 10px">
                <input class="form-control" type="text" name="title" id="logtitle">
            </div>
        </div>
        <div class="col-sm-2 .hidden-md" style="margin-top: 20px"><a href="${pageContext.request.contextPath}/log/inter/logList">返回日志列表</a></div>
    </div>
    <%--编辑区域--%>
            <div class="adjoined-bottom">
                <div class="grid-container">
                    <div class="grid-width-100">

                            <textarea id="editor" name="log">
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </textarea>
                               <script type="text/javascript">
                                  var ckeditor= CKEDITOR.replace("log");
                               </script>
                              <button  type="submit" class="btn-danger">提交</button>
                              <button  type="reset" class="btn-warning">取消</button>

                    </div>
                </div>
            </div>
        </form>
</div>
<%@include file="footer.jsp"%>
</body>
<script>
    function  isNull() {
        var logTitle=$("#logtitle").val();
        var content=$("#editor").val();
        console.log(typeof logTitle);
        console.log(typeof content);
        if(logTitle===""){
            $("#logtitle").css("border-color","red");

            return false;
        }
        if(content===""){
            $("#editor").css("border-color","red");
            return false;
        }
        return true&&window.flag1;
    }
    $(function(){
          $("#submit").click(function(){
              console.dir($("#editor"))
          });

         $("#test").click(function(){
             console.dir(CKEDITOR.instances);

            var contnet=CKEDITOR.instances.dis_content.getData();
            console.log("content"+contnet);
        });
    });
</script>
</html>
