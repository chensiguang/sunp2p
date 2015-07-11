<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>强制产品募集失败</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	强制产品募集失败
    </div>
	<form action="mujiFailedAction_selectMuji" id="muji" method="post" name="muji">
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>产品代码：</label>
				<input class="text" name="prod_id" id="prod_id" type="text" value='${param.prod_id}' />
			</li>
		</ul>
		<div class="toolBar">
			<span class="toolbar-icon"></span>
				募集期产品列表
			<div class="privileges" id="myPrivileges">
			</div>
		</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>产品代码</th>
				<th>产品名称</th>
				<th>发行总额度</th>
				<th>已卖出额度</th>
				<th>产品收款账号</th>
			</tr>
			<tr>
				<td>${muji.prod_id}</td>
				<td>${muji.prod_name}</td>
				<td>${muji.total_limit}</td>
				<td>${muji.saled_limit}</td>
				<td>${muji.debit_account}</td>
			</tr> 
		<c:if test="${empty muji}">
			<tr>
				<td height="25" colspan="10" align="center">查无相关信息</td>
			</tr>
		</c:if>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "mujiFailedAction_getButton",
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
		
		function mujiFailedAction_selectMuji() {
			var prod_id = document.getElementById("prod_id").value;
			if(prod_id == '') {
				alert("产品代码为空！");
				return;
			}else if( /[^0-9 \-]+/.test( prod_id ) ){
				alert("请输入整数！");
				return;
			}
			setTimeout("muji.submit()", 100);
			return;
		}
		
		function mujiFailedAction_mujiFailed() {
			if("${param.prod_id}" == '') {
				alert("产品代码或者查询结果为空！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '强制募集失败',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 'mujiFailedAction_mujiFailed?prod_id=' + '${param.prod_id}' + '&muji=' + '${muji}'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='mujiFailedAction_mujiUI';
		        }
		    });
		}
		
		$("#muji").validate({
			onfocusout: function(element) { 
				$(element).valid(); 
			},
			rules: {
				prod_id: {
					required: true,
					digits: true 
				}
			}
		});
	</script>
</body>
</html>
