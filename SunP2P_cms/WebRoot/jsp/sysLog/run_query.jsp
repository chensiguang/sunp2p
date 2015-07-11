<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>运行日志查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	系统运行日志查询	
    </div>
	<form action="sysLogAction_toQuery" id="sysLog" method="post" name="qryForm">
		<ul class="main-actions clearfix" id="mainAction">
			<li>
				<label>起始日期：</label>
				<input class="text" name="start_time" type="text" value='${para.start_time}' onfocus="WdatePicker()" /> 
			</li>
			<li>
				<label>截止日期：</label>
				<input class="text" name="end_time" type="text" value='${para.end_time}' onfocus="WdatePicker()" />
			</li>
			<li>
				<label>系统：</label>
				<c:forEach items="${K_SYSTEMTYPE}" var="rst">
					<input name="system_type_name" type="checkbox" value ="${rst.val}" />${rst.prompt}
				</c:forEach>
				<input type="hidden" name="system_type" id="system_type_hidden" value="${para.system_type}" />
				<script type="text/javascript">
					var initVal = document.getElementById("system_type_hidden").value;
					var flag = false;
					if(initVal == null || initVal == ""){
						flag = true;
					}
					var obj = document.getElementsByName("system_type_name");
					if(flag){
						for(var i=0;i<obj.length;i++){  
							obj[i].checked = 1;
							}
						}else{
							for(var i=0;i<obj.length;i++){
								if(obj[i].value == initVal){
									obj[i].checked = 1;
								}
											
							 }
						}     
				</script>
			</li>
			<!-- <li>
				<span style="display:inline-block;" class='sch-button' onclick="$('#sysLog').submit()">查询</span>
			</li> -->
		</ul>
		<div class="toolBar">
			<span class="toolbar-icon"></span>
			系统运行日志列表
			<div class="privileges" id="myPrivileges">
				<!-- <a class="button" href="javascript:toExport();">下载</a>&nbsp; -->
			</div>
		</div>
	</form>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>日期</th>
				<th>系统</th>
				<th>系统动作</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
			<tr>
				<td>${rst.run_time}</td>
				<td>${rst.system_type}</td>
				<td>${rst.system_action}</td>
			</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="4" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="sysLogAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<input type="hidden" id="month_inv" value='${month_inv}' />
	<form action="sysLogAction_fixedAssets" name="detailForm" method="post">
		${paramCover.unCoveredForbidInputs }
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "sysLogAction_getButton",
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
		function getCheckBoxVal(){
			var obj = document.getElementsByName("system_type_name");
			var count = 0;
			var paraVal = "";
            for(var i=0;i<obj.length;i++){  
                 if(obj[i].checked) {
                	 count = count + 1;
                	 paraVal = obj[i].value;
                 }
            }
            
            if(count == 0){
            	alert("请选择查询的系统类型！")
            	return;
            }
            
            if(count == obj.length){
            	paraVal = ""
            }
            
            document.getElementById("system_type_hidden").value = paraVal;
		}
		
		function sysLogAction_toQuery() {
			getCheckBoxVal();
			setTimeout("qryForm.submit()", 100);
			return false;
		}
		
		function sysLogAction_fixedAssets() {
			setTimeout("detailForm.submit()", 100);
		}
		
		
		
	</script>
</body>
</html>
