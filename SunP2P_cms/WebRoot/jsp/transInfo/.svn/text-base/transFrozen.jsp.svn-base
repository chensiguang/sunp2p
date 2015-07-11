<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>冻结解冻流水查询</title>
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
       	冻结解冻流水查询	
    </div>
	<form action="transFrozenAction_selectTransFrozen" id="transInfo" method="post" name="qryForm">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>冻结流水号：</label>
			<input class="text" name="frozen_serial" type="text" value='${para.frozen_serial}' />
		</li>
		<li>
			<label>冻结状态：</label>
			<select class="select" name="status" id="status">
				<option value="">==请选择冻结状态==</option>
				<c:forEach items="${K_FROZENSTATUS}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
			if('${para.status}' == null ){
				document.getElementById('status').value = "";
			}else{
				document.getElementById('status').value='${para.status}';
			}					
			</script>
		</li>
		<li>
			<label>冻结起始日期：</label>
			<input class="text" name="start_time" type="text" value='${para.start_time}' onfocus="WdatePicker()" />
		</li>
		<li>
			<label>冻结截止日期：</label>
			<input class="text" name="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" /> 
		</li>
		<li>
			<label>冻结类型：</label>
			<select class="select" name="frozen_type" id="frozen_type">
				<option value="">==请选择冻结类型==</option>
				<c:forEach items="${K_FROZENTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
			if('${para.frozen_type}' == null ){
				document.getElementById('frozen_type').value = "";
			}else{
				document.getElementById('frozen_type').value='${para.frozen_type}';
			}					
			</script>
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		冻结解冻流水列表
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>冻结流水号</th>
				<th>冻结状态</th>
				<th>冻结日期</th>
				<th>解冻日期</th>
				<th>冻结类型</th>
				<th>冻结金额</th>
				<th>冻结原因</th>
				<th>电子账号</th>
				<th>账户类型</th>
				<th>账户名称</th>
				<th>直接账户</th>
				<th>交易渠道</th>
				<th>解冻流水号</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.frozen_serial}</td>
				<td>${rst.status}</td>
				<td>${rst.frozen_date}</td>
				<td>${rst.unfrozen_date}</td>
				<td>${rst.frozen_type}</td>
				<td>${rst.frozen_amt}</td>
				<td>${rst.frozen_cause}</td>
				<td>${rst.eacc_no}</td>
				<td>${rst.cus_type}</td>
				<td>${rst.name}</td>
				<td>${rst.account}</td>
				<td>${rst.channel}</td>
				<td>${rst.unfrozen_serial}</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty page.result}">
			<tr>
				<td height="25" colspan="14" align="center">无相关信息</td>
			</tr>
		</c:if>
		</table>
	<div class="page-tag clearfix">
		<div  class="float-l">
			<form action="transFrozenAction_selectTransFrozen" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs} ${page.footerHtml}
			</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	</div>
	<input type="hidden" id="month_inv" value='${month_inv}' />
	<form action="transFrozenAction_download" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "transFrozenAction_getButton",
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
			
		function transFrozenAction_selectTransFrozen() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function transFrozenAction_download() {
			setTimeout("detailForm.submit()", 100);
		}	
	</script>
</body>
</html>
