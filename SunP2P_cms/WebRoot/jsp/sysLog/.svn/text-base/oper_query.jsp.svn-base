<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>操作日志查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	系统用户操作日志查询	
    </div>
	<form action="operLogAction_toQuery" id="operLog" method="post" name="qryForm">
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>用户ID：</label>
				<input class="text" name="user_id" type="text" value='${para.user_id}' />
			</li>
			<li>
				<label>用户名称：</label>
				<input class="text" name="user_name" type="text" value='${para.user_name}' /> 
			</li>
			<li>
				<label>起始日期：</label>
				<input class="text" name="start_time" type="text" value='${para.start_time}' onfocus="WdatePicker()" />
			</li>
			<li>
				<label>截止日期：</label>
				<input class="text" name="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" /> 
			</li>
			<!-- <li>
				<span style="display:inline-block;" class='sch-button' onclick="$('#operLog').submit()">查询</span>
			</li> -->
		</ul>
		<div class="toolBar">
			<span class="toolbar-icon"></span>
			系统用户操作日志列表
			<div class="privileges" id="myPrivileges">
				<!-- <a class="button" href="javascript:toExport();">下载</a>&nbsp; -->
			</div>
		</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>用户ID</th>
				<th>用户名称</th>
				<th>操作日期</th>
				<th>用户终端IP</th>
				<th>用户操作URL</th>
				<th>用户操作</th>
				<th>操作结果</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.user_id}</td>
				<td>${rst.user_name}</td>
				<td>${rst.oper_time}</td>
				<td>${rst.user_ip}</td>
				<td>${rst.fun_url}</td>
				<td>${rst.privilege_name}</td>
				<td>${rst.rst_code}</td>
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="8" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="operLogAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<input type="hidden" id="month_inv" value='${month_inv}' />
	
	<form action="operLogAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "operLogAction_getButton",
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
	var checkedLists = $("input[name='item']");
	for(var i = 0; i < checkedLists.length; i++) {
		checkedLists.eq(i).click(function(){
			if($(this).is(":checked")){
				$(this).parent().parent().addClass("checkedTr");	
			}else{
				$(this).parent().parent().removeClass("checkedTr");
			}
		});
	};
	function selectAll(){
		for(var i = 0; i < checkedLists.length; i++){
			if($('#selectAll').is(":checked")){
				checkedLists.eq(i).prop('checked',true);
				checkedLists.eq(i).parent().parent().addClass('checkedTr');
			}else{
				checkedLists.eq(i).prop('checked',false);
				checkedLists.eq(i).parent().parent().removeClass('checkedTr');
			}
		}
	}
		
		function operLogAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function operLogAction_fixedAssets() {
			setTimeout("detailForm.submit()", 100);
		}
		
		
		
	</script>
</body>
</html>
