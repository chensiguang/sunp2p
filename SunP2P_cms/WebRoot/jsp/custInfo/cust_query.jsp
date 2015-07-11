<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>客户信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<style>
.data-content th,.data-content td {
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}
</style>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	客户信息查询
    </div>
	<form action="custInfoAction_toQuery" method="post" name="qryForm" id="custInfo">
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>电子帐号：</label>
				<input class="text" name="eacc_no" type="text" value='${para.eacc_no}' />
			</li>
			<li>
				<label>客户姓名：</label>
				<input class="text" name="name" type="text" value='${para.name}' />
			</li>
			<li>
				<label>手机号码：</label>
				<input class="text" name="mobile" type="text" value='${para.mobile}' />
			</li>
			<li>
				<label>注册起始日期：</label>
				<input class="text" name="start_time" type="text" value='${para.start_time}' onfocus="WdatePicker()" /> 
			</li>
			<li>
				<label>注册截止日期：</label>
				<input class="text" name="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" />
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			客户信息查询列表
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto;">
		<div style="width:100%; overflow-x:auto;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>电子账号</th>
				<th>客户姓名</th>
				<th>证件号码</th>
				<th>手机号码</th>
				<th>电子邮箱</th>
				<th>电子邮箱是否验证</th>
				<th>当前可用余额</th>
				<th>总余额</th>
				<th>可用积分</th>
				<th>总积分</th>
				<th>注册时间</th>
				<th>风险等级</th>
				<th>用户等级</th>
				<th>账户状态</th>
				<th>性别</th>
				<th>信用等级</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.eacc_no}</td>
				<td>${rst.name}</td>
				<td>${rst.id_code}</td>
				<td>${rst.mobile}</td>
				<td>${rst.email}</td>
				<td>${rst.email_state}</td>
				<td>${rst.n_balance}</td>
				<td>${rst.t_balance}</td>
				<td>${rst.n_score}</td>
				<td>${rst.t_score}</td>
				<td><fmt:formatDate  value="${rst.reg_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${rst.risk_lvl}</td>
				<td>${rst.cus_lvl}</td>
				<td>${rst.acc_state}</td>
				<td>${rst.sex}</td>
				<td>${rst.trust_lvl}</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty page.result}">
			<tr>
				<td height="25" colspan="9" align="center">无相关信息</td>
			</tr>
		</c:if>
		</table>
		</div>
		<div class="page-tag clearfix">
			<div  class="float-l">
				<form action="custInfoAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<input type="hidden" id="month_inv" value='${month_inv}' />
	<form action="custInfoAction_download" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "custInfoAction_getButton",
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
		
		function custInfoAction_selectCust() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function custInfoAction_download() {
			setTimeout("detailForm.submit()", 100);
		}	
	</script>
</body>
</html>
