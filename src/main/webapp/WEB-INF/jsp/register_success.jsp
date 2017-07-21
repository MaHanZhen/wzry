<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>王者荣耀论坛注册成功</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" href="${basePath }/css/register.css" />
    <script type="text/javascript">
    
    var totalSeconds = 5;
    	
    window.setInterval(function(){
    	totalSeconds--;
    	if(totalSeconds == 0){
    		window.location.href = "${basePath}/index.html";
    	}
    	$("#countDown").html(totalSeconds+"s");
    }, 1000);
    
    </script>
</head>
<body>
    <!-- 引入头部 -->
	<jsp:include page="/common/header.jsp"/>
	
    <div class="hm-header">
        <div class="hm-inner clearfix">
            <div class="hm-header-t clearfix">
                <h1 class="logo l">
                    <a href="javascript:;"><img src="images/logo.png" 
                    	height="64" width="168" alt="" /></a>    
                </h1>
                    
            </div>
            <div class="hm-header-b">
                <i class="hm-ico-home"></i>
                <a href="index.html">首页</a><span>></span>用户注册
            </div>
        </div>
    </div>
    <div class="hm-body hm-body-bgc">
        <div class="hm-inner">
            <div class="step">
                
            </div>
            <div class="reg-box" style="text-align:center;height:200px;padding-top:100px;">
                <h2>恭喜您，注册成功！（<span id="countDown">5s</span>）</h2> 
            </div>
        </div>
    </div>
	<!-- 引入底部 -->
	<jsp:include page="/common/footer.jsp"/>

</body>
</html>
