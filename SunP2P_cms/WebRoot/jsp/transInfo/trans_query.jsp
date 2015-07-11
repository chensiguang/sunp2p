<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>查询交易流水</title>
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
       	交易流水查询	
    </div>
	<form action="transInfoAction_toQuery" id="transInfo" method="post" name="qryForm">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>流水号：</label>
			<input class="text" name="trans_id" type="text" value='${para.trans_id}' />
		</li>
		<li>
			<label>交易代码：</label>
			<input class="text" name="business_type" id="business_type" value='${para.business_type}'/>
		</li>
		<li>
			<label>交易状态：</label>
			<select class="select" name="trade_state" id="trade_state">
				<option value="">==请选择交易状态==</option>
				<c:forEach items="${K_TRANSSTATE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
			if('${para.trade_state}' == null ){
				document.getElementById('trade_state').value = "";
			}else{
				document.getElementById('trade_state').value='${para.trade_state}';
			}					
			</script>
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
			<label>姓名：</label>
			<input class="text" name="name" type="text" value='${para.name}' />
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		交易流水列表
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>流水号</th>
				<th>交易代码</th>
				<th>产品代码</th>
				<th>交易金额</th>
				<th>交易渠道</th>
				<th>交易状态</th>
				<th>交易人姓名</th>
				<th>交易人手机</th>
				<th>电子账户</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.serial_id}</td>
				<td>${rst.trans_code}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.amt}</td>
				<td>${rst.channel}</td>
				<td>${rst.trade_state}</td>
				<td>${rst.name}</td>
				<td>${rst.mobile}</td>
				<td>${rst.eacc_no}</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty page.result}">
			<tr>
				<td height="25" colspan="10" align="center">无相关信息</td>
			</tr>
		</c:if>
		</table>
	<div class="page-tag clearfix">
		<div  class="float-l">
			<form action="transInfoAction_toQuery" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs} ${page.footerHtml}
			</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	</div>
	<input type="hidden" id="month_inv" value='${month_inv}' />
	<form action="transInfoAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "transInfoAction_getButton",
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
	
	function transInfoAction_toQuery() {
		setTimeout("qryForm.submit()", 100);
		return false;
	}
	
	function transInfoAction_fixedAssets() {
		setTimeout("detailForm.submit()", 100);
	}	
	</script>
</body>
</html>
