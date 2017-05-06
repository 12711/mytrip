<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/4/6
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>编辑景点</title>
    <script src="${pageContext.request.contextPath}/ck/ckeditor/ckeditor.js"></script>
</head>
<body>

        <div class="row" style="margin-top: 20px">
            <div class="col-md-1 hidden-sm"></div>
            <div class="col-md-7">
                <form role="form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/scane/inter/addScaner" method="post" onsubmit="return scaneisnull()">
                    <div class="form-group">
                        <label for="sName">景点名</label>
                        <input type="text" class="form-control" required name="sName" id="sName"/>
                    </div>
                    <div class="form-group">
                        <label for="sImgF">图片</label>
                        <input type="file" name="sImgF" required id="sImgF"/>
                    </div>
                    <div class="form-group">
                        <label for="address">简单描述</label>
                        <input type="text" class="form-control" required name="shortDesc" id="shortDesc"/>
                    </div>
                    <div class="form-group">
                        <label for="introduce">景点介绍<small style="font-weight:100">(请注意排版)</small></label>
                        <input type="text" class="form-control" id="introduce1"/>
                        <div id="introduceTest" style="display: none">
                            <textarea  name="introduce" id="introduce" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">具体地址</label>
                        <input type="text" class="form-control" required name="address" id="address"/>
                    </div>
                    <div class="form-group">
                        <label for="ticket">门票信息<small style="font-weight:100">(请注意排版)</small></label>
                        <input type="text" class="form-control" id="ticket1"/>
                        <div id="ticketTest" style="display: none">
                        <textarea  name="ticket" id="ticket" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="favourable">优惠政策<small style="font-weight:100">(请注意排版)</small></label>
                        <input type="text" class="form-control"  id="favourable1"/>
                        <div id="favourableTest" style="display: none">
                        <textarea name="favourable" id="favourable" required></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="opentime">开放时间<small style="font-weight:100">(请注意排版)</small></label>
                        <input type="text" class="form-control"  id="opentime1"/>
                        <div id="opentimeTest" style="display: none">
                           <textarea name="opentime" id="opentime" required></textarea>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-default">Submit
                    </button>
                </form>
            </div>
            <div class="col-md-4 hidden-sm" >
                <div style="height: 400px;width: 400px;overflow: hidden;margin-top: 20px">
                    <span>图片预览</span><br/>
                <img id="scaneImg" style="max-width: 400px;max-height: 400px;width: 70%;height: 70%">
                </div>
            </div>
        </div>

</div>
<script type="text/javascript">
    var ckeditor1= CKEDITOR.replace("ticket");
    var ckeditor2= CKEDITOR.replace("favourable");
    var ckeditor3= CKEDITOR.replace("opentime");
    var ckeditor4= CKEDITOR.replace("introduce");

    $("#ticket1").click(function () {

        $("#ticketTest").css("display",'block');
        $("#ticket1").css("display",'none')
    });

    $("#introduce1").click(function () {

        $("#introduceTest").css("display",'block');
        $("#introduce1").css("display",'none')
    });
    $("#favourable1").click(function () {

        $("#favourableTest").css("display",'block');
        $("#favourable1").css("display",'none')
    });
    $("#opentime1").click(function () {

        $("#opentimeTest").css("display",'block');
        $("#opentime1").css("display",'none')
    });
  //当用户选择照片是显示预览图
    $("#sImgF").change(function(){
      console.log($("#sImgF")[0].files[0]);
      var fileObject=$("#sImgF")[0].files[0];
      //重要步骤
      $("#scaneImg")[0].src=URL.createObjectURL(fileObject);
      $("#scaneImg")[0].title=fileObject.name;
    });

    function scaneisnull() {
        if(ckeditor1.getData()===""||ckeditor2.getData()===""||ckeditor3.getData()===""||ckeditor4.getData()===""){
            swal("错误","请填写所有的信息","error");
            return false;
        }
        return true;
    }
</script>
</body>
<%@ include file="footer.jsp" %>
</html>
