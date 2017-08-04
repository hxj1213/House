<%@page language="java" pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>房屋信息发布</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <!-- 以下三处引用是kindeditor -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/themes/default/default.css" />
    <script charset="UTF-8" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/js/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath}/static/js/zh-CN.js"></script>
    <!-- 上传图片插件 -->
    <script type="text/javascript" src="static/upload_js/tools.js"></script>
    <script type="text/javascript" src="static/upload_js/pictureHandle.js"></script>
    <script>
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="content"]', {
                resizeType : 1,
                allowPreviewEmoticons : false,
                allowImageUpload : true,
                items:[
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                });
        });
    </script>
</head>
<body>
    <div id="post_wrapper">
        <div class="baseinfo">
            <span class="orageBtn goBack" id="goBack"><a href="javascript:;">返回</a></span>
            <div class="hd">房屋基本信息</div>
            <div class="bd">
                <div class="row">
                    <label><b>*</b>出租方式：</label>
                    <input type="radio" value="0" checked>&nbsp;&nbsp;整租&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" value="1">&nbsp;&nbsp;合租
                </div>
                <div class="row">
                    <label><b>*</b>小区名称：</label>
                    <div class="inputDiv"><input class="max" type="text"></div>
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
                    <div class="inputDiv"><input type="text" value="请输入详细地址" class="max"></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋户型：</label>
                    <div class="inputDiv"><input type="text" class="min"><sapn>室</sapn></div>
                    <div class="inputDiv"><input type="text" class="min"><sapn>厅</sapn></div>
                    <div class="inputDiv"><input type="text" class="min"><sapn>卫</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋面积：</label>
                    <div class="inputDiv"><input type="text" class="min"><sapn>平米</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>楼层分布：</label>
                    <div class="inputDiv"><sapn>第</sapn><input type="text" class="min"><sapn>层</sapn></div>
                    <div class="inputDiv"><sapn>共</sapn><input type="text" class="min"><sapn>层</sapn></div>
                </div>
                <div class="row">
                    <label><b>*</b>房屋情况：</label>
                    <div class="selectDiv">
                        <select>
                            <option>朝向</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                    <div class="selectDiv">
                        <select>
                            <option>装修</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                    <div class="selectDiv">
                        <select>
                            <option>普通住宅</option>
                        </select>
                        <img src="static/images/select_arrow.png" class="selectArrow">
                    </div>
                </div>
                <div class="row config">
                    <label><b>*</b>房屋配置：</label>
                    <div class="configDiv">
                        <input type="checkbox" value="">电视
                        <input type="checkbox" value="">空调
                        <input type="checkbox" value="">热水器
                        <input type="checkbox" value="">电视
                        <input type="checkbox" value="">洗衣机
                        <input type="checkbox" value="">微波炉
                        <input type="checkbox" value="">冰箱<br><br>
                        <input type="checkbox" value="">床
                        <input type="checkbox" value="">暖气
                        <input type="checkbox" value="">沙发
                        <input type="checkbox" value="">衣柜
                        <input type="checkbox" value="">宽带网
                        <input type="checkbox" value="">可做饭
                        <input type="checkbox" value="">阳台
                        <input type="checkbox" value="">独立卫生间
                    </div>
                    <span class="orageBtn" id="selectAll"><a href="">全选</a></span>
                </div>
                <div class="row">
                    <label><b>*</b>租金要求：</label>
                    <div class="inputDiv"><input type="text" class="min"><span>元/月</span></div>
                    <div class="selectDiv">
                        <select>
                            <option>押一付三</option>
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
                    <div class="inputDiv"><input type="text" class="max"></div>
                </div>
                <div class="row">
                    <label><b>&nbsp;</b>房源描述：</label>
                    <form>
                        <textarea name="content" style="width:800px;height:200px;visibility:hidden;"></textarea>
                    </form>
                </div>
                <div class="row">
                    <label><b>*</b>上传照片：</label>
                    <div class="uploadDiv">
                        <div class="div-top">上传电脑中图片</div>
                        <div class="div-img" ><input class="btn btn-default" id="upFile"  type="file" style="display: none"><img id="showFileImg" src="static/images/find_image.png"></div>
                        <div class="div-bottom">选择电脑图片上传</div>
                    </div>
                    <div>
                        <img src="" id="preview" style="width: 300px"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="linkinfo">
            <div class="hd">您的基本资料</div>
            <div class="bd">
                <div class="row">
                    <label><b>*</b>联系人：</label>
                    <div class="inputDiv"><input type="text" class="middle"></div>
                </div>
                <div class="row">
                    <label><b>*</b>联系电话：</label>
                    <div class="inputDiv"><input type="text" class="middle"></div>
                </div>
                <div class="row">
                    <label><b>*</b>手机确认码：</label>
                    <div class="inputDiv other"><input type="text" class="middle"><button id="getCodeBtn">获取手机确认码</button></div>

                </div>
                <div class="row">
                    <label><b>*</b>可入住时间：</label>
                    <div class="inputDiv"><input type="text"></div>
                </div>
            </div>
            <div class="post_btn_wrapper">
                <span class="orageBtn" id="postInfoBtn"><a>马上发布</a></span>
            </div>
        </div>
    </div>
<script>
    $("#showFileImg").click(function () {
        $("#upFile").click()
    })
    $("#goBack").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
