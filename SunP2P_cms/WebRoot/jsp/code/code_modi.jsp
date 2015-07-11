<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
	</head>
	<body>
	
		<form id="form" name="form" method="post" action="returnCodeAction_modi" >
			<c:if test="${empty param._backUrl}">
				<input type="hidden" name="_backUrl" value="returnCodeAction_toQuery"/>
			</c:if>
			${paramCover.unCoveredForbidInputs}
			<ul class="main-actions clearfix">
		        <li> 
					<label class="extra" >返回码：</label>
					<input name="returnCode.return_code" type="text"  class="required tool-text" value="${code.return_code }" readonly="readonly"/>
			     </li>
				<li>
					<label class="extra">返回信息：</label>
					<input name="returnCode.return_msg" type="text" class="required  tool-text" value="${code.return_msg }"/>
				</li>
			</ul>
						<div class="tool-buttons">
							<input class="tool-btn" type="submit" value="修 改" />&nbsp;
							<input class="tool-btn" type="button" value="返 回" id="closeLayer" />
						</div>
					</form>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	//获取当前窗口索引
	    	var index = parent.layer.getFrameIndex(window.name);
	    	$("#closeLayer").click(function(){
	    		parent.layer.close(index);
	    	});
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});
	</script>		
	</body>
</html>
