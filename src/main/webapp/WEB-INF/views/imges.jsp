<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp"%>
<html>
<head>

    <title>图片上传示例</title>
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
        $(function () {
            var $ = jQuery,
                $list = $('#fileList'),
                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,
                // 缩略图大小
                thumbnailWidth = 90 * ratio,
                thumbnailHeight = 90 * ratio,

                // Web Uploader实例
                uploader;
            uploader = WebUploader.create({
                // 选完文件后，是否自动上传。
                auto: false,

                disableGlobalDnd: true,
                // swf文件路径
                swf: '${pageContext.request.contextPath}/upload/Uploader.swf',

                // 文件接收服务端。
                server: '${pageContext.request.contextPath}/img/upload',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#filePicker'
                },

                //只允许选择图片
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });

            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var $li = $(
                        '<div onmouseover="over(this)" onmouseout="out(this)"  id="' + file.id + '" class="cp_img" style="curosr: pointe;">' +
                        '<img " >' +
                        '<div class="cp_img_jian1" style="cursor: pointer;display: none" ><span style="margin-top: -90px;margin-left: 65px" class="glyphicon glyphicon-trash"></span></div>' +
                        '<div class="showIfo" style="display: none" ><span style="margin-top:-70px;margin-left:26px;font-size: xx-large;color: green"class="glyphicon glyphicon-ok"></span></div>' + '</div>'
                    ),
                    $img = $li.find('img');


                // $list为容器jQuery实例
                $list.append($li);

                // 创建缩略图
                // 如果为非图片文件，可以不用调用此方法。
                // thumbnailWidth x thumbnailHeight 为 100 x 100
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }

                    $img.attr('src', src);
                }, thumbnailWidth, thumbnailHeight);
            });

            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress span');
                // 避免重复创建
                if (!$percent.length) {
                    $li.find("img").eq(0).after('<p class="progress" style="position: relative;top: 5px;background-color: #0088ff"><span></span></p>');
                    $percent = $(".progress").find('span');
                }
                sleep(1000);
                $percent.css('width', percentage * 100 + '%');
            });

            function sleep(numberMillis) {
                var now = new Date();
                var exitTime = now.getTime() + numberMillis;
                while (true) {
                    now = new Date();
                    if (now.getTime() > exitTime)
                        return;
                }
            }

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on('uploadSuccess', function (file, response) {
                console.log("00000000000=" + $('#' + file.id).children(".showIfo"));
                $('#' + file.id).children(".showIfo").css('display', 'block');
            });

            // 文件上传失败，显示上传出错。
            uploader.on('uploadError', function (file) {
                var $li = $('#' + file.id),
                    $error = $li.find('div.error');

                // 避免重复创建
                if (!$error.length) {
                    $error = $('<div class="error"></div>').appendTo($li);
                }

                $error.text('上传失败');
            });

            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on('uploadComplete', function (file) {
                $('#' + file.id).find('.progress').remove();
            });

            //所有文件上传完毕
            uploader.on("uploadFinished", function () {
                //提交表单

            });

            //开始上传
            $("#ctlBtn").click(function () {

                var list = $(".cp_img");
                console.dir("-----------")
                console.dir(list)

                var albumName = $("#toAlbum1").val();
                console.log(typeof albumName);
                console.log("000000" + albumName);
                if (albumName === "") {
                    alert("请选择相册!");
                    $("#toAlbum1").css('border-color', 'red');
                    return;
                }
                uploader.options.formData.uid = albumName;
                uploader.upload();
            });


            //执行删除方法
            $list.on("click", ".cp_img_jian1", function () {
                var Id = $(this).parent().attr("id");
                uploader.removeFile(uploader.getFile(Id, true));
                $(this).parent().remove();
            });

        });


    </script>
</head>
<body style="background-color: lightgrey">
<!--dom结构部分-->
<%--日志主题部分--%>
<div class="container" style="min-height: 500px">
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10"
             style="margin-top: 20px;color: #a48712;background-color: #ebe3bc">
            <div class="col-sm-2" style="margin-left: 50px;"><span
                    style="text-shadow: 1px 1px 1px rgba(0,0,0,.2);font-size: 20px;"><h3>相册</h3></span>
            </div>
            <div class="col-sm-7 "></div>
            <div class="col-sm-2 hidden-md" style="margin-top: 20px"><a
                    href="${pageContext.request.contextPath}/album/inter/getAlbums">返回相册列表</a></div>
        </div>
        <div class="col-sm-1"></div>
    </div>

    <div class="row" >
        <div class="col-lg-1"></div>
        <div class="col-sm-10" style="background-color: white;min-height: 300px" >
            <div class="row" style="margin-top: 20px">
                <div class="col-sm-2"><span style="margin-top: 10px">上传到:</span>
                </div>
                <div class="col-sm-2" style="margin-left: -50px;">
                    <select id="toAlbum1" class="form-control"
                            style="width: 100px;margin-top: -5px;">
                        <c:forEach items="${albums}" var="album">
                            <option value="${album.id}">${album.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-4">
                    <button id="ctlBtn" class="btn btn-info"
                            style="margin-top: -5px">开始上传
                    </button>
                </div>
                <div class="col-sm-4" id="filePicker" style="margin-top: -18px">
                    <span class="btn btn-info">继续添加</span>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div id="fileList">

                </div>
                <%--<div class="cp_img_jia" id="filePicker"
                     style="width: 100px;height: 50px"><img
                        style="margin-top: -5px"
                        src="${pageContext.request.contextPath}/img/add.png">
                </div>--%>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
</div>
</body>
<script>
    function over(obj) {
        $(obj).children("div").eq(0).css('display', 'block');
    }
    function out(obj) {
        $(obj).children("div").eq(0).css('display', 'none');
    }


</script>
</html>