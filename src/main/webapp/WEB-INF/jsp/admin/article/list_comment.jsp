<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>帖子管理--评论列表</title>
	    <meta charset="UTF-8">
	    <%@ include file="/manage/common/common.jsp" %>  
	</head>
	<body>
		
		<table class="table table-bordered table-hover definewidth m10">
		    <thead>
			    <tr>
			    <tr>
			    	<th>编号</th>
			        <th>评论内容</th>
			        <th>评论时间</th>
			        <th>评论人</th>
			        <th>状态</th>
			        <th style="text-align:center;">操作</th>
			    </tr>
			    </tr>
		    </thead>
		    <c:forEach items="${commentList }" var="comment" varStatus="status">
		    <tr>
				<td>${status.count }</td>
				<td>${comment.commentContent }</td>
				<td><fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td>${comment.commentUserName }</td>
				<td>
					<c:if test="${comment.commentStatus==1 }">
						<font color="red">已屏蔽</font>
					</c:if>
					<c:if test="${comment.commentStatus==0 }">
						<font color="green">正常</font>
					</c:if>
				</td>
				<td style="text-align:center;">
					<c:if test="${comment.commentStatus==1 }">
						<a href="${basePath }/admin/article?method=blockComment&commentId=${comment.commentId}&articleId=${comment.articleId}&status=0">解锁</a>
					</c:if>
					<c:if test="${comment.commentStatus==0 }">
						<a href="${basePath }/admin/article?method=blockComment&commentId=${comment.commentId}&articleId=${comment.articleId}&status=1">屏蔽</a>
					</c:if>
				</td>
			</tr>
		    </c:forEach>
		    
		</table>
	</body>
</html>