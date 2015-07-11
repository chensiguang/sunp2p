<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>产品清算日查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
	<style>
	
	</style>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	产品清算日查询	
    </div>
	<form action="batchDateAction_toQuery" method="post" name="qryForm" >
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>清算日类型：</label>
				<select class="select" name="batchdate_type" id="batchdate_type">
					<option value="">不选</option>
					<c:forEach items="${K_BATCHDATETYPE}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('batchdate_type').value='${param.batchdate_type}'
				</script>
			</li>
			<li>
				<label>产品类型：</label>
				<select class="select" name="prod_type" id="prod_type">
					<option value="">不选</option>
					<c:forEach items="${K_PRODTYPE}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_type').value='${param.prod_type}'
				</script>
			</li>
			<li>
				<label>产品代码：</label>
				<input class="text" name="prod_id" type="text" value='${param.prod_id}' />
			</li>
			<%-- <li>
				<label>清算日期：</label>
				<input class="text" name="batch_date" type="text" value='${para.batch_date}' onfocus="WdatePicker()" /> 
			</li> --%>
		</ul>
		<input type="hidden" name="_backUrl" value="batchDateAction_toQuery"/>
			${paramCover.coveredInputs}
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		产品清算日信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>清算日类型</th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>清算日期</th>
				<th>清算时间</th>
				<th>处理状态</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.batchdate_type}&${rst.prod_type}&${rst.prod_id}"/></td>
				<td>${rst.batchdate_type_name}</td>
				<td>${rst.prod_type_name}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.batch_date}</td>
				<td>${rst.batch_time}</td>
				<td>${rst.status}</td>
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="7" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="batchDateAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="batchdate_type" id="batchdate_type_edit"/>
		<input type="hidden" name="prod_type" id="prod_type_edit"/>
		<input type="hidden" name="prod_id" id="prod_id_edit"/>
		<input type="hidden" name="_backUrl" value="batchDateAction_toQuery"/>
			${paramCover.coveredInputs}
	</form>	
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "batchDateAction_getButton",
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
						searchHtml += "<li><a class='sch-button' onclick='"+list.url+"()'>查询</a></li>";
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
		
		function batchDateAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function batchDateAction_toAdd() {
			var selectedCount = 0;
			var selectedValue;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					selectedValue = checkList[i].value;
				}
			}
			
			if(selectedCount > 1){
				alert("每次只能选择一项进行编辑！");
				return;
			}
			
			if(selectedCount == 1){
				var strs= new Array();
				strs = selectedValue.split("&");
				document.getElementById("batchdate_type_edit").value = strs[0];
				document.getElementById("prod_type_edit").value = strs[1];
				document.getElementById("prod_id_edit").value = strs[2];
				detailForm.action = "batchDateAction_toAdd";
				setTimeout("detailForm.submit()", 100);
			}else if(selectedCount == 0){
				qryForm.action = "batchDateAction_toAdd";
				setTimeout("qryForm.submit()", 100);
			}
		}	
		
		function prodInfoAction_toCheck() {
			selectedRecord("复核","prodInfoAction_toCheck");
		}
		
	</script>
</body>
</html>
