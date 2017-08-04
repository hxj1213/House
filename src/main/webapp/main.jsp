<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body>
    <div id="list-wrapper">
        <div class="search">
            <div class="condition">
                <label>位置：</label>
                <input type="hidden">
                <ul>
                    <li class="select"><a href="">不限</a></li>
                    <li><a href="">莲湖</a></li>
                    <li><a href="">新城</a></li>
                </ul>
            </div>
            <div class="condition">
                <label>方式：</label>
                <input type="hidden">
                <ul>
                    <li class="select"><a href="">不限</a></li>
                    <li><a href="">整租</a></li>
                    <li><a href="">合租</a></li>
                    <li><a href="">短租</a></li>
                </ul>
            </div>
            <div class="condition">
                <label>租金：</label>
                <input type="hidden">
                <ul>
                    <li class="select"><a href="">不限</a></li>
                    <li><a href="">500以下</a></li>
                    <li><a href="">500-1000元</a></li>
                    <li><a href="">1000-1500元</a></li>
                    <li><a href="">1500-2000元</a></li>
                    <li><a href="">2000-3000元</a></li>
                    <li><a href="">3000以上</a></li>
                </ul>
            </div>
            <div class="condition">
                <label>房型：</label>
                <input type="hidden">
                <ul>
                    <li class="select"><a href="">不限</a></li>
                    <li><a href="">一室</a></li>
                    <li><a href="">二室</a></li>
                    <li><a href="">三室</a></li>
                    <li><a href="">四室</a></li>
                    <li><a href="">五室</a></li>
                    <li><a href="">五室以上</a></li>
                </ul>
            </div>
        </div>
        <div class="article">
            <div class="hd">
                <div class="caption-text">
                    <span>出租信息列表</span>
                    <span class="orageBtn" id="postBtn"><a href="javascript:;">发布信息</a></span>
                </div>
            </div>
            <div class="houseinfo">
                <div class="every-house">
                    <div class="dis-pic"><img src="static/images/u40.png"></div>
                    <div class="dis-text">
                       <div class="dis-title">丈八东路 电子城 高新 融侨馨苑 三室精装全配 拎包入住</div>
                       <div class="dis-info">
                           <span>3室2厅2卫</span> <span>115m²</span>
                       </div>
                       <div class="dis-info"><span>融侨紫微新苑</span></div>
                    </div>
                    <div class="dis-price"><span>3500</span>元/月</div>
                </div>
                <div class="every-house">
                    <div class="dis-pic"><img src="static/images/u40.png"></div>
                    <div class="dis-text">
                        <div class="dis-title">丈八东路 电子城 高新 融侨馨苑 三室精装全配 拎包入住</div>
                        <div class="dis-info">
                            <span>3室2厅2卫</span> <span>115m²</span>
                        </div>
                        <div class="dis-info"><span>融侨紫微新苑</span></div>
                    </div>
                    <div class="dis-price"><span>3500</span>元/月</div>
                </div>
            </div>
            <div class="pageinfo">
                <ul>
                    <li class="pageitem prev"><a href="">&lt;上一页</a></li>
                    <li class="pageitem current"><a href="">1</a></li>
                    <li class="pageitem"><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li><a href="">6</a></li>
                    <li><a href="">7</a></li>
                    <li><a href="">8</a></li>
                    <li><a href="">9</a></li>
                    <li><a href="">10</a></li>
                    <li class="next"><a href="">下一页&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
<script>
    $("#postBtn").click(function () {

        window.location.href = "${pageContext.request.contextPath}/post.jsp";
    })
</script>
</body>
</html>