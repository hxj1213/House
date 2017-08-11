<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>房屋信息发布</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/code/prettify.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/jedate/skin/jedate.css">
    <!-- 以下三处引用是kindeditor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/themes/default/default.css" />
    <script charset="UTF-8" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jedate/jquery-1.7.2.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/js/zh-CN.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jedate/jquery.jedate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/messages_zh.js"></script>
</head>
<body>
<%@include file="login.jsp"%>
    <div id="post_wrapper">
        <form id="postForm">
        <div class="baseinfo">
            <span class="orageBtn goBack" id="goBack"><a href="javascript:;">返回</a></span>
            <div class="hd">房屋基本信息</div>
            <div class="bd">
                <div class="row">
                    <label><b>*</b>出租方式：</label>
                    <input type="radio" name="rentType" value="0" checked>&nbsp;&nbsp;整租&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="rentType" value="1">&nbsp;&nbsp;合租
                </div>
                <div class="row">
                    <label><b>*</b>小区名称：</label>
                    <div class="inputDiv"><input class="max" type="text" name="houseEstate" required maxlength="25" onblur="this.valid()"></div>
                </div>
                <div class="row">
                    <label><b>*</b>详细地址：</label>
                    <div class="selectDiv">
                        <select>
                            <option>区域</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                    <div class="selectDiv">
                        <select>
                            <option>街道</option>
                        </select>
                        <img src="static/images/select_arrow.png">
                    </div>
                    <div class="inputDiv"><input type="text" placeholder="请输入详细地址" class="max" name="address" required maxlength="50" onblur="this.valid()"></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋户型：</label>
                    <div class="inputDiv"><input type="text" name="room" class="min" required min="0"  digits onblur="this.valid()"><sapn>室</sapn></div>
                    <div class="inputDiv"><input type="text" name="hall" class="min" required min="0"  digits onblur="this.valid()"><sapn>厅</sapn></div>
                    <div class="inputDiv"><input type="text" name="toilet" class="min" required min="0"  digits onblur="this.valid()"><sapn>卫</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋面积：</label>
                    <div class="inputDiv"><input type="text" name="houseArea" class="min" required min="0" max="9999.99"  digits onblur="this.valid()"><sapn>平米</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>楼层分布：</label>
                    <div class="inputDiv"><sapn>第</sapn><input type="text" name="floor" class="min" required min="1" max="999" digits onblur="this.valid()"><sapn>层</sapn></div>
                    <div class="inputDiv"><sapn>共</sapn><input type="text" name="allfloor" class="min" required min="1" max="999"  digits onblur="this.valid()"><sapn>层</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋情况：</label>
                    <div class="selectDiv">
                        <select name="direction">
                            <option value="0">南北</option>
                            <option value="1">东西</option>
                            <option value="2">东</option>
                            <option value="3">南</option>
                            <option value="4">西</option>
                            <option value="5">北</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                    <div class="selectDiv">
                        <select name="decorate">
                            <option value="0">简单装修</option>
                            <option value="1">毛坯</option>
                            <option value="2">精装修</option>
                            <option value="3">中等装修</option>
                            <option value="4">豪华装修</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                    <div class="selectDiv">
                        <select name="houseType">
                            <option value="0">普通住宅</option>
                            <option value="1">商住两用</option>
                            <option value="2">平房</option>
                            <option value="3">别墅</option>
                            <option value="4">公寓</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                </div>
                <div class="row config">
                    <label><b>*</b>房屋配置：</label>
                    <div class="configDiv">
                        <input type="checkbox" name="configure" value="0">电视
                        <input type="checkbox" name="configure" value="1">空调
                        <input type="checkbox" name="configure" value="2">热水器
                        <input type="checkbox" name="configure" value="3">电视
                        <input type="checkbox" name="configure" value="4">洗衣机
                        <input type="checkbox" name="configure" value="5">微波炉
                        <input type="checkbox" name="configure" value="6">冰箱<br><br>
                        <input type="checkbox" name="configure" value="7">床
                        <input type="checkbox" name="configure" value="8">暖气
                        <input type="checkbox" name="configure" value="9">沙发
                        <input type="checkbox" name="configure" value="10">衣柜
                        <input type="checkbox" name="configure" value="11">宽带网
                        <input type="checkbox" name="configure" value="12">可做饭
                        <input type="checkbox" name="configure" value="13">阳台
                        <input type="checkbox" name="configure" value="14">独立卫生间
                    </div>
                    <span class="orageBtn" id="selectAll"><a href="javascript:;">全选</a></span>
                </div>
                <div class="row">
                    <label><b>*</b>租金要求：</label>
                    <div class="inputDiv"><input type="text" name="price" class="min" required min="0" max="99999"  digits onblur="this.valid()"><span>元/月</span></div>
                    <div class="selectDiv">
                        <select name="payType">
                            <option value="0">押一付三</option>
                            <option value="1">押一付一</option>
                            <option value="2">押一付二</option>
                            <option value="3">押二付一</option>
                            <option value="4">押二付二</option>
                            <option value="5">押二付三</option>
                            <option value="6">面议</option>
                            <option value="7">半年付</option>
                            <option value="8">半年付不押</option>
                            <option value="9">押一付半年</option>
                            <option value="10">年付</option>
                            <option value="11">年付不押</option>
                            <option value="12">押一付年</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                </div>
            </div>
        </div>
        <div class="detailinfo">
            <div class="hd">房屋描述及上传图片</div>
            <div class="bd">
                <div class="row">
                    <label><b>*</b>房源标题：</label>
                    <div class="inputDiv"><input type="text" name="houseTitle" class="max" required maxlength="100" onblur="this.valid()"></div>
                </div>
                <div class="row">
                    <label><b>&nbsp;</b>房源描述：</label>
                    <form>
                        <textarea name="houseDetail" style="width:800px;height:200px;visibility:hidden;"></textarea>
                    </form>
                </div>
                <div class="row">
                    <label><b>*</b>上传照片：</label>
                    <div class="uploadDiv">
                        <div class="div-top">上传电脑中图片</div>
                        <div class="div-img" >
                            <input type="hidden" name="housepic" required>
                            <img id="showFileImg" src="static/images/find_image.png">
                        </div>
                        <div class="div-bottom">选择电脑图片上传</div>
                    </div>
                    <div id="showUploadImageDiv">
                    </div>
                </div>
            </div>
        </div>
        </form>
        <form id="linkInfoForm">
        <div class="linkinfo">
            <div class="hd">您的基本资料</div>
            <div class="bd">
                <div class="row">
                    <label><b>*</b>联系人：</label>
                    <div class="inputDiv"><input type="text" name="linkman" class="middle" required maxlength="20" onblur="this.valid()"></div>
                </div>
                <div class="row">
                    <label><b>*</b>联系电话：</label>
                    <div class="inputDiv"><input type="text" name="linkphone" class="middle" required maxlength="11" onblur="this.valid()"></div>
                </div>
                <div class="row">
                    <label><b>*</b>手机确认码：</label>
                    <div class="inputDiv other"><input type="text" class="middle"><button id="getCodeBtn">获取手机确认码</button></div>

                </div>
                <div class="row">
                    <label><b>*</b>可入住时间：</label>
                    <div class="inputDiv">
                        <input class="datainp wicon" id="datefix" name="intoTime" type="text" placeholder="YYYY-MM-DD"  readonly>
                    </div>
                </div>
            </div>
            <div class="post_btn_wrapper">
                <span class="orageBtn" id="postInfoBtn"><a>马上发布</a></span>
            </div>
        </div>
        </form>
    </div>

    <img id="postloading" alt="cool loading animated gif 10" style="display:none;position:fixed;z-index:1111111111111;top:300px;left:600px;"  src="static/images/030.gif" >

