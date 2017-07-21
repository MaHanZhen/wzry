<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>黑马程序员论坛帖子详情页</title>
    <%@include file="/common/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="${basePath }/css/index.css" />
    <link rel="stylesheet" type="text/css" href="${basePath }/css/detail.css" />
	<style>
		body {
	    background: url(images/bg.jpg) no-repeat;
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
			background-color: none;
		}
		.search-box .txt {
			width: 380px;
			height: 40px;			
		}		
		.hm-header {
		    height: 350px;
		}
		.hm-bbs-info-in h2 {		   
		    height: 100px;
		    line-height: 142px;
		}
		.hm-detail-fun {
		    height: 100px;
		    line-height: 142px;
		   margin-top: 0px;
		}
		.new-to-old {
			margin:0;
		}
		.fixedBar {
			bottom:173px
		}
		.detail-page-box a, .detail-page-box span {
			border:none;
			background:none;
			padding: 0 2px;
			font-size: 15px;
			margin:0px;
		}
		.detail-page-box .new-to-old{
			border: 1px solid #d9d9d9;
		}
		.detail-page-box {
			border:none;
			padding: 9px 15px 9px 20px;
		}
	</style>
	<script type="text/javascript">
	
		//检查评论内容
		function checkComment(){
			var content = $("#commentForm #content").val();
			if(content == ""){
				alert("评论内容不能为空！");
				return false;
			}
		}
		
		//检查回复内容
		function checkReply(){
			var content = $("#replyForm #replyContent").val();
			if(content == ""){
				alert("回复内容不能为空！");
				return false;
			}
		}
		
		//弹出回复框
		function showDialog(num, commentId) {
			$('.pop-box').css('display','block');
			//设置弹出层的楼层号
			$("#floorSpan").html(num);	
			//设置此次回复的评论
			$("#commentId").val(commentId);	
				
		}
	</script>
