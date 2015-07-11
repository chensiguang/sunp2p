<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>清算流程管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	清算流程管理
    </div>
	<form action="batchOrderAction_selectAllBatchOrder" id="batchOrder" method="post" name="selectAllBatchOrder">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>清算组别：</label>
			<input class="text" name="batch_group" type="text" value='${param.batch_group}' />
		</li>
		<li>
			<label>清算交易码：</label>
			<input class="text" name="task_code" type="text" value='${param.task_code}' />
		</li>
		<li>
			<label>清算状态：</label>
			<select class="select" name="deal_status" id="deal_status">
				<option value="">==请选择清算状态==</option>
				<c:forEach items="${K_DEALSTATUS}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('deal_status').value='${param.deal_status}';
			</script>
		</li>
		<li>
			<label>父清算交易码：</label>
			<input class="text" name="parent_task_code" type="text" value='${param.parent_task_code}' /> 
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
			清算流程管理
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>清算交易码</th>
				<th>清算组别</th>
				<th>清算名称</th>
				<th>父清算交易码</th>
				<th>是否允许重做</th>
				<th>重做次数</th>
				<th>最近执行日期</th>
				<th>开始处理时间</th>
				<th>清算状态</th>
				<th>返回码</th>
				<th>返回信息</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.task_code}"/></td>
				<td>${rst.task_code}</td>
				<td>${rst.batch_group}</td>
				<td>${rst.task_name}</td>
				<td>${rst.parent_task_code}</td>
				<td>${rst.redo_flag}</td>
				<td>${rst.op_times}</td>
				<td>${rst.last_trans_date}</td>
				<td>${rst.begin_time}</td>
				<td>${rst.deal_status}</td>
				<td>${rst.return_code}</td>
				<td>${rst.return_msg}</td>
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
				url : "batchOrderAction_getButton",
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
			
		function batchOrderAction_selectBatchOrder() {
			setTimeout("selectAllBatchOrder.submit()", 100);
			return false;
		}
		
		function batchOrderAction_addBatchOrderUI() {
			$.layer({
		        type: 2,
		        title: '添加',
		        maxmin: false,
		        area : ['500px' , '360px'],
		        offset : ['', ''],
		        iframe: {src: 'batchOrderAction_addBatchOrderUI'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchOrderAction_selectAllBatchOrder';
		        }
		    });
		}
		
		function batchOrderAction_updateBatchOrderUI() {
			var task_code= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					task_code = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要修改的内容！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个进行修改！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '修改',
		        maxmin: false,
		        area : ['500px' , '360px'],
		        offset : ['', ''],
		        iframe: {src: "batchOrderAction_updateBatchOrderUI?task_code="+task_code},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchOrderAction_selectAllBatchOrder';
		        }
		    });
		}
		
		function batchOrderAction_deleteBatchOrder() {
			var task_code = "";
			var checkedList = document.getElementsByName("item");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					task_code = task_code + checkedList[i].value + ",";
				}
			}
			if(task_code == "") {
				alert("请选择要删除的项！");
				return;
			}else {
				if(confirm("确定要删除选中的项吗？")) {
					$.layer({
				        type: 2,
				        title: '删除',
				        maxmin: false,
				        area : ['500px' , '360px'],
				        offset : ['', ''],
				        iframe: {src: "batchOrderAction_deleteBatchOrder?task_code="+task_code},
				        close: function(index){
				            parent.frames['${frame}'].location.href='batchOrderAction_selectAllBatchOrder';
				        }
				    });
				}
			}
		}
		
	</script>
</body>
</html>
