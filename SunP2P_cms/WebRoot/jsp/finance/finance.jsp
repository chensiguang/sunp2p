<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>finance</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
<style>
.data-content th,.data-content td {
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}
</style>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>

 <script type="text/javascript">
	$(document).ready(function() {
		var status = $("#status").val();
		//获取角色的权限
		$.ajax({
			type : "post",
			url : "financeAction_getButton",
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
						searchHtml += "<li><span class='sch-button' onclick='"+list.url+"()'>查询</span></li>";
					}else if(list.privilege_name.indexOf("明细")>-1||status=="0"||status==""){
						privilegeHtml += "<a class='button' onclick='"+list.url+"()"+"'>"+list.privilege_name+"</a>"+"&nbsp;";
					}
				})
				$("#myPrivileges").html(privilegeHtml);
				$("#mainAction").html(searchHtml);
			}
		});
		
		$("#queryFinance").validate({
			onfocusout: function(element) { 
				$(element).valid(); 
			},
			rules: {
				status: {
					number: true
				},
				trust_lvl: {
					number: true
				}
			}
		});
	});
</script>
</head>

<body>
	<div class="main-title" id="Title">
       	 客户融资信息管理	
    </div>
	<form action="financeAction_selectAllFinances" name="queryFinance"  id="queryFinance" method="post" >
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>电子账户：</label> 
			<input class="text" type="text" value="${param.eacc_no}" name="eacc_no" id="eacc_no" />
		</li>
		<li>
			<label>开始日期：</label> 
			<input class="text" type="text" value="${param.starttime}" name="starttime" id="starttime" onfocus="WdatePicker()"/>
		</li>
		<li>
			<label>结束日期：</label> 
			<input class="text" type="text" value="${param.endtime}" name="endtime" id="endtime" onfocus="WdatePicker()"/>
		</li>
		<li>
			<label>状态：</label> 
			<select class="select" name="status" id="status">
				<option value="">==请选择状态==</option>
				<c:forEach items="${K_APPROVESTA}" var="rst" >
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById("status").value="${param.status}"
			</script>
		</li>
		<li>
			<label>信用等级：</label> 
			<input class="text" type="text" value="${param.trust_lvl}" name="trust_lvl" id="trust_lvl" />
		</li>
		<li>
			<label>客户经理：</label> 
			<input class="text" type="text" value="${param.manage}" name="manage" id="manage" />
		</li>
	</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			客户融资信息管理
		<div class="privileges" id="myPrivileges">
       		<!-- 在此显示页面权限按钮 -->
		</div>
    </div>
    <div style="width:100%; overflow-x:auto;">
	<table cellspacing="0" cellpadding="0" border="1" class="data-content" style="margin-left:0; border-left:0; border-right:0;">
		<thead>
			<tr align="center" valign="middle" id="TableData">
				<th class="checkBox">
					<input type="checkbox" id="selectAll" onclick="selectAll()"/>	
				</th>			
				<th>电子账号</th>
				<th>申请日期</th>
				<th>用款日期</th>
				<th>融资金额</th>
				<th>融资期限</th>
				<th>融资利率</th>
				<th>还款方式</th>
				<th>当前状态</th>
				<th>融资成功次数</th>
				<th>融资成功金额</th>
				<th>融资信用等级</th>
				<th>融资客户类型</th>
				<th>融资客户名称</th>
				<th>融资人联系方式</th>
				<th>担保方式</th>			
				<th>客户经理</th> 
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="financ_id"  id="financ_id"value="${rst.financ_id}"/></td>					
		        	<td>${rst.eacc_no}</td>
		        	<td>${rst.reg_date}</td>
		        	<td>${rst.use_date}</td>
		        	<td>${rst.financ_amt}</td>
		        	<td>${rst.financ_cycle}</td>
		        	<td>${rst.financ_int}%</td>
		        	<td>${rst.repay_type}</td>
		        	<td>${rst.status}<input type="hidden" name="status" value="${rst.status}"/></td>
		        	<td><fmt:parseNumber value="${rst.successtimes}"></fmt:parseNumber></td>
		        	<td>${rst.sumamt}</td>
		        	<td>${rst.trust_lvl}</td>
		        	<td>${rst.cus_type}</td>
		        	<td>${rst.name}</td>
		        	<td>${rst.mobile}</td>
		        	<td>${rst.guarantee_way}</td>
		        	<td>${rst.manage}</td> 		        	
				</tr>
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="17" align="center">无相关信息</td>
				</tr>
			</c:if>
		</tbody>
	</table>
    </div>
	<div class="page-tag clearfix">
		<div  class="float-l">
		<form action="financeAction_selectAllFinances" method="post" name="listForm">
			<input type="hidden" name="pageNo"/>
			${paramCover.unCoveredForbidInputs } ${page.footerHtml}
		</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="financeAction_selectAllFinances"/>
			${paramCover.coveredInputs}
	</form>
	<script type="text/javascript">
		var checkedLists = $("input[name='financ_id']");
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
	
		function financeAction_selectAllFinances() {
			document.forms[0].submit();
		}
		
		function finance_details() {
		var financ_id= "";
			var url="financeAction_details?financ_id=";
			var selectedCount = 0;
			var checkList = document.getElementsByName("financ_id");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					financ_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要查看明细的交易！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一笔交易查看明细！");
				return;
			}
			
			detailForm.action = "financeAction_details?financ_id=" + financ_id;
			setTimeout("detailForm.submit()", 100);
			
		}
		
		function finance_toPass() {
		var financ_id= "";
			var url="financeAction_approveUI?financ_id=";
			var selectedCount = 0;
			var checkList = document.getElementsByName("financ_id");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					financ_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要操作的交易！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一笔交易操作！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '审核通过',
		        maxmin: false,
		        area : ['720px' , '360px'],
		        offset : ['', ''],
		        iframe: {src: url+financ_id},
		        close: function(index){
		            parent.frames['${frame}'].location.href='financeAction_selectAllFinances';
		        }
		    });
		}
		
		function finance_toRefuce() {
			var financ_id= "";
			var selectedCount = 0;
			var url="financeAction_refuseUI?financ_id=";
			var checkList = document.getElementsByName("financ_id");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					financ_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要操作的交易！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一笔交易操作！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '审核拒绝',
		        maxmin: false,
		        area : ['720px' , '360px'],
		        offset : ['', ''],
		        iframe: {src: url+financ_id},
		        close: function(index){
		            parent.frames['${frame}'].location.href='financeAction_selectAllFinances';
		        }
		    });
		}
	</script>
</body>
</html>
