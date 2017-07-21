<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>王者荣耀论坛注册页</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" href="css/register.css" />
    <script type="text/javascript">
		function check() {
			var $nameNode = $("#registerForm #userName");
			var $passNode = $("#registerForm #userPass");
			var $emailNode = $("#registerForm #email");
			
			if (!/^\w+$/i.test($nameNode.val())) {
				alert("用户名格式不正确！");
				return false;
			} 
			
			if ($passNode.val() == '' || !/^[a-z0-9]{6,10}$/i.test($passNode.val())) {
				alert("密码格式不正确！"); 
				return false;
			} 
			
			if ($emailNode.val() != '' && !/^\w+@[a-z0-9]+(\.[a-z]{2,3}){1,2}$/i.test($emailNode.val())) {
				alert("邮箱格式不正确！");
				return false;
			}
			return true;
		}
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
            <div class="reg-box">
                <h2>用户注册<span>（红色型号代表必填）</span></h2>
                <div class="reg-info">
                    <form id="registerForm" action="${basePath }/doRegister.html" method="post" onsubmit="return check()">
                        <ul>
                            <li>
                                <div class="reg-l"><span class="red">*</span> 用户名：</div>
                                <div class="reg-c">
                                    <input type="text" id="userName" name="userCustom.username" class="txt" value="${userName }"/>
                                </div>
                                <span class="tips">用户名应由英文、数字、下划线组成</span>
                            </li>
                             <li>
                                <div class="reg-l"><span class="red">*</span> 密&nbsp;&nbsp;&nbsp;码：</div>
                                <div class="reg-c">
                                    <input type="password" id="userPass" name="userCustom.userpass" class="txt" value="${userPass }"/>
                                </div>
                                <span class="tips">密码长度应为6~10位的英文或数字</span>
                            </li>
                            <li class="no-tips">
                                <div class="reg-l">&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱：</div> 
                                <div class="reg-c"><input type="email" id="email" name="userCustom.email" class="txt" value="${email }"/></div>
                            </li>
                            <li>
                                <div class="reg-l"></div>
                                <div class="reg-c">
                                    <input type="submit" class="submit-btn" value="注册" /><br/>
                                    <span style="color:red;">${error }</span>
                                </div>
                            </li>
                        </ul>
                    </form>    
                </div>
            </div>
        </div>
    </div>
	<!-- 引入底部 -->
	<jsp:include page="/common/footer.jsp"/>

</body>
</html>
