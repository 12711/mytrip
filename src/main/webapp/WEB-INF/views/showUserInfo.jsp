<%--
  Created by IntelliJ IDEA.
  User: LSM
  Date: 2017/2/4
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="index.jsp" %>
<html>
<head>
    <title>个人信息</title>
    <script src="${pageContext.request.contextPath}/ck/ckeditor/ckeditor.js"></script>
</head>
<body>
<style>
    .li_style {
        list-style-type: none
    }


</style>
<script>
    function changImg() {
        alert("确认要上传这张图片!");
    }
</script>
<div class="row " style="border:1px solid gray;border-bottom: none;margin-bottom: 20px;">
    <div class="col-sm-1"></div>
    <div class="col-sm-3 ">
        <ul>
            <li class="li_style"><h3>设置</h3></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/user/inter/showUserInfo">个人信息</a></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/evaluate/getEvaluateByPage/${userInfo.uid}">查看评论</a></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/orderScane/inter/getOrderScaneByidStatus/${userInfo.uid}">审批预约</a></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/orderScane/inter/getOrderScaneByPage/${userInfo.uid}">历史处理记录</a></li>
            <hr style="width: 150px;margin-left: 0px"/>
            <li class="li_style"><a href="${pageContext.request.contextPath}/orderScane/inter/getOrderScaneByPageykid/${userInfo.uid}">历史申请记录</a></li>
        </ul>
    </div>
    <div class="col-sm-8" style="margin-left: -30px">
        <div class="tabbable" id="tabs-637123">
            <ul class="nav nav-tabs" style="margin-top: 5px">
                <li class="active">
                    <a href="#panel-772339" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#panel-568572" data-toggle="tab">联系方式</a>
                </li>
                <li>
                    <a href="#panel-568573" data-toggle="tab">修改密码</a>
                </li>
            </ul>
            <div class="tab-content">

                <div class="tab-pane active" id="panel-772339" style="height: 300px">
                    <div class="col-sm-7">
                        <form action="${pageContext.request.contextPath}/user/inter/updateUserInfo" method="post">
                            <div class="col-sm-12" style="margin-top: 20px"><span>用户名</span><input class="form-control"
                                                                                                   type="text"
                                                                                                   name="userName"
                                                                                                   disabled
                                                                                                   value="${userInfo.userName}">
                            </div>
                            <div class="col-sm-12" style="margin-top: 20px"><span>真实姓名</span><input class="form-control"
                                                                                                    type="text"
                                                                                                    name="realName"
                                                                                                    disabled
                                                                                                    value="${userInfo.realName}">
                            </div>
                            <div class="col-sm-12" style="margin-top: 20px"><span>性别</span>

                                <select class="form-control" name="sex">
                                    <c:if test="${userInfo.sex=='男'}" var="t">
                                        <option value="男" selected>男</option>
                                        <option value="女">女</option>
                                    </c:if>
                                    <c:if test="${!t}">
                                        <option value="女" selected>女</option>
                                        <option value="男">男</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="col-sm-12" style="margin-top: 20px"><span>生日</span><input class="form-control"
                                                                                                  type="text"
                                                                                                  name="birthday"
                                                                                                  id="birthday"
                                                                                                  value="${userInfo.birthday}">
                            </div>
                            <div class="col-sm-12" style="margin-top: 20px">
                                <span>省</span>

                                <select class="form-control" id="province" name="province">

                                </select>

                                <span>市</span>

                                <select class="form-control" id="city" name="city">
                                    <option value="">--请选择市--</option>
                                </select>

                            </div>
                            <div class="col-sm-12" style="margin-top: 20px"><span>详细地址</span>
                                <input class="form-control" type="text" name="address"
                                       value="${userInfo.address}">
                            </div>
                            <div class="col-sm-12" style="margin-top: 20px"><span>工作地址</span><input class="form-control"
                                                                                                    type="text"
                                                                                                    name="workAddress"
                                                                                                    value="${userInfo.workAddress}">
                            </div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4" style="margin-top: 20px">
                                <input type="submit" class="btn btn-danger" value="修改">
                                <input type="reset" class="btn btn-primary" value="取消">
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-5" style="margin-top: 10px">
                        <div style="width: 126px;height: 126px;border-radius: 20px;border: 1px solid gray">
                            <img id="UserImg"
                                 style="height: 120px;width: 120px;margin-top: 2px;margin-left: 2px;border-radius: 20px"
                                 src="${pageContext.request.contextPath}/img/${userInfo.mypig}"/><br/>
                        </div>
                        <form style="margin-left: 20px" action="${pageContext.request.contextPath}/user/inter/changeImg"
                              method="post" enctype="multipart/form-data">
                            <input type="file" name="pig" id="sImgF"/>
                            <input type="submit" value="上传图片">
                        </form>
                    </div>
                </div>
                <div class="tab-pane" id="panel-568572" style="height: 300px">

                    <form action="${pageContext.request.contextPath}/user/inter/updateUserInfo" method="post">
                        <div class="row">
                        <div class="col-sm-12" style="margin-top: 20px;width: 400px"><span>手机</span>
                            <input class="form-control" type="text" name="phone"
                                   value="${userInfo.phone}">
                        </div>
                        <div class="col-sm-12" style="margin-top: 20px;width: 400px"><span>邮箱</span>
                            <input class="form-control" type="text" name="mail" value="${userInfo.mail}">
                        </div>
                        <div class="col-sm-12" style="margin-top: 20px;width: 400px"><span>固话</span>
                            <input class="form-control" type="text" name="filexPhone"
                                   value="${userInfo.filexPhone}">
                        </div>
                        <div class="col-sm-12" style="margin-top: 20px;width: 400px"><span>qq</span>
                            <input class="form-control" type="text" name="qq" value="${userInfo.qq}">
                        </div>
                        <div class="col-sm-12" style="margin-top: 20px;width: 400px"><span>sign</span>
                            <input class="form-control" type="text" name="sign" value="${userInfo.sign}">
                        </div>
                        </div>
                        <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-4" style="margin-top: 20px">
                            <input type="submit" class="btn btn-danger" value="修改">
                            <input type="reset" class="btn btn-primary" value="取消">
                        </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="panel-568573" style="height: 300px">
                    <form class="form-horizontal" id="pwdUpdate" role="form" style="margin-top: 20px"
                          action="/user/inter/updateuser" method="post">
                        <div class="form-group">
                            <label for="old" class="col-sm-2 control-label">请输入原来的密码:</label>
                            <div class="col-sm-10">
                                <input class="form-control" style="width:400px" type="password" id="old"
                                       placeholder="请输入原来密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new" class="col-sm-2 control-label">请输入新密码:</label>
                            <div class="col-sm-10">
                                <input type="text" style="width:400px" class="form-control" name="passWord" id="new"
                                       placeholder="请输入新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="button" id="updatepwd" class="btn btn-danger" value="修改">
                                <input type="reset" class="btn btn-primary" value="取消">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>

