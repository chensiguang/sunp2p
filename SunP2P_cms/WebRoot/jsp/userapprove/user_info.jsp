<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>用户信息审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	用户信息审核
    </div>
	<form action="userApproveAction_selectUserInfo" id="userInfo" method="post" name="userInfo">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>电子帐号：</label>
			<input class="text" name="eacc_no" type="text" value='${param.eacc_no}' />
		</li>
		<li>
			<label>客户姓名：</label>
			<input class="text" name="name" type="text" value='${param.name}' />
		</li>
		<li>
			<label>手机号码：</label>
			<input class="text" name="mobile" type="text" value='${param.mobile}' />
		</li>
		<li>
			<label>注册日期：</label>
			<input class="text" name="start_time" type="text" value='${param.start_time}' onfocus="WdatePicker()" /> ─
			<input class="text" name="end_time" type="text" value='${param.end_time}' onfocus="WdatePicker()" />
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			用户信息审核
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>电子账号</th>
				<th>客户姓名</th>
				<th>证件号码</th>
				<th>手机号码</th>
				<th>注册时间</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.eacc_no}"/></td>
				<td>${rst.eacc_no}</td>
				<td>${rst.name}</td>
				<td>${rst.id_code}</td>
				<td>${rst.mobile}</td>
				<td><fmt:formatDate value="${rst.reg_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
				<form action="userApproveAction_selectUserInfo" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs} ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form action="userApproveAction_selectUserInfo" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "userApproveAction_getButton",
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
					var hiddenHtml=$("#hiddenHtml").html();
					$.each(tmpPrivilege, function(i, list) {
						if(list.privilege_name.indexOf("查询")>-1){
							searchHtml += "<li><span style='display:inline-block;' class='sch-button' onclick='"+list.url+"()'>查询</span></li>";
						}else if(list.privilege_name.indexOf("审核通过") > -1 || list.privilege_name.indexOf("审核拒绝") > -1){
							hiddenHtml += "<input type='hidden' name='approve'/>";
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
		
		function userApproveAction_userInfoQuery() {
			setTimeout("userInfo.submit()", 100);
			return false;
		}
		
		function userApproveAction_approving() {
			var eacc_no= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					eacc_no = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要审核的内容！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个进行审核！");
				return;
			}
			window.location.href = "userApproveAction_approving?eacc_no=" + eacc_no
		}
		
	</script>
</body>
</html>