</head>
<body>
	<!-- 引入头部 -->
	<jsp:include page="/common/header.jsp"/>
		
		<div class="hm-header">
    </div>
    <div class="hm-body hm-body-bgc">
        <div class="hm-inner">
        	<div class="hm-bbs-info">
				<div class="hm-bbs-icon l" style="width:130px;">
					<span><img src="images/bbs-icon.png"
						height="80" /></span>
				</div>
				<div class="hm-bbs-info-in l" style="margin-left:30px;">
					<div class="t clearfix">
						<h2 class="l">${article.title }</h2>
						<div class="hm-detail-fun l">
								<span class="icon-like">
										<a href="${basePath }/likeArticle?articleId=${article.articleId}"><i></i>${article.likeCount }</a>
								</span>
								<span class="icon-talk">
										<a href="#comment"><i></i>${article.commentCount }</a>
								</span>
						</div>
					</div>					
				</div>
				 
			</div>
            <div class="detail-page-box clearfix">
            	
            	<a href="index.html"><i class="hm-ico-home"></i>首页</a><span>></span><a href="#">${article.title }</a>
                 <a class="new-to-old r" href="${basePath }/detail.html?articleId=${article.articleId}&order=desc" style="font-size:12px;float: right;">
	               <i></i>从新到旧查看 </a>
            </div>
            <div class="detail-box">
                <ul class="detail-floors">
                    <li class="floor clearfix">
                        <div class="floorer-info l">
                            <div class="floorer-photo">
                            	<c:if test="${articlePoster.picUrl == null || articlePoster.picUrl=='' }">
                            		<img src="images/default.png" height="55" />
                            	</c:if>
                            	<c:if test="${articlePoster.picUrl != null && articlePoster.picUrl!='' }">
                            		<img src="${basePath }/${articlePoster.picUrl}" height="55" />
                            	</c:if>
								
                            </div>
                            <div class="floorer-name">${article.posterName }</div>
                        </div>
                        <div class="floor-con l">
                            <div class="floor-info clearfix">
                                <div class="floor-time l">发帖时间：<fmt:formatDate value="${article.postTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </div>                                
                                <div class="r">${article.readCount }次查看</div>
                            </div>
                            <div class="floor-art-ans">
                                <div class="floor-art">
                                    <p>
                                    	${article.content }
                                    </p>
                                </div>
                                <div class="floor-ans"></div>
                            </div>
                            <span class="icon-comment">
                            	<a href="#comment"> <i ></i> 评论</a> 
                            </span>
                        </div>
                    </li>
                    <!-- 评论部分 -->
                    <c:forEach items="${commentList }" var="comment" varStatus="status">
                    <li class="floor clearfix">
							<div class="floorer-info l">
									<div class="floorer-photo">
										<c:if test="${comment.picUrl != null && comment.picUrl !='' }">
											<img src="${basePath }/${comment.picUrl}" />
										</c:if>
										<c:if test="${comment.picUrl == null || comment.picUrl =='' }">
											<img src="images/default.png" />
										</c:if>
										
									</div>
									<div class="floorer-name">
										${comment.commentUserName }
									</div>
							</div>
							<div class="floor-con l">
									<div class="floor-info clearfix">
											<div class="floor-time l">回贴时间：<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </div>
											<div class="r">${status.count }楼</div>
									</div>
									<div class="floor-art-ans">
											<div class="floor-art">
													<p>${comment.commentContent }</p>
											</div>
											<div class="floor-ans">
													<ul>
														<c:forEach items="${comment.commentReplies }" var="reply">
															<!-- 回复部分 -->
															<li class="clearfix">
																	<div class="floor-ans-pho l">
																		<c:if test="${reply.picUrl == null || reply.picUrl == '' }">
																			<img src="images/default.png"/>
																		</c:if>
																		<c:if test="${reply.picUrl != null && reply.picUrl != '' }">
																			<img src="${basePath }/${reply.picUrl}"/>
																		</c:if>
																	</div>
																	<div class="floor-ans-con l">
																			<span class="name">${reply.replyerName }</span>：${reply.replyContent } 
																			<span class="ans-time"><fmt:formatDate value="${reply.replyTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
																	</div>
															</li>
														</c:forEach>
													</ul>
											</div>
											<span class="icon-feedback">
								<a href="javascript:;" onclick="showDialog('${status.count }','${comment.commentId }')"> <i></i> 回复</a>
											</span>
									</div>
							</div>
					</li>
					</c:forEach>
                </ul>
            </div>
            <div class="detail-to-comment">
                <div class="tit"><a name="comment">发表评论</a></div>
								<!-- 未登录时候显示
	              <div class="con">您没有登录论坛，请登录后再进行回复</div>-->
								
                <!-- 登录后显示评论输入框-->
				<form id="commentForm" action="${basePath }/comment" method="post" onsubmit="return checkComment();">
					<div class="con con-loged">
							<div class="con-t">
									<textarea id="content" name="content" placeholder="请在此输入您要评论的信息"></textarea>
							</div>
							<div class="con-b">
									<input type="hidden" name="articleId" value="${article.articleId }" />
									<input type="submit" class="btn" />
									<span class="num">不能超过500字</span>
							</div>
					</div>
				</form>
            </div>
        </div>
    </div>
		
	<!-- 引入底部 -->
	<jsp:include page="/common/footer.jsp"/>

    <!-- 回复弹出框 -->
	<form id="replyForm" action="${basePath }/commentReply" method="post" onsubmit="return checkReply();">
		<div class="pop-box ft-box">
			<div class="mask"></div>
			<div class="win">
				<div class="win_hd">
					<h4 class="l">回复<span id="floorSpan"></span>楼</h4>
					<span class="close r">&times;</span>
				</div>
				<div class="win_bd">
					<div class="win_bd_b">
						<textarea id="replyContent" name="content" placeholder="回复内容限于40字以内"></textarea>
					</div>
				</div>
				<div class="win_ft">
					<div class="win_ft_in">
						<input type="hidden" name="articleId" value="${article.articleId}" />
						<input type="hidden" id="commentId" name="commentId" />
						<input type="submit" class="btn" value="回复"/>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<div class="fixedBar" id="j_fixedBar">
			<a href="#comment" class="newTopic"><span></span>评论</a>
			<a href="#" class="goTop"><i></i><span>返回<br />顶部</span></a>
	</div>
	
</body>
</html>
