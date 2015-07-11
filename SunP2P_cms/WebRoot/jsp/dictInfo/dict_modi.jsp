<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>修改数据字典</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
	</head>
	<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	修改数据字典	
    </div>
	<form name="form" method="post" id="formModi" action="dictInfoAction_modi">
		<c:if test="${empty param._backUrl}">
			<input type="hidden" name="_backUrl" value="dictInfoAction_toQuery"/>
		</c:if>
		${paramCover.unCoveredInputs}
		
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label class="extra">名称：</label>
				<input class="required tool-text" name="dict_name" type="text"  value="${rst.dict_name}" />
			</li>
			<li>
				<label class="extra">主键：</label>
				<input class="tool-text" name="sun_key" type="text" readonly="readonly" value="${rst.sun_key}" />
			</li>
			<li>
				<label class="extra">值：</label>
				<input class="tool-text" name="val" type="text" readonly="readonly" value="${rst.val}" />
			</li>
			<li>
				<label class="extra">说明：</label>
				<input class="required tool-text" name="prompt" type="text" value="${rst.prompt}"/>
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="修改" />&nbsp;
			<input class="tool-btn" type="button" value="返 回" onclick="history.back();" />
		</div>
	</form>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#formModi").validate({onfocusout: function(element) { $(element).valid(); },});
		});
		
	</script>		
	</body>
</html>
