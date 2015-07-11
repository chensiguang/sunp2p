<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>开户量统计</title>
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
       	开户量统计	
    </div>
	<form action="eacCountAction_toQuery" id="eacCount" method="post" name="qryForm" >
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
				<label>起始日期：</label>
				<input class="text" name="start_time" id="start_time"  type="text" value='${para.start_time}' onfocus="WdatePicker()" />
			</li>
			<li>
				<label>截止日期：</label>
				<input class="text" name="end_time" id="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" /> 
			</li>
		</ul>
		<div class="toolBar">
			<span class="toolbar-icon"></span>
			开户量统计
			<div class="privileges" id="myPrivileges">
			</div>
		</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th><span id="showName">统计月份</span></th>
				<th>开户总人数</th>
				<th>本行用户数</th>
				<th>他行用户数</th>
				<th>绑定本行卡数量</th>
				<th>绑定他行卡数量</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.date_type}</td>
				<td>${rst.tot_num}</td>
				<td>${rst.mybank_num}</td>
				<td>${rst.othbank_num}</td>
				<td>${rst.mybank_card_num}</td>
				<td>${rst.othbank_card_num}</td>
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
				<form action="eacCountAction_toQuery1" method="post" name="listForm">
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
	
	<form action="eacCountAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	//获取用户的权限
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "eacCountAction_getButton",
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
		
		function eacCountAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function eacCountAction_fixedAssets() {
			setTimeout("detailForm.submit()", 100);
		}
		
		
		
	</script>
</body>
</html>
