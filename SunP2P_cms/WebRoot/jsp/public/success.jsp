<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>成功页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
</head>

<body>
	<div class="result-page">
		<div class="result-content clearfix">
			<img src="${ctx}/images/face-ok.png"  class="result-face" />
			<div class="result-msg">
				<span class="msg-strong">恭喜你!</span><br />
    			<span class="msg-more">${msg}</span><br />
    			<a class="result-button" id="ok"  href="javascript:closeWindow()">确定</a>
    		</div>
    	</div>
    </div>
    <c:set var="flag" value="${param._backUrl}"></c:set>
    
	<c:if test="${empty param._backUrl}">
		<c:set var="flag" value="${_backUrl}"></c:set>
	</c:if>

	<form name="form" method="post" action="${flag}">
		${paramCover.decodeInputs} &nbsp;
	</form>
</body>

<script type="text/javascript">
	var _submit = false;
	function closeWindow(){
		// 防止重复提交
		if(_submit == true)return;
		_submit=true;
		if("${flag}" == ""){
			history.back();
		}else{
			form.submit();
		}
	}		

	var btn=document.getElementById("ok");
	if(btn){
		btn.focus();
	}
</script>
</html>