<script>
    //当用户选择照片是显示预览图
    $("#sImgF").change(function () {
        console.log($("#sImgF")[0].files[0]);
        var fileObject = $("#sImgF")[0].files[0];
        //重要步骤
        $("#UserImg")[0].src = URL.createObjectURL(fileObject);
    });

    $("#birthday").datetimepicker({
        minView: "month", //选择日期后，不会再跳转去选择时分秒
        format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式
        language: 'zh-CN', //汉化
        autoclose:true //选择日期后自动关闭
    });


    $(function () {
        var province = $("#province")[0];
        var city = $("#city")[0];
        //初始化省
        var provinces = new Array(new Option('--请选择省--', ''), new Option('辽宁', '辽宁'), new Option('吉林', '吉林'),
            new Option('黑龙江', '黑龙江'), new Option('河北', '河北'), new Option('山西', '山西'), new Option('陕西', '陕西'),
            new Option('山东', '山东'), new Option('安徽', '安徽'), new Option('江苏', '江苏'), new Option('浙江', '浙江'),
            new Option('河南', '河南'), new Option('湖北', '湖北'), new Option('湖南', '湖南'), new Option('江西', '江西'),
            new Option('台湾', '台湾'), new Option('福建', '福建'), new Option('云南', '云南'), new Option('海南', '海南'),
            new Option('四川', '四川'), new Option('贵州', '贵州'), new Option('广东', '广东'), new Option('甘肃', '甘肃'),
            new Option('青海', '青海'), new Option('北京', '北京'), new Option('天津', '天津'), new Option('上海', '上海'),
            new Option('重庆', '重庆'));
        for (var i in provinces) {
            province.options[i] = provinces[i];
        }
        //$("#city").val('${userInfo.city}');
        $("#province").val('${userInfo.province}');

        city.options[0] = new Option('${userInfo.city}', '${userInfo.city}');


        //保存市数组
        var citys = new Array();
        citys[0] = new Array(new Option('--请选择市--', ''));
        citys[1] = new Array(new Option('沈阳市', '沈阳市'), new Option('沈阳市', '沈阳市'), new Option('大连市', '大连市'), new Option('鞍山市', '鞍山市'),
            new Option('抚顺市', '抚顺市'), new Option('本溪市', '本溪市'), new Option('丹东市', '丹东市'), new Option('锦州市', '锦州市'),
            new Option('营口市', '营口市'), new Option('阜新市', '阜新市'), new Option('辽阳市', '辽阳市'), new Option('盘锦市', '盘锦市'),
            new Option('铁岭市', '铁岭市'), new Option('朝阳市', '朝阳市'), new Option('葫芦岛市', '葫芦岛市'));
        citys[2] = new Array(new Option('长春市', '长春市'), new Option('吉林市', '吉林市'), new Option('四平市', '四平市'), new Option('辽源市', '辽源市'),
            new Option('通化市', '通化市'), new Option('白山市', '白山市'), new Option('白城市', '白城市'), new Option('通化市', '通化市'),
            new Option('松原市', '松原市'));
        citys[3] = new Array(new Option('哈尔滨市', '哈尔滨市'), new Option('齐齐哈尔市', '齐齐哈尔市'), new Option('佳木斯市', '佳木斯市'), new Option('鹤岗市', '鹤岗市'),
            new Option('大庆市', '大庆市'), new Option('鸡西市', '鸡西市'), new Option('双鸭山市', '双鸭山市'), new Option('伊春市', '伊春市'),
            new Option('牡丹江市', '牡丹江市'), new Option('黑河市', '黑河市'), new Option('七台河市', '七台河市'), new Option('绥化市', '绥化市'), new Option('大兴安岭地区', '大兴安岭地区'));

        citys[4] = new Array(new Option('石家庄市', '石家庄市'), new Option('保定市', '保定市'), new Option('邯郸市', '邯郸市'), new Option('秦皇岛市', '秦皇岛市'),
            new Option('张家口市', '张家口市'), new Option('唐山市', '唐山市'), new Option('承德市', '承德市'), new Option('沧州市', '沧州市'),
            new Option('邢台市', '邢台市'), new Option('衡水市', '衡水市'), new Option('廊坊市', '廊坊市'));
        citys[5] = new Array(new Option('太原市', '太原市'), new Option('大同市', '大同市'), new Option('朔州市', '朔州市'), new Option('阳泉市', '阳泉市'),
            new Option('长治市', '长治市'), new Option('忻州市', '忻州市'), new Option('吕梁市', '吕梁市'), new Option('晋中市', '晋中市'),
            new Option('临汾市', '临汾市'), new Option('运城市', '运城市'), new Option('晋城市', '晋城市'));
        citys[6] = new Array(new Option('西安市', '西安市'), new Option('咸阳市', '咸阳市'), new Option('商洛市', '商洛市'), new Option('安康市', '安康市'),
            new Option('汉中市', '汉中市'), new Option('延安市', '延安市'), new Option('渭南市', '渭南市'), new Option('铜川市', '铜川市'),
            new Option('榆林市', '榆林市'));

        citys[7] = new Array(new Option('济南市', '济南市'), new Option('德州市', '德州市'), new Option('聊城市', '聊城市'), new Option('菏泽市', '菏泽市'),
            new Option('泰安市', '泰安市'), new Option('莱芜市', '莱芜市'), new Option('济宁市', '济宁市'), new Option('枣庄市', '枣庄市'),
            new Option('临沂市', '临沂市'), new Option('滨州市', '滨州市'), new Option('东营市', '东营市'), new Option('淄博市', '淄博市'),
            new Option('潍坊市', '潍坊市'), new Option('日照市', '日照市'), new Option('青岛市', '青岛市'), new Option('威海市', '威海市'),
            new Option('烟台市', '烟台市'));
        citys[8] = new Array(new Option('芜湖市', '芜湖市'), new Option('马鞍山市', '马鞍山市'), new Option('铜陵市', '铜陵市'), new Option('池州市', '池州市'),
            new Option('宣城市', '宣城市'), new Option('黄山市', '黄山市'), new Option('巢湖市', '巢湖市'), new Option('六安市', '六安市'),
            new Option('安庆市', '安庆市'), new Option('淮南市', '淮南市'), new Option('淮北市', '淮北市'), new Option('蚌埠市', '蚌埠市'),
            new Option('阜阳市', '阜阳市'), new Option('宿州市', '宿州市'), new Option('亳州市', '亳州市'), new Option('滁州市', '滁州市'));
        citys[9] = new Array(new Option('南京市', '南京市'), new Option('徐州市', '徐州市'), new Option('连云港市', '连云港市'), new Option('宿迁市', '宿迁市'),
            new Option('淮安市', '淮安市'), new Option('扬州市', '扬州市'), new Option('盐城市', '盐城市'), new Option('南通市', '南通市'),
            new Option('泰州市', '泰州市'), new Option('苏州市', '苏州市'), new Option('常州市', '常州市'), new Option('无锡市', '无锡市'),
            new Option('镇江市', '镇江市'));
        citys[10] = new Array(new Option('杭州市', '杭州市'), new Option('宁波市', '宁波市'), new Option('温州市', '温州市'), new Option('嘉兴市', '嘉兴市'),
            new Option('湖州市', '湖州市'), new Option('绍兴市', '绍兴市'), new Option('金华市', '金华市'), new Option('衢州市', '衢州市'),
            new Option('舟山市', '舟山市'), new Option('台州市', '台州市'), new Option('丽水市', '丽水市'));

        citys[11] = new Array(new Option('郑州市', '郑州市'), new Option('开封市', '开封市'), new Option('洛阳市', '洛阳市'), new Option('平顶山', '平顶山'),
            new Option('安阳市', '安阳市'), new Option('鹤壁市', '鹤壁市'), new Option('新乡市', '新乡市'), new Option('焦作市', '焦作市'),
            new Option('濮阳市', '濮阳市'), new Option('许昌市', '许昌市'), new Option('漯河市', '漯河市'), new Option('三门峡', '三门峡'),
            new Option('南阳市', '南阳市'), new Option('商丘市', '商丘市'), new Option('信阳市', '信阳市'), new Option('周口市', '周口市'),
            new Option('驻马店', '驻马店'), new Option('济源市', '济源市'));
        citys[12] = new Array(new Option('武汉市', '武汉市'), new Option('黄石市', '黄石市'), new Option('襄樊市', '襄樊市'), new Option('十堰市', '十堰市'),
            new Option('荆州市', '荆州市'), new Option('宜昌市', '宜昌市'), new Option('荆门市', '荆门市'), new Option('鄂州市', '鄂州市'),
            new Option('孝感市', '孝感市'), new Option('黄冈市', '黄冈市'), new Option('咸宁市', '咸宁市'), new Option('随州市', '随州市'),
            new Option('恩施市', '恩施市'), new Option('仙桃市', '仙桃市'), new Option('潜江市', '潜江市'), new Option('天门市', '天门市'),
            new Option('神农架林区', '神农架林区'));
        citys[13] = new Array(new Option('长沙市', '长沙市'), new Option('株洲市', '株洲市'), new Option('湘潭市', '湘潭市'), new Option('衡阳市', '衡阳市'),
            new Option('邵阳市', '邵阳市'), new Option('岳阳市', '岳阳市'), new Option('常德市', '常德市'), new Option('张家界市', '张家界市'),
            new Option('益阳市', '益阳市'), new Option('娄底市', '娄底市'), new Option('郴州市', '郴州市'), new Option('永州市', '永州市'),
            new Option('怀化市', '怀化市'));
        $("#province").change(function () {
            var index = province.selectedIndex;
            console.log("sfsdfsfdfsdfdsfd");
            city.options.length = 0;
            for (var i in citys[index]) {
                city.options[i] = citys[index][i];
            }
        });
        //用来记录是否能提交更改密码的标志;
        window.updatepwdflag = false;
        //检测输入的旧密码是否正确
        $("#old").change(function () {
            var oldPwd = '${userInfo.passWord}';
            var oldInput = $("#old").val();
            if (oldPwd === oldInput) {
                $("#old").css("border-color", "green");
                updatepwdflag = true;
            } else {
                updatepwdflag = false;
                $("#old").css("border-color", "red");
            }
        });
        $("#updatepwd").click(function () {
            if (window.updatepwdflag) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/inter/updateuser',
                    data: $("#pwdUpdate").serialize(),
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        if('1'===data){
                            alert("修改成功!请重新登录!");
                            location.href='${pageContext.request.contextPath}/user/index';
                        }
                    }

                });
            } else {
                   alert("原密码不正确或者你的新密码格式不正确~!");
            }
        });

    });


</script>

</body>
</html>
