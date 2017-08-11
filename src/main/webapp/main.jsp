<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body>
<form id="conditionForm">
<input type="hidden" value="${pb.conditions.room}" name="room">
<input type="hidden" value="${pb.conditions.minprice}" name="minprice">
<input type="hidden" value="${pb.conditions.maxprice}" name="maxprice">
<input type="hidden" value="${pb.conditions.rentType}" name="rentType">
</form>
<%@include file="login.jsp"%>
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
                    <li class="rentTypeCondition"><a href="javascript:;">不限</a></li>
                    <li class="rentTypeCondition" lang="0"><a href="javascript:;">整租</a></li>
                    <li class="rentTypeCondition" lang="1"><a href="javascript:;">合租</a></li>
                </ul>
            </div>
            <div class="condition">
                <label>租金：</label>
                <input type="hidden">
                <ul>
                    <li  class="priceCondition" lang="-"><a href="javascript:;">不限</a></li>
                    <li  class="priceCondition" lang="-500"><a href="javascript:;">500以下</a></li>
                    <li  class="priceCondition" lang="500-1000"><a href="javascript:;">500-1000元</a></li>
                    <li  class="priceCondition" lang="1000-1500"><a href="javascript:;">1000-1500元</a></li>
                    <li  class="priceCondition" lang="1500-2000"><a href="javascript:;">1500-2000元</a></li>
                    <li  class="priceCondition" lang="2000-3000"><a href="javascript:;">2000-3000元</a></li>
                    <li  class="priceCondition" lang="3000-"><a href="javascript:;">3000以上</a></li>
                </ul>
            </div>
            <div class="condition">
                <label>房型：</label>
                <input type="hidden">
                <ul>
                    <li class="roomCondition" ><a href="javascript:;">不限</a></li>
                    <li class="roomCondition" lang="1"><a href="javascript:;">一室</a></li>
                    <li class="roomCondition" lang="2"><a href="javascript:;">二室</a></li>
                    <li class="roomCondition" lang="3"><a href="javascript:;">三室</a></li>
                    <li class="roomCondition" lang="4"><a href="javascript:;">四室</a></li>
                    <li class="roomCondition" lang="5"><a href="javascript:;">五室</a></li>
                    <li class="roomCondition" lang="6"><a href="javascript:;">五室以上</a></li>
                </ul>
            </div>
        </div>
        <div class="article">
            <div class="hd">
                <div class="caption-text">
                    <span>出租信息列表</span>
                    <span class="orageBtn" id="postBtn" onclick="checklogin()"><a href="javascript:;">发布信息</a></span>
                </div>
            </div>
            <div class="houseinfo">
            <c:forEach items="${pb.datas}" var="house">
                <div class="every-house">
                    <div class="dis-pic" onclick="getDetail(${house.id})"><a href="javascript:;"><img src="${house.housepic}"></a></div>
                    <div class="dis-text">
                       <div class="dis-title" onclick="getDetail(${house.id})"><a href="javascript:;">${house.houseTitle}</a></div>
                       <div class="dis-info">
                           <span>${house.room}室${house.hall}厅${house.toilet}卫</span> <span>${house.houseArea}m²</span>
                       </div>
                       <div class="dis-info"><span>${house.houseEstate}</span></div>
                    </div>
                    <div class="dis-price"><span>${house.price}</span>元/月</div>
                </div>
            </c:forEach>
            </div>
            <div class="pageinfo">
                <ul>
                    <li class="pageitem prev"><a href="">&lt;上一页</a></li>
                    <c:forEach begin="1" end="${pb.totalPages}" var="pageNum">
                        <li onclick="getList(${pageNum})" class="pageitem ${pb.pageNow==pageNum?'current':''}"><a href="javascript:;">${pageNum}</a></li>
                    </c:forEach>
                    <li class="next"><a href="">下一页&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
<script>
    window.onload = function () {
        var room = $("#conditionForm input[name='room']").val();
        $(".roomCondition").each(function () {
            console.log($(this).attr('lang')+"****"+room)
            if($(this).attr('lang')==room){
                $(this).attr('class','roomCondition select')
            }
        })

        console.log('----------------------------------------')

        var rentType = $("#conditionForm input[name='rentType']").val();
        $(".rentTypeCondition").each(function () {
            console.log($(this).attr('lang')+"****"+rentType)
            if($(this).attr('lang')==rentType){
                $(this).attr('class','rentTypeCondition select')
            }
        })

        var minprice = $("#conditionForm input[name='minprice']").val();
        var maxprice = $("#conditionForm input[name='maxprice']").val();
        var price = minprice+"-"+maxprice

        $(".priceCondition").each(function () {
            console.log($(this).attr('lang')+"****"+price)
            if($(this).attr('lang')==price){
                $(this).attr('class','rentTypeCondition select')
            }
        })

    }

    $(".rentTypeCondition").click(function () {
        var value = $(this).attr('lang');
        $("#conditionForm input[name='rentType']").val(value)
        getList(1);
    });

    $(".priceCondition").click(function () {
        var value = $(this).attr('lang');
        alert(value)
        var prices = value.split('-')
        $("#conditionForm input[name='minprice']").val(prices[0])
        $("#conditionForm input[name='maxprice']").val(prices[1])
        getList(1);
    });

    $(".roomCondition").click(function () {
        var value = $(this).attr('lang');
        $("#conditionForm input[name='room']").val(value);
        getList(1);
    });

    function checklogin() {
        $.ajax({
            type:'GET',
            url:'${pageContext.request.contextPath}/user/checklogin.action',
            success:function (resultData) {
                var loginName = resultData.loginName;
                if(loginName==null || loginName==""){
                    $("#covertDiv").css('display','block')
                    $("#loginDiv").css('display','block')
                }else{
                    window.location.href = "${pageContext.request.contextPath}/post.jsp";
                }
            }
        })

    }

    function getList(pageNum) {
        /*if (pageNum=={pb.pageNow}){
            return;
        }*/
        window.location.href="${pageContext.request.contextPath}/house/list.action?pageNow="+pageNum+"&"+$("#conditionForm").serialize();
    }

    function getDetail(houseId) {
        alert("查询详情:"+houseId)
        window.location.href="${pageContext.request.contextPath}/house/getById.action?id="+houseId
    }


</script>
</body>
</html>