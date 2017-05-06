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
                        href="#">返回相册列表</a></div>
            </div>
            <div class="col-sm-12" style="margin-top: 20px" id="albunBtn">
                <div class="col-sm-4"><a href="#modal-container-907337" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span>新建相册</a></div>

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
                <div class="col-sm-4"><a  href="${pageContext.request.contextPath}/img/toUploadPic" data-toggle="modal"><span class="glyphicon glyphicon-picture"></span>添加照片</a></div>
                <div class="col-sm-4"><a  href="javascript:void(0)" id="batchDelete"><span class="glyphicon glyphicon-picture"></span>批量删除相册</a></div>
                </div>
        </div>
          <div class="row" style="margin-top: 20px" id="albumList">
             <c:forEach items="${albums}" var="album">
              <div class="col-sm-2" style="margin-top:20px;" id="${album.id}">
                  <c:if test="${album.cover==null}" var="t">
                  <a href="${pageContext.request.contextPath}/img/showImg/${album.id}" title="${album.desc}">
                  <img style="height: 150px;width: 150px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/img/my.gif" title="${album.desc}"/><br/>
                  <span style="margin-left: 50px">${album.name}</span>
                  </a>
                  </c:if>
                  <c:if test="${!t}">
                      <a href="${pageContext.request.contextPath}/img/showImg/${album.id}" title="${album.desc}">
                          <img style="height: 150px;width: 150px;border-radius: 2px;border: #3a9d9a 3px solid;" src="${pageContext.request.contextPath}/album/${album.cover}" title="${album.desc}"/><br/>
                          <span style="margin-left: 50px">${album.name}</span>
                      </a>
                  </c:if>
                  <input type="checkbox" value="${album.id}" class="albumCheck"  style="display: none;position: absolute;z-index: 100;top: 5px;left: 145px;">
                  <a href="#update${album.id}" title="修改相册" data-toggle="modal"><span class="glyphicon glyphicon-list-alt" style="position: absolute;z-index: 100;top: 10px;left: 20px;"></span></a>
                      <div class="modal fade"  id="update${album.id}" aria-hidden="true" role="dialog" aria-labelledby="myModalLabel2">
                          <div class="modal-dialog">
                              <div class="modal-content" style="min-height: 400px;">
                                  <div class="modal-header">
                                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                      <h4 class="modal-title" >
                                          修改相册信息
                                      </h4>
                                  </div>
                                  <div class="modal-body">
                                      <form action="${pageContext.request.contextPath}/album/updateAlbum"  method="post" id="updateAlbum">
                                          <input type="hidden" value="${album.id}" name="id">
                                          <div >
                                              <label for="title" class="col-sm-2 control-label">标题</label>
                                              <div class="col-sm-10 ">
                                                  <input type="text" class="form-control" name="name" required="required" id="title" value="${album.name}" />
                                              </div>
                                          </div>
                                          <div >
                                              <label for="desc" style="margin-top: 20px" class="col-sm-2 control-label">相册描述</label>
                                              <div class="col-sm-10 " style="margin-top: 20px">
                                                  <input type="text" class="form-control" name="desc" required="required" id="desc" value="${album.desc}" />
                                              </div>
                                          </div>

                                          <div class="row" >
                                              <div class="col-md-3"></div>
                                              <div class="col-md-6">
                                                  <button style="margin-top:20px;" type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit"  style="margin-top:20px;" id="albumupdatebtn" class="btn btn-primary">修改</button>
                                              </div>
                                              <div class="col-md-3"></div>
                                          </div>

                                      </form>
                                  </div>

                              </div>
                          </div>
                      </div>
              </div>
             </c:forEach>
          </div>
        <div id="albumAction" style="display: none;margin-top: 20px" >
            <input type="button"  class="btn btn-danger" id="deleteAlbums" value="删除">
            <input type="button" class="btn btn-warning" id="cacleAlbums" value="取消">
        </div>
    </div>
<script>
    $(function () {
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
                    location.href="${pageContext.request.contextPath}/album/inter/getAlbums";
                    },
                error:function(errorInfo){
                    alert("新建失败");
                    console.log(errorInfo);
                }
            });
        });
       window.flag=false;
        $("#batchDelete").click(function () {
            if(!window.flag){
                $(".albumCheck").css("display","block");
                $("#albumAction").css("display","block");
                window.flag=true;
            }else{
                $(".albumCheck").css("display","none");
                $("#albumAction").css("display","none");
                window.flag=false;
            }


        });
        
        //批量删除相册
        $("#deleteAlbums").click(function () {
            var albums=$(".albumCheck:checked");
            var ids="";
            console.log("length==="+albums.length)
            for(var i=0 ; i<albums.length;i++){
                var id=$(albums[i]).val();
                ids+=id+",";
            }
       console.log("ids==="+ids)
            $.ajax({
                url:"${pageContext.request.contextPath}/album/batchDeleteAlbum",
                data:{ids:ids},
                dataType:"json",
                type:"post",
                success:function(data){
                    console.log(data);
                    if(data[1]==="0"){
                        alert("删除出现问题,部分相册已被删除!")
                    }else{
                        var idss=data[0].split(",");
                        console.log(idss);
                        for(var id in idss){
                            var aid=idss[id];
                            console.log("aid=="+aid);
                            console.log($("#"+aid));
                            $("#"+aid).remove();
                        }


                    }
                }
            });
        });

        $("#albumupdatebtn").click(function () {
            var data=$("#updateAlbum").serialize();

        });

  
    });
   
   
</script>

</body>
<%@ include file="footer.jsp"%>
</html>
