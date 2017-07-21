<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>帖子管理</title>
	    <meta charset="UTF-8">
	    <%@ include file="/manage/common/common.jsp" %>  
	    <style>
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
	    
	    	//跳转到新增页面
	    	function doAdd(){
	    		//修改当前窗口的地址栏地址；如果该页面在一个jsp框架中，那么则修改的是该框架的地址
	    		window.location.href = "${basePath }/admin/article?method=add";
	    	}
	    	
	    </script>
	</head>
	<body>
		<form id="articleForm" class="form-inline definewidth m20" action="${basePath }/admin/article?method=list" method="post">
			标题：<input name="title" class="abc input-default" value="${title }"></input>&nbsp;&nbsp;
			<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
		    <button type="button" class="btn btn-primary" onclick="doAdd()">添加</button>&nbsp;&nbsp; 
		    <font color="red"></font>
		</form>
		<table class="table table-bordered table-hover definewidth m10">
		    <thead>
			    <tr>
					<th>编号</th>
			        <th>标题</th>
			        <th>内容</th>
			        <th>发布时间</th>
			        <th>发布人</th>
			        <th>是否置顶</th>
			        <th>评论数</th>
			        <th>点赞数</th>
			        <th>浏览数</th>
			        <th style="text-align:center;">操作</th>
			    </tr>
		    </thead>
		    <c:forEach items="${pagination.items }" var="article" varStatus="status">
		    <tr>
				<td>${status.count }</td>
				<td>${article.title }</td>
				<td>${article.content }</td>
				<td><fmt:formatDate value="${article.postTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td>${article.posterName }</td>
				<td>${article.isTop==1?'置顶':'未置顶' }</td>
				<td>${article.commentCount }</td>
				<td>${article.likeCount }</td>
				<td>${article.readCount }</td>
				<td style="text-align:center;">
					<a href="${basePath }/admin/article?method=edit&articleId=${article.articleId}">修改</a>&nbsp;|                
					<a href="${basePath}/admin/article?method=delete&articleId=${article.articleId}" >删除</a>&nbsp;|
					<a href="${basePath}/admin/article?method=comment&articleId=${article.articleId}">查看评论</a>             
				</td>
			</tr>
		    </c:forEach>
		</table>

		<!-- 分页 -->
		<div class="gb-page-turn gb-pb-b">
			<div class="_pageNav gb-page-r">
				<c:if test="${pagination.pageNo>1 }">
					<a href="${basePath }/admin/article?method=list">首页</a>
					<a href="${basePath }/admin/article?method=list&pageNo=${pagination.pageNo-1}">上一页</a>
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
							<a href="${basePath }/admin/article?method=list&pageNo=${pgIndex}">${pgIndex }</a>
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
							<a href="${basePath }/admin/article?method=list&pageNo=${pgIndex }">${pgIndex }</a>
						</c:if>
					</c:forEach>
				</c:if>
				
				<!-- --------------------------页号显示结束-------------------------- -->
				
				<c:if test="${pagination.pageNo < pagination.totalPageCount }">
					<a href="${basePath }/admin/article?method=list&pageNo=${pagination.pageNo+1}">下一页</a>
					<a href="${basePath }/admin/article?method=list&pageNo=${pagination.totalPageCount}">尾页</a>
				</c:if>
				<p><span>当前第${pagination.pageNo }页，共${pagination.totalPageCount }页</span></p>
			</div>
		</div>
		
	</body>
</html>