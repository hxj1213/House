<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详情页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/imgscroll.css" >
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body>
<%@include file="login.jsp"%>
    <div id="detail-wrapper">
        <div class="display">
            <span class="orageBtn goBack" id="goBack"><a href="javascript:;">返回</a></span>
            <div class="hd">${house.houseTitle}</div>
            <div class="bd">
                <div class="picDiv">
                    <img id="bigpic" src="${house.housepic}">
                    <div class="small-img" >
                        <ul id="small-wrap" class="small-wrap f-clear" data-role="thumbs" style="left: 0px;">
                        </ul>
                        <div class="basic-imgs-btn prev" data-role="arrow"><a title="" href="#" class="btn-prev">&lt;</a></div>
                        <div class="basic-imgs-btn next" data-role="arrow"><a title="" href="#" class="btn-next">&gt;</a></div>
                    </div>
                </div>
                <div class="contentDiv">
                    <div class="dis-price"><span>${house.price}</span>元/月</div>
                    <div class="dis-text">
                        <div class="tip">房屋类型：</div>
                        <div>${house.room}室${house.hall}厅${house.toilet}卫</div>
                        <div>${house.houseArea}平</div>
                        <c:set var="id" value=" ${house.decorate}"></c:set>
                        <div>${decorate[fn:trim(id)]}</div>
                        <c:set var="id" value=" ${house.houseType}"></c:set>
                        <div>${houseType[fn:trim(id)]}</div>
                    </div>
                    <div class="dis-text">
                        <div class="tip">朝向楼层：</div>
                        <c:set var="id" value=" ${house.direction}"></c:set>
                        <div>${direction[fn:trim(id)]}</div>
                        <div>${house.floor}层/共${house.allfloor}层</div>
                    </div>
                    <div class="dis-text">
                        <div class="tip">所在小区：</div>
                        <div>${house.houseEstate}</div>
                    </div>
                    <div class="dis-text">
                        <div class="tip">房间配置：</div>
                        <div style="width: 380px">
                            <c:forEach items="${fn:split(house.configure,',')}" var="config">
                                ${configure[config]}
                            </c:forEach>
                        </div>
                    </div>
                    <br>
                    <div class="dis-text">
                        <div class="tip">押付方式：</div>
                        <c:set var="id" value=" ${house.payType}"></c:set>
                        <div>${payType[fn:trim(id)]}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="distribution">
            <div class="hd">房源描述</div>
            <div class="bd">
                <div class="contentDiv" id="houseDetail">
                    ${house.houseDetail}
                </div>
            </div>
        </div>
    </div>
<script>

    var imageCount = 0;

    $(document).ready(function () {
        var detail = $("#houseDetail").html()
        var imgPaths = [];
        var re = /src="http:\/\/localhost:8080\/hotel\/attached([^"]*)"/g;
        while (arr = re.exec(detail)) {
            //alert(arr[1]);
            imgPaths.push(arr[1])
        }
        var title = $(".hd").html()
        imageCount = imgPaths.length;
        //(imgPaths.length<=5?imgPaths.length:5)
        for(var i = 0;i<imgPaths.length;i++){
            var path = "/hotel/attached"+imgPaths[i];
            var content = "<li class='small-item' data-index='"+i+"' data-image='"+path+"'><a href='javascript:;'><img alt='"+title+"' src='"+path+"'> </a> </li>"
            $(".small-wrap").append(content)
        }

        $(".small-item").first().addClass("active")

        /*<li class='small-item' data-index='0' data-image='http://tct3.ganjistatic1.com/gjfsqq/28ac2b9177854a3e9f45ff1057fcaf09_540-405_9-0.jpg' data-link='http://tct3.ganjistatic1.com/gjfsqq/28ac2b9177854a3e9f45ff1057fcaf09_600-450_9-0.jpg' data-role='thumb'>
            <a href='javascript:;'>
            <img class='small-pic' alt='拎包入住，交通便利，商圈繁华，环境优雅，照片真实' title='拎包入住，交通便利，商圈繁华，环境优雅，照片真实' gjalog='100000002167000100000010' src='http://tct3.ganjistatic1.com/gjfsqq/28ac2b9177854a3e9f45ff1057fcaf09_120-100_9-0.jpg'>
            </a>
            </li>*/
    })

    /**
     * -------------------------画廊模块---------------------------
     */

    $(document).ready(function () {

        var small_wrap = document.getElementById("small-wrap")

        var defaultImg = $(".small-img .active").attr('data-image');
        $("#bigpic").attr('src',defaultImg)


        $(".small-item").mouseover(function () {
            $(".small-item").each(function () {
                $(this).removeClass("active");
            });
            $(this).addClass("active");
            var imagesrc = $(this).attr('data-image')
            $("#bigpic").attr('src',imagesrc)
        });

        //var imageCount = 5;

        $(".prev").click(function () {
            var index = $(".small-img .active").attr('data-index');
            var descIndex = index-1;
            if(descIndex<0){
                descIndex+=imageCount;
            }
            $(".small-item").each(function () {
                $(this).removeClass("active");
            });
            $(".small-item[data-index='"+descIndex+"']").addClass("active")
            var imagesrc = $(".small-img .active").attr('data-image');
            $("#bigpic").attr('src',imagesrc)

            if(index==0){
                small_wrap.scrollLeft=small_wrap.offsetWidth-(108*2)
                return;
            }
            if(index>=2 && index<(imageCount-2)){
                small_wrap.scrollLeft-=108;
            }
        })

        $(".next").click(function () {
            var index = $(".small-img .active").attr('data-index');

            var descIndex = parseInt(index)+1;
            if(descIndex>=imageCount){
                descIndex=imageCount-index-1;
            }
            $(".small-item").each(function () {
                $(this).removeClass("active");
            });
            $(".small-item[data-index='"+descIndex+"']").addClass("active")
            var imagesrc = $(".small-img .active").attr('data-image');
            $("#bigpic").attr('src',imagesrc)
            if(index==(imageCount-1)){
                small_wrap.scrollLeft=0;
                return;
            }
            if(index>=2 && index<(imageCount-2)){
                small_wrap.scrollLeft+=108;
            }
        })

    })


    $("#goBack").click(function () {
        window.history.go(-1);
    })



</script>
</body>
</html>