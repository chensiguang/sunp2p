<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>查询p2p产品</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	P2P网络贷款产品信息设置	
    </div>
    <form id="p2pQuery" action="p2pInfoAction_toQuery" method="post" name="qryForm">
    <ul id="mainAction" class="main-actions clearfix">
    	<li>
    		<label>产品类型：</label> 
			<select class="select" name="p2pInfo.prod_type" id="prod_type">
				<option value="">不选</option>
				<c:forEach items="${K_PRODTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('prod_type').value='${p2pInfo.prod_type}'
			</script>
    	</li>
    	<li>
    		<label>产品状态：</label>
			<select class="select" name="p2pInfo.prod_state" id="prod_state">
				<option value="">不选</option>
				<c:forEach items="${K_PRODSTATE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('prod_state').value='${p2pInfo.prod_state}'
			</script>
    	</li>
    	<li>
    		<label>风险等级：</label>
    		<select class="select" name="p2pInfo.risk_lvl" id="risk_lvl">
    			<option value="">不选</option>
				<c:forEach items="${K_RISKLVL}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('risk_lvl').value='${p2pInfo.risk_lvl}'
			</script>
    	</li>
    	<li>
    		<label>发布状态：</label>
    		<select class="select" name="p2pInfo.issue_state" id="issue_state">
    			<option value="">不选</option>
				<c:forEach items="${K_ISSUESTATE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select> 
			<script type="text/javascript">
				document.getElementById('issue_state').value='${p2pInfo.issue_state}'
			</script>
    	</li>
    	<li>
    		<label>基金代码：</label>
    		<input class="text" name="p2pInfo.prod_id" type="text" value='${p2pInfo.prod_id}' />
    	</li>
    	<li>
    		<label>基金名称：</label>
    		<input class="text" name="p2pInfo.prod_name" type="text" value='${p2pInfo.prod_name}' />
    	</li>
    	<li>
    		<label>首页推荐：</label>
    		<select class="select" name="p2pInfo.hpage_promoted" id="hpage_promoted">
    			<option value="">不选</option>
				<c:forEach items="${K_HPAGEPROMOTED}" var="rst">
					<option value ="${rst.val}">${rst.prompt}</option>
				</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('hpage_promoted').value='${p2pInfo.hpage_promoted}'
				</script>
    	</li>  	
    </ul>
    </form>
    <div class="toolBar">
    	<span class="toolbar-icon"></span>
    	P2P网络贷款产品信息
    	<div class="privileges" id="myPrivileges">
    	</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>产品名称</th>
				<th>年化收益率</th>
				<th>产品周期</th>
				<th>产品起息日</th>
				<th>产品到期日</th>
				<th>产品状态</th>
				<th>发布状态</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td align="center"><input type="checkbox" name="item" value="${rst.prod_id}"/></td>
				<td>${rst.prod_type}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.prod_name}</td>
				<td>${rst.ist_year}</td>
				<td>${rst.cycle}</td>
				<td>${rst.value_date}</td>
				<td>${rst.expire_date}</td>
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
				<form action="p2pInfoAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
				</div>
				<div class="page-num">${page.toolbarHtml}</div>
			</div>
		</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="p2pInfoAction_toQuery"/>
			${paramCover.coveredInputs}
	</form>	
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "p2pInfoAction_getButton",
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
		
		function p2pInfoAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function p2pInfoAction_toAdd() {
			detailForm.action = "p2pInfoAction_toAdd";
			setTimeout("detailForm.submit()", 100);
		}
		
		function p2pInfoAction_delete() {
			if(document.getElementById("selectAll").checked) {
				if (confirm("您确信要删除所有选中的p2p产品吗？")) {
					qryForm.action = "p2pInfoAction_delete";
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
					alert("请选择要删除的p2p产品！")
					return;
				}else{
					if (confirm("您确信要删除所有选中的p2p产品吗？")) {
						detailForm.action = "p2pInfoAction_delete";
						detailForm.prodIdStr.value = paramArr.substring(0,paramArr.length-1);
						setTimeout("detailForm.submit()", 100);
					}
				}
				
			}
		}
		
		
		function p2pInfoAction_toModi() {
			selectedRecord("修改","p2pInfoAction_toModi");
		}
		
		function p2pInfoAction_toCheck() {
			selectedRecord("复核","p2pInfoAction_toCheck");
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
				alert("请选择要"+ param1 + "的p2p产品！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个p2p产品进行"+ param1 +"！")
				return;
			}
			
			detailForm.action = param2;
			detailForm.prodIdStr.value = prod_id;
			setTimeout("detailForm.submit()", 100);
		}
		
	</script>
</body>
</html>
