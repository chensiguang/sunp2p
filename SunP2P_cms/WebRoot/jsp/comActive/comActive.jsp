<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/jsp/public/taglibs.jsp"%>
<html>
<head>
<title>活动信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
</head>
<body>
	<div class="main-title" id="Title">
       	活动信息管理
    </div>
	<form action="comActiveAction_selectAllActive" id="comActive" method="post" name="comActive">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>活动交易代码：</label>
			<input class="text" name="trans_id" type="text" value="${param.trans_id}" />
		</li>
		<li>
			<label>活动交易名称：</label>
			<input class="text" name="trans_name" type="text" value="${param.trans_name}" />
		</li>
		<li>
			<label>是否启用：</label>
			<select class="select" name="enable_flag" id="enable_flag">
				<option value="">==请选择是否启用==</option>
				<c:forEach items="${K_ISSUE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('enable_flag').value='${param.enable_flag}';
			</script>
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			活动信息管理列表
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>活动交易代码</th>
				<th>活动交易名称</th>
				<th>赠送积分起始金额</th>
				<th>积分赠送方式</th>
				<th>消费金额与积分比例</th>
				<th>最高赠送积分</th>
				<th>赠送积分</th>
				<th>赠送抵用券金额</th>
				<th>赠送红包</th>
				<th>是否启用</th>
				<th>备注</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.trans_id},${rst.start_amt},${rst.score_way}"/></td>
				<td>${rst.trans_id}</td>
				<td>${rst.trans_name}</td>
				<td>${rst.start_amt}</td>
				<td>${rst.score_way_t}</td>
				<td>${rst.score_percent}</td>
				<td>${rst.max_score}</td>
				<td>${rst.score}</td>
				<td>${rst.voucher_amt}</td>
				<td>${rst.amt}</td>
				<td>${rst.enable_flag_t}</td>
				<td>${rst.remark}</td>
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
				<form action="batchOrderAction_selectAllBatchOrder" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs} ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form action="batchOrderAction_selectAllBatchOrder" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "comActiveAction_getButton",
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
			
		function comActiveAction_selectActive() {
			setTimeout("comActive.submit()", 100);
			return false;
		}
		
		function comActiveAction_addComActiveUI() {
			window.location.href = "comActiveAction_addComActiveUI"
		}
		
		function comActiveAction_updateComActiveUI() {
			var primarykey= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					primarykey = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要修改的信息！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个进行修改！");
				return;
			}
			window.location.href = "comActiveAction_updateComActiveUI?primarykey=" + primarykey
		}
		
		function comActiveAction_deleteComActive() {
			var primarykey = "";
			var checkedList = document.getElementsByName("item");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					primarykey = primarykey + checkedList[i].value + ";";
				}
			}
			if(primarykey == "") {
				alert("请选择要删除的信息！");
				return;
			}else {
				if(confirm("您确定要删除选中的信息吗？")) {
					$.layer({
				        type: 2,
				        title: '删除',
				        maxmin: false,
				        area : ['500px' , '360px'],
				        offset : ['', ''],
				        iframe: {src: "comActiveAction_deleteComActive?primarykey="+primarykey},
				        close: function(index){
				            parent.frames['${frame}'].location.href='comActiveAction_selectAllActive';
				        }
				    });
				}
			}
		}
		
	</script>
</body>
</html>
