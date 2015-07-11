<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>错误页面</title>
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
			<img src="${ctx}/images/face-no.png"  class="result-face" />
			<div class="result-msg">
				<span class="msg-strong">出错了!</span><br />
    			<span class="msg-more">${msg}</span><br />
    			<a class="result-button" id="ok"  href="javascript:history.back()">确定</a>
    		</div>
    	</div>
    </div>
</body>
<script type="text/javascript">
	var btn=document.getElementById("ok");
	if(btn){
		btn.focus();
	}
</script>
</html>
