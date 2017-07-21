<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>用户信息</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" href="${basePath }/css/user_info.css" />
    <script type="text/javascript" src="${basePath }/js/hm-bbs.js"></script>
		<style type="text/css">
  		.hm-header-b {
  			border-bottom: 1px solid #d9d9d9;
  		}
    </style>
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
				<div class="search-box l">
						
				</div> 
			</div> 
				<div class="hm-header-b">
						<i class="hm-ico-home"></i>
						<a href="index.html">首页</a><span>></span>个人信息
				</div>
      </div>
    </div>
    <div class="hm-body hm-body-bgc">
        <div class="hm-inner"> 
            <div class="user-info clearfix">
            	<div class="user-info-t" style="height:20px;"></div> 
                <div class="user-info-l l">
                    <div class="user-info-l-t">
                    <c:if test="${loginUser.picUrl == null || loginUser.picUrl == '' }">
                    	<img src="images/default.png" />
                    </c:if>
                    <c:if test="${loginUser.picUrl != null && loginUser.picUrl != '' }">
                    	<img src="${basePath }/${loginUser.picUrl}" />
                    </c:if>
                        <div class="username">${loginUser.userName }</div>
                    </div>
                    <ul class="user-info-l-b">
                        <li class="cur"><i class="info-icon"></i>我的资料</li>
                        <li><i class="safe-icon"></i>修改密码</li>
                    </ul>
                </div>
                <div class="user-info-r r">
                    <ul class="clearfix hd">
                        <li class="cur"><a href="userInfo.html">个人信息</a></li>
                        <li><a href="userPwd.html">修改密码</a></li>
                    </ul>
                    <form action="${basePath }/user" method="post" enctype="multipart/form-data">
                    <ul class="bd">
                        <li class="clearfix">
                            <div class="info-l"><i class="red">*</i>用户名：</div>
                            <div class="info-r"><input type="text" class="txt" value="${loginUser.userName }" readonly="readonly"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l">邮箱地址：</div>
                            <div class="info-r"><input type="text" name="email" class="txt" value="${loginUser.email }"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l">上传头像：</div>
                            <div class="info-r">
                            	<input type="file" name="picUrl" class="file-btn"/>
                            </div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l"></div>
                            <div class="info-r">
                            	<input type="hidden" name="userId" value="${loginUser.userId}"/>
                            	<input type="submit" class="btn" value="保存" />
                            	<span style="color:red;">${msg }</span>
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