<script>

    /*
    *
    *     kindeditor模块
    *
    * */

    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="houseDetail"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : true,
            //取消网络图片上传
            allowImageRemote : false,
            uploadJson : '${pageContext.request.contextPath}/upload.action',
            cssPath : 'static/plugins/code/prettify.css',
            allowFileManager : true,
            urlType: 'domain',
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
            },
            items:[
                'preview','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image','multiimage', 'baidumap', 'link','fullscreen']
        });

        var uploadbutton = K.uploadbutton({
            button : K('#ke-upload-button')[0],
            fieldName : 'imgFile',
            url : '${pageContext.request.contextPath}/upload.action',
            afterUpload : function(data) {
                if (data.error === 0) {
                    alert(data.url);
                } else {
                    alert(data.message);
                }
            }
        });
        uploadbutton.fileBox.change(function(e) {
            uploadbutton.submit();
        });

    });

    /*
    *
    *     日期选择框模块
    *
    * */

    $("#datefix").jeDate({
        fixedCell:"refix",
        hmsSetVal:{hh:00,mm:00,ss:00},
        initAddVal:{MM:"+3",DD:"+2"},
        minDate: '2016-06-16',
        maxDate: '2025-06-16',
        format:"YYYY-MM-DD",
        zIndex:3000,
        choosefun:function (elem,val,date) {
            console.log(val)
            console.log(date)
        },
        okfun:function (elem,val,date) {
            console.log(val)
            console.log(date)
        }
    })

    //-------------------全选---------------
    
    $("#selectAll").click(function () {
        $("input[name='configure']").attr('checked',true);
    });

    //---------------------上传主图片------------------------

    $("#showFileImg").click(function () {
        console.log(editor)
        editor.loadPlugin('image', function() {
            editor.plugin.imageDialog({
                showRemote : false,
                imageUrl : $('#url3').val(),
                clickFn : function(url, title, width, height, border, align) {
                    console.log('---点击上传----'+url)
                    $("input[name='housepic']").val(url)
                    $("#showUploadImageDiv").html("<img src='"+url+"' style='width:300px'>");
                    editor.hideDialog();
                }
            });
        });

    });

    //-------------------返回按钮-------------------------

    $("#goBack").click(function () {
        window.history.go(-1);
    });

    //------------------详细地址填写-----------------
    
    /*$("input[name='address']").focus(function () {
        $(this).val('')
    })

    $("input[name='address']").blur(function () {
        if($(this).val()=="") {
            $(this).val('请输入详细地址')
        }
    })*/

    /*
    *
    *   post house info
    *
    * */

    function postHouseInfo(userId) {
        var rentType = $("input[name='rentType']").val().trim();
        console.log("rentType:"+rentType);

        var houseEstate = $("input[name='houseEstate']").val().trim();
        console.log("houseEstate:"+houseEstate);

        var address = $("input[name='address']").val().trim();
        console.log("address:"+address)

        var room = $("input[name='room']").val().trim();
        console.log("room:"+room)

        var hall = $("input[name='hall']").val().trim();
        console.log("hall:"+hall)

        var toilet = $("input[name='toilet']").val().trim();
        console.log("toilet:"+toilet)

        var houseArea = $("input[name='houseArea']").val().trim();
        console.log("houseArea:"+houseArea)

        var floor = $("input[name='floor']").val().trim();
        console.log("floor:"+floor)

        var allfloor = $("input[name='allfloor']").val().trim();
        console.log("allfloor:"+allfloor)

        var configure = [];
        $("input[name='configure']:checked").each(function () {
            configure.push($(this).val())
        })
        console.log("configure:"+configure)

        var price = $("input[name='price']").val().trim();
        console.log("price:"+price)

        var houseTitle = $("input[name='houseTitle']").val().trim();
        console.log("houseTitle:"+houseTitle)

        var houseDetail = editor.html();
        console.log("houseDetail:"+houseDetail)

        var housepic = $("input[name='housepic']").val();
        console.log("housepic:"+housepic)

        var linkman = $("input[name='linkman']").val().trim();
        console.log("linkman:"+linkman)

        var linkphone = $("input[name='linkphone']").val().trim();
        console.log("linkphone:"+linkphone)

        var intoTime = $("input[name='intoTime']").val();
        console.log("intoTime:"+intoTime)

        var direction = $("select[name='direction']").val();
        console.log("direction:"+direction)

        var decorate = $("select[name='decorate']").val();
        console.log("decorate:"+decorate)

        var houseType = $("select[name='houseType']").val();
        console.log("houseType:"+houseType)

        var payType = $("select[name='payType']").val();
        console.log("payType:"+payType)

        var requestJson = {rentType:rentType,houseEstate:houseEstate,
            address:address,room:room,hall:hall,toilet:toilet,
            houseArea:houseArea,floor:floor,allfloor:allfloor,
            configure:configure.join(','),price:price,
            houseTitle:houseTitle,houseDetail:houseDetail,
            housepic:housepic,linkman:linkman,linkphone:linkphone,intoTime:intoTime,
            houseType:houseType,direction:direction,decorate:decorate,payType:payType,
            userId:userId}

        console.log("requestJson:"+requestJson)

        $.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath}/house/save.action',
            data:requestJson,
            beforeSend:function () {
                $("#covertDiv").css('display','block');
                $("#postloading").css('display','block');
            },
            success:function (resultData) {
                if(resultData=="success"){
                    window.location.href="${pageContext.request.contextPath}/house/list.action"
                }
            },
            complete:function () {
                $("#postloading").css('display','none');
                $("#covertDiv").css('display','none');
            }
        })
    }

    $.validator.setDefaults({
        errorPlacement: function(error, element) {
            element.parent().parent().append(error)
        },
        errorElement:'i'
    });

    $("#postInfoBtn").click(function () {

        var userId = null;

        $.ajax({
            type:'GET',
            url:'${pageContext.request.contextPath}/user/checklogin.action',
            success:function (resultData) {
                //alert("resultData.loginId:"+resultData.loginId)
                userId = resultData.loginId;
            },
            complete:function () {
                //alert("userId-----------:"+userId);

                if(userId==null || userId==""){
                    $("#covertDiv").css('display','block')
                    $("#loginDiv").css('display','block')
                    alert("请您登录之后再发布信息");
                    return false;
                }else{

                    var flag1 = $("#postForm").valid();
                    var flag2 = $("#linkInfoForm").valid();

                    if(!(flag1&&flag2)){
                        alert("您填写的信息有错误，请核对之后再提交")
                        return false;
                    }

                    postHouseInfo(userId);
                }
            }
        });
    })



</script>
</body>
</html>
