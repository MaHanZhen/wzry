<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
    	<title>帖子管理-编辑</title>
    	<meta charset="UTF-8">
     	<%@ include file="/manage/common/common.jsp" %>
		<script type="text/javascript" src="${basePath }/manage/js/kindeditor/kindeditor-min.js"></script>
		<script type="text/javascript" src="${basePath }/manage/js/kindeditor/lang/zh_CN.js"></script>
	</head>
	<body>
	    <form action="${basePath }/admin/article?method=saveEdit" method="post" class="definewidth m20" onsubmit="return checkForm();">
			<table class="table table-bordered table-hover definewidth m10">
		        <tr>
		        	<td width="10%" class="tableleft">标题</td>
		            <td width="40%">
		            	<input type="text" id="title" name="title" value="${article.title }"/>
		            </td>
		            <td width="10%" class="tableleft">交流区</td>
		            <td width="40%">
		            	<select name="zoneId">		            		
		            			<option value="1" <c:if test="${article.zoneId==1 }">selected</c:if> >综合交流区</option>
		            			<option value="2" <c:if test="${article.zoneId==2 }">selected</c:if> >BUG反馈区</option>
		            			<option value="3" <c:if test="${article.zoneId==3 }">selected</c:if> >新闻公告区</option>
		            			<option value="4" <c:if test="${article.zoneId==4 }">selected</c:if> >活动专区</option>
		            	</select>
		            </td>
		        </tr>
		        <tr>
		        	<td class="tableleft">是否置顶</td>
		            <td colspan="3">
		            	<input type="radio" name="isTop" <c:if test="${article.isTop==1 }">checked</c:if> value="1"/>是
		            	<input type="radio" name="isTop" <c:if test="${article.isTop==0 }">checked</c:if> value="0"/>否
		            </td>
		        </tr>	
		        <tr>
		            <td class="tableleft">内容</td>
		            <td colspan="3">
		            	<textarea name="content" id="content" rows="15" style="width:100%;">${article.content }</textarea>
		            </td>
		        </tr>
		        <tr>
		            <td class="tableleft"></td>
		            <td colspan="3">
		            	<input type="hidden" name="articleId" value="${article.articleId }" />
		            	<input type="submit" class="btn btn-primary" value="保存"/>
		                &nbsp;&nbsp;<input type="button" class="btn btn-success" name="backid" id="backid" value="返回"/>
		            	&nbsp;&nbsp;<font color="red"></font>
		            </td>
		        </tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
			var editor;
			
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
							'bold', 'italic', 'underline', 'removeformat', '|',
							'justifyleft', 'justifycenter', 'justifyright',
							'insertorderedlist', 'insertunorderedlist', '|',
							'link' ],
					afterBlur: function(){
						this.sync();
					}				
				});
			});
					
			//返回按钮事件
			$('#backid').click(function(){
				location = "${basePath}/admin/article";
			});
			
			//检查表单内容
			function checkForm(){
				var title = $("#title").val();
				if(title == ""){
					alert("标题不能为空！");
					return false;
				}
				var content = $("#content").val();
				if(content == ""){
					alert("内容不能为空！");
					return false;
				}
			}
	</script>
</html>
