<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>用户份额明细查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	用户份额明细查询	
    </div>
	<form action="shareListAction_toQuery"  method="post" name="qryForm">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>电子账户：</label>
			<input class="text" name="eacc_no" type="text" value='${para.eacc_no}' />
		</li>
		<li>
			<label>账户类型：</label>
			<select class="select" name="acc_type" id="acc_type">
				<option value="">==请选择账户类型==</option>
				<c:forEach items="${K_ACCOUNTTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('acc_type').value='${para.acc_type}';				
			</script>
		</li>
		<li>
			<label>产品类型：</label>
			<select class="select" name="prod_type" id="prod_type">
				<option value="">==请选择产品类型==</option>
				<c:forEach items="${K_PRODTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('prod_type').value='${para.prod_type}';			
			</script>
		</li>
		<li>
			<label>产品代码：</label>
			<input class="text" name="prod_id"  value='${para.prod_id}'/>
		</li>
		
		<li>
			<label>起始日期：</label>
			<input class="text" name="start_time" type="text" value='${para.start_time}' onfocus="WdatePicker()" />
		</li>
		<li>
			<label>截止日期：</label>
			<input class="text" name="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" /> 
		</li>
		<li>
			<label>变动方向：</label>
			<select class="select" name="var_direction" id="var_direction">
				<option value="">==请选择变动方向==</option>
				<c:forEach items="${K_AMTTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('var_direction').value='${para.var_direction}';			
			</script>
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		用户份额明细查询信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>电子账号</th>
				<th>账户类型</th>
				<th>账户</th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>变动份额</th>
				<th>份额变动方向</th>
				<th>变动日期</th>
				<th>变动时间</th>
				<th>变动原因</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>			
				<td>${rst.eacc_no}</td>
				<td>${rst.acc_type}</td>
				<td>${rst.account}</td>
				<td>${rst.prod_type}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.var_value}</td>
				<td>${rst.var_direction}</td>
				<td>${rst.var_date}</td>
				<td>${rst.var_time}</td>
				<td>${rst.var_cause}</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty page.result}">
			<tr>
				<td height="25" colspan="11" align="center">无相关信息</td>
			</tr>
		</c:if>
		</table>
	<div class="page-tag clearfix">
		<div  class="float-l">
			<form action="shareListAction_toQuery" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs} ${page.footerHtml}
			</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	</div>
	<form action="shareListAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "shareListAction_getButton",
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
	
	function shareListAction_toQuery() {
		setTimeout("qryForm.submit()", 100);
		return false;
	}
	
	function shareListAction_fixedAssets() {
		setTimeout("detailForm.submit()", 100);
	}
		
	</script>
</body>
</html>
