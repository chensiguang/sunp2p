<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>产品销售统计</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	产品销售统计	
    </div>
	<form action="capitalInfoAction_toQuery" id="capitalInfo" method="post" name="qryForm" >
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>报表类型：</label>
				<select class="select" name="report_type" id="report_type" onchange="initBeginAndEndtime();">
				<c:forEach items="${K_REPORTTYPE}" var="rst">
					<option value="${rst.val}">${rst.prompt}</option>
				</c:forEach>
				</select>
				<script type="text/javascript">
					if('${para.report_type}' == null || '${para.report_type}' == ''){
						document.getElementById('report_type').value = '${defult_report_type}';
					}else{
						document.getElementById('report_type').value='${para.report_type}'
					}					
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
					if('${para.prod_type}' == null || '${para.prod_type}' == ''){
						document.getElementById('prod_type').value = '';
					}else{
						document.getElementById('prod_type').value='${para.prod_type}'
					}				
				</script>
			</li>
			<li>
				<label>产品代码：</label>
				<input class="text" name="prod_id" type="text" value='${para.prod_id}' />
			</li>
			<li>
				<label>产品名称：</label>
				<input class="text" name="prod_name" type="text" value='${para.prod_name}' /> 
			</li>
			<li>
				<label>起始日期：</label>
				<input class="text" name="start_time" id="start_time"  type="text" value='${para.start_time}' onfocus="WdatePicker()" />
			</li>
			<li>
				<label>截止日期：</label>
				<input class="text" name="end_time" id="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" />
			</li>
			<!-- <li>
				<span style="display:inline-block;" class='sch-button' onclick="$('#capitalInfo').submit()">查询</span>&nbsp;
			</li> -->
		</ul>
		<div class="toolBar">
			<span class="toolbar-icon"></span>
			产品销售统计
			<div class="privileges" id="myPrivileges">
				<!-- <a class="button" href="javascript:toExport();">下载</a>&nbsp; -->
			</div>
		</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th><span id="showName">统计月份</span></th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>产品名称</th>
				<th>交易渠道</th>
				<th>交易笔数</th>
				<th>交易金额</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.date_type}</td>
				<td>${rst.prod_type}</td>
				<td>${rst.prod_id}</td>
				<td>${rst.prod_name}</td>
				<td>${rst.trans_channel}</td>
				<td>${rst.total_count}</td>
				<td>${rst.sum_amount}</td>
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="8" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="capitalInfoAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<input type="hidden" id="todayStr" value="<%=com.sunyard.directbank.tools.DateUtil.todayStr()%>"/>
	<input type="hidden" id="currMonthFirstDay" value="<%=com.sunyard.directbank.tools.DateUtil.getMonthFirstDay()%>"/>
	<input type="hidden" id="currYearFirstDay" value="<%=com.sunyard.directbank.tools.DateUtil.getCurrYearFirst()%>"/>
	
	<form action="capitalInfoAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "capitalInfoAction_getButton",
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
		
		initReportDateName();
		})
		
	function initReportDateName(){
		var curr_type = document.getElementById('report_type').value;
		var curr_name = document.getElementById("showName");
		if(curr_type == "1"){
			curr_name.innerHTML = "统计日期";
		}else if(curr_type == "2"){
			curr_name.innerHTML = "统计月份";
		}else if(curr_type == "3"){
			curr_name.innerHTML = "统计年份";
		}else{
			curr_name.innerHTML = "统计月份";
		}
	}	
	
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
		
		function initBeginAndEndtime(){
			var reportType = document.getElementById('report_type').value;
			var beginTime = document.getElementById('start_time');
			var endTime = document.getElementById('end_time');
			var todayStr = document.getElementById('todayStr').value;
			endTime.value = todayStr;
			if(reportType == <%= com.sunyard.directbank.enums.REPORTTYPE.Day.getCode()%>){
				beginTime.value = todayStr;
			}else if(reportType == <%= com.sunyard.directbank.enums.REPORTTYPE.Month.getCode()%>){
				beginTime.value = document.getElementById('currMonthFirstDay').value;
			}else if(reportType == <%= com.sunyard.directbank.enums.REPORTTYPE.Year.getCode()%>){
				beginTime.value = document.getElementById('currYearFirstDay').value;
			}
		}
		
		function capitalInfoAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function capitalInfoAction_fixedAssets() {
			setTimeout("detailForm.submit()", 100);
		}
		
		
		
	</script>
</body>
</html>
