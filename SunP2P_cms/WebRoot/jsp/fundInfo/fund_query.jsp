<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>查询基金产品</title>
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
       	基金产品信息设置	
    </div>
	<form id="fundQuery" action="fundInfoAction_toQuery" method="post" name="qryForm" >
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>基金类型：</label>
				<select class="select" name="fundInfo.prod_type" id="prod_type">
					<option value="">不选</option>
					<c:forEach items="${K_PRODTYPE}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_type').value='${fundInfo.prod_type}'
				</script>
			</li>
			<li>
				<label>产品状态：</label>
				<select class="select" name="fundInfo.prod_state" id="prod_state">
					<option value="">不选</option>
					<c:forEach items="${K_PRODSTATE}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_state').value='${fundInfo.prod_state}'
				</script>
			</li>
			<li>
				<label>风险等级：</label>
				<select class="select" name="fundInfo.risk_lvl" id="risk_lvl">
					<option value="">不选</option>
					<c:forEach items="${K_RISKLVL}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('risk_lvl').value='${fundInfo.risk_lvl}'
				</script>
			</li>
			<li>
				<label>发布状态：</label>
				<select class="select" name="fundInfo.issue_state" id="issue_state">
					<option value="">不选</option>
					<c:forEach items="${K_ISSUESTATE}" var="rst">
						<option value="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select> 
				<script type="text/javascript">
					document.getElementById('issue_state').value='${fundInfo.issue_state}'
				</script>
			</li>
			<li>
				<label>基金代码：</label>
				<input class="text" name="fundInfo.prod_id" type="text" value='${fundInfo.prod_id}' />
			</li>
			<li>
				<label>基金名称：</label>
				<input class="text" name="fundInfo.prod_name" type="text" value='${fundInfo.prod_name}' />
			</li>
			<li>
				<label>首页推荐：</label>
				<select class="select" name="fundInfo.hpage_promoted" id="hpage_promoted">
					<option value="">不选</option>
					<c:forEach items="${K_HPAGEPROMOTED}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('hpage_promoted').value='${fundInfo.hpage_promoted}'
				</script>
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		基金产品信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>基金类型</th>
				<th>基金代码</th>
				<th>基金名称</th>
				<th>最新净值</th>
				<th>7天年化收益率</th>
				<th>产品风险等级</th>
				<th>首页推荐</th>
				<th>产品状态</th>
				<th>发布状态</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.prod_id}"/></td>
				<td>${rst.prod_type}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.prod_name}</td>
				<td>${rst.net_worth}</td>
				<td>${rst.ist_7day}</td>
				<td>${rst.risk_lvl}</td>
				<td>${rst.hpage_promoted}</td>
				<td>${rst.prod_state}</td>
				<td>${rst.issue_state}</td>			
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="10" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="fundInfoAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="fundInfoAction_toQuery"/>
			${paramCover.coveredInputs}
	</form>		
	<script type="text/javascript">
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
		$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "fundInfoAction_getButton",
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
		
		function fundInfoAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function fundInfoAction_toAdd() {
			detailForm.action = "fundInfoAction_toAdd";
			setTimeout("detailForm.submit()", 100);
		}
		
		function fundInfoAction_delete() {
			if(document.getElementById("selectAll").checked) {
				if (confirm("您确信要删除所有选中的基金产品吗？")) {
					qryForm.action = "fundInfoAction_delete";
					setTimeout("qryForm.submit()", 100);
				}

			}else {
				var paramArr = ""
				var checkList = document.getElementsByName("item");
				for (var i = 0; i < checkList.length; i++) {
					if (checkList[i].checked) {
						paramArr = paramArr + checkList[i].value + ",";
					}
				}
				if(paramArr == ""){
					alert("请选择要删除的基金产品！")
					return;
				}else{
					if (confirm("您确信要删除所有选中的基金产品吗？")) {
						detailForm.action = "fundInfoAction_delete";
						detailForm.prodIdStr.value = paramArr.substring(0,paramArr.length-1);
						setTimeout("detailForm.submit()", 100);
					}
				}
				
			}
		}
		
		
		function fundInfoAction_toModi() {
			selectedRecord("修改","fundInfoAction_toModi");
		}
		
		function fundInfoAction_toCheck() {
			selectedRecord("复核","fundInfoAction_toCheck");
		}
		
		function selectedRecord(param1,param2){
			var prod_id= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					prod_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要"+ param1 + "的基金产品！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个基金产品进行"+ param1 +"！")
				return;
			}
			
			detailForm.action = param2;
			detailForm.prodIdStr.value = prod_id;
			setTimeout("detailForm.submit()", 100);
		}
		
	</script>
</body>
</html>
