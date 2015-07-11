<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>数据字典查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
	<style>
	
	</style>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	数据字典设置	
    </div>
	<form action="dictInfoAction_toQuery" method="post" name="qryForm" >
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>字典名称：</label>
				<input class="text" name="dict_name" type="text" value='${param.dict_name}' />
			</li>
			<li>
				<label>字典说明：</label>
				<input class="text" name="dict_desc" type="text" value='${param.dict_desc}' />
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		数据字典信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>名称</th>
				<th>主键</th>
				<th>值</th>
				<th>说明</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.sun_key},${rst.val}" /></td>
				<td>${rst.dict_name}</td>
				<td>${rst.sun_key}</td>
				<td>${rst.val}</td>
				<td>${rst.prompt}</td>
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="5" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="dictInfoAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="selectedItemStr" />
		<input type="hidden" name="_backUrl" value="dictInfoAction_toQuery"/>
			${paramCover.coveredInputs}
	</form>		
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "dictInfoAction_getButton",
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
		
		
		function dictInfoAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function dictInfoAction_toAdd() {
			detailForm.action = "dictInfoAction_toAdd";
			setTimeout("detailForm.submit()", 100);
		}
		
		function dictInfoAction_delete() {
			var paramArr = ""
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
						paramArr = paramArr + checkList[i].value + "&";
				}
			}
			if(paramArr == ""){
				alert("请选择要删除的数据字典！")
				return;
			}else{
				if (confirm("您确信要删除所有选中的数据字典吗？")) {
					detailForm.action = "dictInfoAction_delete";
					detailForm.selectedItemStr.value = paramArr.substring(0,paramArr.length-1);
					setTimeout("detailForm.submit()", 100);
				}
			}
		}
		
		
		function dictInfoAction_toModi() {
			selectedRecord("修改","dictInfoAction_toModi");
		}
			
		function selectedRecord(param1,param2){
			var selectedItemVal= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					selectedItemVal = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要"+ param1 + "的数据字典！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一项进行"+ param1 +"！")
				return;
			}
			
			detailForm.action = param2;
			detailForm.selectedItemStr.value = selectedItemVal;
			setTimeout("detailForm.submit()", 100);
		}
		
	</script>
</body>
</html>
