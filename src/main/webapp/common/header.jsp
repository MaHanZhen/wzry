<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 头部 -->
	<div class="hm-top-nav">
		<div class="hm-inner clearfix">
			<div class="hm-inner-l l">
			</div>
			<div class="hm-inner-r r">
				<div class="box">
					<c:if test="${userCustom == null }">
						<a href="javascript:;" id="login" class="to-login">游客登录</a>
						<a href="register.html">【新用户注册】</a>
					</c:if>
					<c:if test="${userCustom != null }">
						欢迎<a href="${basePath }/userInfo.html" style="margin-right:0px;padding:0px 5px;color:blue;">${userCustom.username }</a>回来！
		                <a href="${basePath }/doLogout.html">【注销】</a>
					</c:if>
					<div id="dialogBg"></div>
					<div id="dialog" class="animated">
						<img class="dialogIco" width="50" height="40" src="images/ico.png" />
						<div class="dialogTop" style="height:25px;">
							<a href="javascript:;" class="closeDialogBtn">关闭</a>
						</div>
						<form action="${basePath }/doLogin.html" method="post">
							<ul class="editInfos">
								<li>用户名：<input type="text" id="userName" name="userCustom.username"
									class="ipt" /></li>
								<li>密&nbsp;&nbsp;&nbsp;码：<input type="password"
									id="userPass" name="userCustom.userpass" class="ipt" /></li>
								<li><input type="submit" value="登录" class="submitBtn" /></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var w,h,className;
	function getSrceenWH(){
		w = $(window).width();
		h = $(window).height();
		$('#dialogBg').width(w).height(h);
	}
	
	window.onresize = function(){  
		getSrceenWH();
	}  
	$(window).resize();  
	
	$(function(){//在整个html页面渲染完以后执行
		getSrceenWH();
		
		//显示弹框
		//选择类名称为box的元素的所有子孙元素id为login的一个元素，给这个元素注册点击事件
		$('.box #login').click(function(){
			className = $(this).attr('class');
			$('#dialogBg').fadeIn(300);//慢慢显示
			$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
			$('#userName').focus();
			$("#j_fixedBar").hide();
		});
		
		//关闭弹窗
		$('.closeDialogBtn').click(function(){
			$('#dialogBg').fadeOut(300,function(){
				$('#dialog').addClass('bounceOutUp').fadeOut();
				$("#j_fixedBar").show();
			});
		});
	});
</script>