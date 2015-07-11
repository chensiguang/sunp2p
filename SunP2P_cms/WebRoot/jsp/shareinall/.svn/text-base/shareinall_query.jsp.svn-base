<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>用户份额查询</title>
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
       	用户份额查询	
    </div>
	<form action="shareInallAction_toQuery" id="transInfo" method="post" name="qryForm">
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>电子账户：</label>
			<input class="text" name="eacc_no" type="text" value='${para.eacc_no}' />
		</li>
		<li>
			<label>账户类型：</label>
			<select class="select" name="acc_type" id="acc_type">
				<option value="">全部</option>
				<c:forEach items="${K_ACCOUNTTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('acc_type').value='${para.acc_type}';				
			</script>
		</li>
		<li>
			<label>产品类型：</label>
			<select class="select" name="prod_type" id="prod_type">
				<option value="">全部</option>
				<c:forEach items="${K_PRODTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById('prod_type').value='${para.prod_type}';			
			</script>
		</li>
		<li>
			<label>产品代码：</label>
			<input class="text" name="prod_id"  value='${para.prod_id}'/>
		</li>
		
		<li>
			<label>变动日期：</label>
			<input class="text" name="last_date" type="text" value='${para.last_date}' onfocus="WdatePicker()" />
		</li>
	</ul>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		用户份额查询信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll"/></th>
				<th>电子账号</th>
				<th>账户类型</th>
				<th>账户</th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>产品持有份额</th>
				<th>可用份额</th>
				<th>已兑付收益</th>
				<th>预计总收益</th>
				<th>冻结份额</th>
				<th>长期冻结份额</th>
				<th>最终变动日期</th>
			</tr>
		<c:forEach items="${page.result}" var="rst">
			<tr ondblclick="dosubmit('${rst.eacc_no},${rst.prod_id}')">			
				<td align="center"><input type="checkbox" name="item" value="${rst.eacc_no},${rst.prod_id}"/></td>
				<td>${rst.eacc_no}</td>
				<td>${rst.acc_type}</td>
				<td>${rst.account}</td>
				<td>${rst.prod_type}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.tot_vol}</td>
				<td>${rst.use_vol}</td>
				<td>${rst.payed_val}</td>
				<td>${rst.tot_val}</td>
				<td>${rst.frozen_vol}</td>
				<td>${rst.long_frozen_vol}</td>
				<td>${rst.last_date}</td>
			</tr> 
		</c:forEach>
		<c:if test="${empty page.result}">
			<tr>
				<td height="25" colspan="13" align="center">无相关信息</td>
			</tr>
		</c:if>
		</table>
	<div class="page-tag clearfix">
		<div  class="float-l">
			<form action="shareInallAction_toQuery" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs} ${page.footerHtml}
			</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	</div>
	<form action="shareInallAction_fixedAssets" name="detailForm" method="post">
		<input type="hidden" name="eacc_no" />
		<input type="hidden" name="prod_id" />
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "shareInallAction_getButton",
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
		function shareInallAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function shareInallAction_fixedAssets() {
			setTimeout("detailForm.submit()", 100);
		}	
		function shareListAction_toQuery() {
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
				alert("请选择要一项进行明细查询！");
				return;
			}
			
			if(selectedCount > 1){
				alert("每次只能选择一项进行明细查询！")
				return;
			}
			dosubmit(prod_id);
		}
		
		function dosubmit(prod_id){
			detailForm.action = "shareListAction_toQuery";
			detailForm.eacc_no.value = prod_id.slice(0,prod_id.indexOf(","));
			detailForm.prod_id.value = prod_id.slice(prod_id.indexOf(",")+1);
			setTimeout("detailForm.submit()", 100);
		}
	</script>
</body>
</html>
