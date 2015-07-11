<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>文件归档</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	文件归档
    </div>
	<form action="filingAction_filing" id="filing" method="post" name="filing">
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			文件归档
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "filingAction_getButton",
				dataType : "text",
				timeout: 6000,
				cache : false,
				error : function(msg) {
					alert('获取权限失败！');
				},
				success : function(result) {
					var tmpPrivilege = eval("("+result+")");
					var privilegeHtml=$("#myPrivileges").html();
					var searchHtml=$("#mainAction").html();
					$.each(tmpPrivilege, function(i, list) {
						if(list.privilege_name.indexOf("查询")>-1){
							searchHtml += "<li><span style='display:inline-block;' class='sch-button' onclick='"+list.url+"()'>查询</span></li>";
						}else{
							privilegeHtml += "<a class='button' onclick='"+list.url+"()"+"'>"+list.privilege_name+"</a>"+"&nbsp;";
						}
					});
					$("#myPrivileges").html(privilegeHtml);
					$("#mainAction").html(searchHtml);
				}
			});
		})	
			
		function filingAction_filing() {
			setTimeout("filing.submit()", 100);
			return false;
		}
		
		function filingAction_doFiling() {
			
			if(confirm("确定要执行文件归档吗？可能需要等待数分钟！")){
				$.layer({
			        type: 2,
			        title: '文件归档',
			        maxmin: false,
			        area : ['500px' , '360px'],
			        offset : ['', ''],
			        iframe: {src: 'filingAction_doFiling'},
			        close: function(index){
			            parent.frames['${frame}'].location.href='filingAction_filing';
			        }
			    });
			}
		}
	</script>
</body>
</html>
