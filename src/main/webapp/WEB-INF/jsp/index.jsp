<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title>王者荣耀论坛</title>
	<%@include file="/common/common.jsp" %>
	<link rel="stylesheet" href="${basePath }/css/index.css" />
	<style>
		body {
	    background: url(${basePath }/images/bg.jpg) no-repeat;
		    background-position: center top;
		    height: 100%;
		}
		.hm-bbs-info {
			position: relative;
		}
		.search-box {
			width: 400px;
			position: absolute;
			right:15px;
			top:30px;
		}
		.search-box .txt {
			width: 380px;
		}
		.hm-header {
		    height: 350px;
		}
		.fixedBar {
			bottom:173px
		}	
		
		.gb-list-wrap .gb-page-turn {
			padding: 23px 15px;
		}
		.gb-pb-b {
			border-top: 1px solid #EEE;
		}
		.gb-page-turn {
			padding: 13px 15px 17px;
		}
		.gb-app-inner, .gb-i-hr .gb-list-item, .gb-page-turn {
			overflow: hidden;
		}
		
		.gb-page-r .current, .gb-page-r a {
			height: 28px;
			line-height: 28px;
			padding: 0 6px;
			display: block;
			float: left;
			margin-left: 4px;
			border: 1px solid #CCC;
			color: #333;
			background: #FFF;
			min-width: 10px;
			text-align: center;
		}
		
		.gb-page-r .current, .gb-page-r .jm_curPage {
			border: 1px solid #d9d9d9;
			background: #ededed;
			color: #333;
			margin: 0 0 0 4px;
		}
		
		.gb-page-l, .gb-page-r {
			line-height: 30px;
		}
		
		.gb-page-r p, .gb-page-r span {
			float: left;
			height: 30px;
		}
		
		.gb-page-r p span {
			margin: 0 5px;
			color: #999;
		}

	</style>
	<script type="text/javascript">
		function check(){
			var title = $("#articleForm #title").val();
			if(title == ""){
				alert("帖子标题不能为空！");
				return false;
			}
			var content = $("#articleForm #content").val();
			if(content == ""){
				alert("帖子内容不能为空！");
				return false;
			}
		}
	</script>	
