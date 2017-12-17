<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<html>
<style type="text/css">
    * {
        margin: 0;
        padding: 0
    }

    #demo {
        display: block;
        width: 320px;
        height: 320px;
        position: relative;
        border: 1px solid #ccc;
    }

    #small {
        position: relative;
        z-index: 1;
    }

    #float {
        display: none;
        width: 160px;
        height: 160px;
        position: absolute;
        background: #ffffcc;
        border: 1px solid #ccc;
        filter: alpha(opacity=50);
        opacity: 0.5;
    }

    #big {
        display: none;
        position: absolute;
        top: 0;
        left: 460px;
        width: 460px;
        height: 460px;
        overflow: hidden;
        border: 1px solid #ccc;
        z-index: 1;;
    }

    #big img {
        position: absolute;
        z-index: 5
    }
</style>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $("#small").hover(
            function () {
                $("#float").show();
                $("#big").show();
            }, function () {
                $("#float").hide();
                $("#big").hide();
            });
        $("#small").mousemove(function (event) {
            //设置放大镜中心位置为鼠标的位置
            var left = event.pageX - $("#float").width() / 2;
            var top = event.pageY - $("#float").height() / 2;
            //限制放大镜的移动范围
            var x = left;
            var y = top;
            x = x < 0 ? 0 : x;
            y = y < 0 ? 0 : y;
            x = x > $("#small").width() - $("#float").width() ? $("#small").width() - $("#float").width() : x;
            y = y > $("#small").width() - $("#float").height() ? $("#small").width() - $("#float").height() : y;
            $("#float").offset({
                top: y,
                left: x
            });
            //放大镜层最大移动距离
            var floatMoveMax = $("#small").width() - $("#float").width();
            //大图最大移动距离
            var bigImgMoveMax = $("#big img").width() - $("#big").width();
            //放大镜层移动的距离
            var floatMove = event.pageX - $("#float").width() / 2;
            var bigx = floatMove * bigImgMoveMax / floatMoveMax;
            var bigy = (event.pageY - $("#float").height() / 2) * bigImgMoveMax / floatMoveMax;
            //大图同步移动(移动的方向是相反的)
            $("#big img").offset({
                top: -bigy,
                left: -bigx + 460
            });
        });

    });
</script>

<body>
<div id="demo">
    <div id="small">
        <img src="/zoom/small.jpg">
        <div id="float"></div>
    </div>
    <div id="big">
        <img src="/zoom/big.jpg">
    </div>
</div>

</body>
</html>
