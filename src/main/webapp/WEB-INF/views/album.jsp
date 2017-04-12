<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/3/30
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<html>
<head>
    <title>我的相册</title>
    <style>
        #albunBtn a{
            height: 23px;
            font-size: 30px;
            width: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">

            <div class="col-sm-12"
                 style="margin-top: 20px;color: #2e6da4;background-color: #fffbe4">
                <div class="col-sm-2" style="margin-left: 50px;"><span
                        style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>我的相册</h3></span>
                </div>
                <div class="col-sm-7 "></div>
                <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                        href="#">返回日志列表</a></div>
            </div>
            <div class="col-sm-7" style="margin-top: 20px" id="albunBtn">
                <div class="col-sm-5"><a href="#modal-container-907337" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>新建相册</a></div>

                <%--新建相册弹窗--%>
                <div class="modal fade" id="modal-container-907337" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">
                                    新建相册
                                </h4>
                            </div>
                            <div class="modal-body">
                               <form id="albumFrom">
                                <div class="row" style="margin-top: 20px">
                                    <label class=" col-sm-2">相册名:</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="name" id="name">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <label class=" col-sm-2">描述:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" style="width: 468px;" name="desc">
                                        </textarea>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <label class=" col-sm-2">类别:</label>
                                    <div class="col-sm-10">
                                        <select name="type" class="form-control">
                                            <option value="fj" selected>风景</option>
                                            <option value="rw">人物</option>
                                            <option value="dw">动物</option>
                                            <option value="yj">游记</option>
                                            <option value="sh">生活</option>
                                        </select>
                                    </div>
                                </div>
                               </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" id="albumSubmit" class="btn btn-primary">提交</button>
                            </div>

                        </div>

                    </div>

                </div>
                <div class="col-sm-5"><a  href="${pageContext.request.contextPath}/img/toUploadPic" data-toggle="modal"><span class="glyphicon glyphicon-picture"></span>添加照片</a></div>

                </div>
        </div>
          <div class="row" style="margin-top: 20px" id="albumList">
             <c:forEach items="${albums}" var="album">
              <div class="col-sm-2" style="margin-top:20px;">
                  <c:if test="${album.cover==null}" var="t">
                  <a href="${pageContext.request.contextPath}/img/showImg/${album.id}">
                  <img style="height: 150px;width: 150px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/img/my.gif"/><br/>
                  <span style="margin-left: 50px">${album.name}</span>
                  </a>
                  </c:if>
                  <c:if test="${!t}">
                      <a href="${pageContext.request.contextPath}/img/showImg/${album.id}">
                          <img style="height: 150px;width: 150px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/album/${album.cover}"/><br/>
                          <span style="margin-left: 50px">${album.name}</span>
                      </a>
                  </c:if>
              </div>
             </c:forEach>
          </div>
    </div>
<script>
   $("#albumSubmit").click(function(){
       var value=$("#name").val();
       if(value===''){
           $("#name").css("border-color",'red');
           return;
       }
          var data=$("#albumFrom").serialize();
          var url="${pageContext.request.contextPath}/album/inter/createAlbum";
          console.log(url);
          $.ajax({
              url:url,
              data:data,
              dataType:'json',
              type:'get',
              success:function(info){
                  alert("新建相册成功");
                  $('#modal-container-907337').modal('hide');
                  $("#albumList").append("<div class='col-sm-2'><img style='margin-top:20px;height: 150px;width: 150px;border-radius: 2px;border: #3a9d9a 3px solid;' src='${pageContext.request.contextPath}/img/my.gif'><br/><span style='margin-left:50px'>"+$("#name").val()+"</span></div>");
              },
              error:function(errorInfo){
                  alert("新建失败");
                 console.log(errorInfo);
              }
          });
   });
</script>

</body>
<%@ include file="footer.jsp"%>
</html>