</head>
<body>
	<!-- 引入头部 -->
	<jsp:include page="/common/header.jsp"/>
	
	<!-- Banner部分 -->
	<div class="hm-header">
	</div>
	<div class="hm-body hm-body-bgc">
		<div class="hm-inner">
			<div class="hm-banner">
			</div>
			<div class="hm-bbs-info">
				<div class="hm-bbs-icon l" style="width:130px;">
					<span><img src="images/bbs-icon.png" height="80" /></span>
				</div>
				<div class="hm-bbs-info-in l" style="margin-left:30px;">
					<div class="t clearfix">
						<h2 class="l">王者荣耀</h2>
					</div>
					<p>
						<span>今日帖子<strong>${todayArticleCount }</strong></span> <span>全部帖子<strong>${allArticleCount }</strong></span>
					</p>
				</div>
				<div class="search-box l">
					<form id="searchForm" action="${basePath }/index.html" method="post">
						<input type="hidden" name="zoneId" value="${zoneId }"/>
						<input type="text" class="txt l" name="title" placeholder="请输入帖子标题关键字" value="${title }">
						<input type="submit" value="搜索" class="btn l" /> 
					</form>
				</div> 
			</div>
			<!-- 导航 -->
			<ul class="hm-bbs-nav border-lrb clearfix">
				<c:forEach items="${zones }" var="zone">
					<li <c:if test="${zone.zoneid == zoneId}"> class="current" </c:if> >
						<a href="${basePath }/index.html?zoneCustom.zoneid=${zone.zoneid}"><em></em>${zone.zonename }</a>
					</li>
				</c:forEach>
				
			</ul>
			<!-- 主体部分 -->
			<div class="hm-bbs-main border-lrb clearfix">
				<!-- 左侧列表 -->
				<div class="list-view l">
					<ul>
					<c:forEach items="${pagination.items }" var="article">
						<li class="clearfix <c:if test='${article.isTop == 1 }'>ding </c:if>">
							<div class="hm-index-title">
								<i class="set-to-top">顶</i> <a href="detail.html?articleId=${article.articleId }">${article.title }</a>
							</div>
							<div class="hm-index-con">${article.content }</div>
							<div class="hm-index-info l">
								<span class="article-username">${article.posterName }</span><span
									class="post-time"><fmt:formatDate value="${article.postTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
							</div>
							<div class="hm-index-fun r">
								<span class="icon-like"><i></i>${article.likeCount }</span>
								<span class="icon-talk"><i></i>${article.commentCount }</span>
							</div>
						</li>
					</c:forEach>
							
					</ul>
				<!-- 分页 -->
				<div class="gb-page-turn gb-pb-b">
					<div class="_pageNav gb-page-r">
						<c:if test="${pagination.pageNo>1 }">
							<a href="${basePath }/index.html?zoneId=${zoneId}">首页</a>
							<a href="${basePath }/index.html?zoneId=${zoneId}&pageNo=${pagination.pageNo-1}">上一页</a>
						</c:if>
						
						<!-- --------------------------页号显示开始-------------------------- -->
						<c:set var="showTotal" value="5"/><!-- 预计要显示的页数 -->
						<!-- 1、如果实际总页数比预计要显示的页数少的话，那么应该将所有页数显示 -->
						<c:if test="${pagination.totalPageCount < showTotal }">
							<c:forEach begin="1" end="${pagination.totalPageCount}" step="1" var="pgIndex">
								<c:if test="${pagination.pageNo==pgIndex }">
									<span class="current">${pgIndex }</span>
								</c:if>
								<c:if test="${pagination.pageNo!=pgIndex }">
									<a href="${basePath }/index.html?zoneId=${zoneId}&pageNo=${pgIndex}">${pgIndex }</a>
								</c:if>
							</c:forEach>
						</c:if>
						
						<!-- 2、如果实际总页数比预计要显示的页数大于等于的话，那么... -->
						<c:if test="${pagination.totalPageCount >= showTotal }">
							<!-- 左右距离当前页号的间隔页数 -->
							<c:set var="interval" value="${showTotal%2==1?(showTotal/2 - 0.5):(showTotal/2) }"/>
							<!-- 起始页号 -->
							<c:set var="startPageNo" value="${pagination.pageNo-interval }"/>
							<!-- 结束页号 -->
							<c:set var="endPageNo" value="${pagination.pageNo+interval }"/>
							
							<!-- 2.1、如果起始页号大于0 -->
							<c:if test="${startPageNo > 0 }">
								<c:if test="${pagination.totalPageCount < endPageNo }">
									<c:set var="startPageNo" value="${startPageNo -(endPageNo - pagination.totalPageCount) }"/>
									<c:set var="endPageNo" value="${pagination.totalPageCount }"/>
								</c:if>
							</c:if>
							
							<!-- 2.2、如果起始页号小于等于0 -->
							<c:if test="${startPageNo <= 0 }">
								<c:set var="endPageNo" value="${endPageNo -(startPageNo-1) }"/>
								<c:set var="startPageNo" value="1"/>
							</c:if>
							
							<c:forEach begin="${startPageNo}" end="${endPageNo}" step="1" var="pgIndex">
								<c:if test="${pagination.pageNo==pgIndex }">
									<span class="current">${pgIndex }</span>
								</c:if>
								<c:if test="${pagination.pageNo!=pgIndex }">
									<a href="${basePath }/index.html?zoneId=${zoneId}&pageNo=${pgIndex}">${pgIndex }</a>
								</c:if>
							</c:forEach>
						</c:if>
						
						<!-- --------------------------页号显示结束-------------------------- -->
						
						<c:if test="${pagination.pageNo < pagination.totalPageCount }">
							<a href="${basePath }/index.html?zoneId=${zoneId}&pageNo=${pagination.pageNo+1}">下一页</a>
							<a href="${basePath }/index.html?zoneId=${zoneId}&pageNo=${pagination.totalPageCount}">尾页</a>
						</c:if>
						<p><span>当前第${pagination.pageNo }页，共${pagination.totalPageCount }页</span></p>
					</div>
				</div>
					
				</div>
				<!-- 右侧侧边栏 -->
				<div class="aside l">
					<div class="aside-box">
						<h3 class="t">
							<a ahref="javascript:;">在线用户(${onLineUserList.size() })</a>
						</h3>
						<ul class="b clearfix">
							<c:forEach items="${onLineUserList }" var="user">
							<li>
								<div>
									<c:if test="${user.picUrl == null || user.picUrl=='' }">
										<img src="images/default.png" height="55" />
									</c:if>
									<c:if test="${user.picUrl != null && user.picUrl!='' }">
										<img src="${basePath }/${user.picUrl}" height="55" />
									</c:if>
								</div>
								<p>${user.userName }</p>
							</li>
							</c:forEach>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 引入底部 -->
	<jsp:include page="/common/footer.jsp"/>

	<div class="fixedBar" id="j_fixedBar">
		<a id="newTopicBtn" href="javascript:;" class="newTopic"><span></span>发帖</a>
		<a href="#" class="goTop"><i></i><span>返回<br />顶部</span></a>
	</div>
	
	<!-- 发帖弹出框 -->
	<form id="articleForm" action="${basePath }/postArticle" method="post" onsubmit="return check();">
		<div class="pop-box ft-box">
			<div class="mask"></div>
			<div class="win">
				<div class="win_hd">
					<h4 class="l">主题帖</h4>
					<span class="close r">&times;</span>
				</div>
				<div class="win_bd">
					<div class="win_bd_t">
						<input type="text" id="title" name="title" placeholder="帖子标题" />
					</div>
					<div class="win_bd_b">
						<textarea id="content" name="content" placeholder="正文"></textarea>
					</div>
				</div>
				<div class="win_ft">
					<div class="win_ft_in">
						<input type="hidden" name="zoneId" value="${zoneId }"/>
						<input type="submit" class="btn" value="发表"/>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
