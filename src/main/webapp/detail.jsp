<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详情页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body>
    <div id="detail-wrapper">
        <div class="display">
            <span class="orageBtn goBack" id="goBack"><a href="">返回</a></span>
            <div class="hd">丈八东路 电子城 高新 融侨馨苑 三室精装全配 拎包入住</div>
            <div class="bd">
                <div class="picDiv"><img src="static/images/u136.png"></div>
                <div class="contentDiv">
                    <div class="dis-price"><span>3500</span>元/月</div>
                    <div class="dis-text">
                        <div class="tip">房屋类型：</div>
                        <div>3室2厅2卫</div>
                        <div>115平</div>
                        <div>精装修</div>
                    </div>
                    <div class="dis-text">
                        <div class="tip">朝向楼层：</div>
                        <div>南北</div>
                        <div>8层/共18层</div>
                    </div>
                    <div class="dis-text">
                        <div class="tip">所在小区：</div>
                        <div>荣侨紫薇欣苑</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="distribution">
            <div class="hd">房源描述</div>
            <div class="bd">
                <div class="contentDiv">
                    <p style="color: #555555;font-size: 15px;font-weight: 500">太奥广场精装LOFT

                    朋友，您好！欢迎光临我的店铺，如果您正在为找房而犯愁，您的贴心顾问正在等着您！——张萌，我的服务宗旨是“诚信、专业、负责、用心珍惜您的每一分钱”

                    一、房源优势
                    1、格局方正，使用率超赞

                    2.LOFT结构，上下两层设计，动静分离

                    3两用型，您可一楼办公，二楼住人，惬意之选，再合适不过了

                    4.位置好，视线好，一眼望去，整个太奥广场尽收眼底

                    三、社区介绍繁华商业街，让您吃喝玩乐不发愁

                    四、交通介绍紧邻二环，出行方便，数条公交通往全城

                    随时可以免费带您看房，欢迎您的来电
                    </p>
                </div>
                <div>
                    <img src="static/images/u142.jpg">
                </div>
            </div>
        </div>
    </div>
<script>
    $("#goBack").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>