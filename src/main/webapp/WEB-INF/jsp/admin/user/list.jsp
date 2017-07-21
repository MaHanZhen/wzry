<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>用户管理</title>
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
	    	function doLock(userId, status){
	    		$("#userForm").attr("action", "${basePath }/admin/user?method=lock&userId=" + userId + "&talkStatus=" + status);
	    		//提交表单
	    		$("#userForm").submit();
	    	}
	    </script>
	</head>
	<body>
		<form id="userForm" class="form-inline definewidth m20" action="${basePath }/admin/user?method=list" method="post">
			用户名：<input name="userName" class="abc input-default" value="${userName }" />&nbsp;&nbsp;
			<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
		</form>
		<table class="table table-bordered table-hover definewidth m10">
		    <thead>
			    <tr>
			        <th>编号</th>
			        <th>用户名</th>
			        <th>邮箱</th>
			        <th>头像</th>
			        <th>角色</th>
			        <th>登录状态</th>
			        <th>最后登录时间</th>
			        <th>发言状态</th>
			        <th style="text-align:center;">操作</th>
			    </tr>
		    </thead>
		    <c:forEach items="${pagination.items }" var="user" varStatus="status">
		    <tr>
				<td>${status.count }</td>
				<td>${user.userName }</td>
				<td>${user.email }</td>
				<td>${user.picUrl }</td>
				<td>${user.role==1?'一般用户':'管理员' }</td>
				<td>${user.loginStatus==0?'未登录':'已登录' }</td>
				<td><fmt:formatDate value="${user.lastLoginTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td>
					<c:if test="${user.talkStatus==0 }">
						<font color="green">未屏蔽</font>
					</c:if>
					<c:if test="${user.talkStatus==1 }">
						<font color="red">已屏蔽</font>
					</c:if>
				</td>
				<td style="text-align:center;">
					<c:if test="${user.talkStatus==0 }">
						<a href="javascript:doLock(${user.userId },1)">屏蔽</a>
					</c:if>
					<c:if test="${user.talkStatus==1 }">
						<a href="javascript:doLock(${user.userId },0)">解锁</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- 分页 -->
		<div class="gb-page-turn gb-pb-b">
			<div class="_pageNav gb-page-r">
				<c:if test="${pagination.pageNo>1 }">
					<a href="${basePath }/admin/user?method=list">首页</a>
					<a href="${basePath }/admin/user?method=list&pageNo=${pagination.pageNo-1}">上一页</a>
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
							<a href="${basePath }/admin/user?method=list&pageNo=${pgIndex}">${pgIndex }</a>
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
							<a href="${basePath }/admin/user?method=list&pageNo=${pgIndex }">${pgIndex }</a>
						</c:if>
					</c:forEach>
				</c:if>
				
				<!-- --------------------------页号显示结束-------------------------- -->
				
				<c:if test="${pagination.pageNo < pagination.totalPageCount }">
					<a href="${basePath }/admin/user?method=list&pageNo=${pagination.pageNo+1}">下一页</a>
					<a href="${basePath }/admin/user?method=list&pageNo=${pagination.totalPageCount}">尾页</a>
				</c:if>
				<p><span>当前第${pagination.pageNo }页，共${pagination.totalPageCount }页</span></p>
			</div>
		</div>
		
	</body>
</html>