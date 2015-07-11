<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/jsp/public/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>查询返回码</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
	<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
	<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
	<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
	<style>
	
	</style>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	返回码查询	
    </div>
	<form id="form" action="returnCodeAction_toQuery" method="post" name="qryForm" >
		
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>返回码：</label>
				<input class="text" name="returnCode.return_code" type="text"  />
			</li>
			<li>
				<label>返回信息：</label>
				<input class="text" name="returnCode.return_msg" type="text"  />
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		返回码信息
		<div class="privileges" id="myPrivileges">
		</div>
	</div>
	<div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th class="checkBox"><input type="checkbox" onclick="selectAll()" id="selectAll" /></th>
				<th>返回码</th>
				<th>返回信息</th>
			</tr>
			<c:forEach items="${page.result}" var="rst">
				<tr>
					<td align="center"><input type="checkbox" name="item" value="${rst.return_code}"/></td>
					<td align="center">${rst.return_code}</td>
					<td align="center">${rst.return_msg}</td>			
				</tr> 
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="3" align="center">无相关信息</td>
				</tr>
			</c:if>
		</table>
		<div class="page-tag clearfix">
			<div class="float-l">
				<form action="returnCodeAction_toQuery" method="post" name="listForm">
					<input type="hidden" name="pageNo"/>
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
				</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="paramIdStr" />
		<input type="hidden" name="_backUrl" value="returnCodeAction_toQuery"/>
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
			url : "returnCodeAction_getButton",
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
		});
		
		 function returnCodeAction_toQuery() {
			setTimeout("qryForm.submit()", 100);
			return false;
		}


        function returnCodeAction_delete() {
			if(document.getElementById("selectAll").checked) {
				if (confirm("您确信要删除所有选中的返回码吗？")) {
					detailForm.action = "returnCodeAction_delete";
					setTimeout("detailForm.submit()", 100);
				}
			}else {
				var paramArr = "";
				var checkList = document.getElementsByName("item");
				for (var i = 0; i < checkList.length; i++) {
					if (checkList[i].checked) {
						paramArr = paramArr + checkList[i].value + ",";
					}
				}
				if(paramArr == ""){
					alert("请选择要删除的返回码！");
					return;
				}else{
					if (confirm("您确信要删除所有选中的返回码吗？")) {
						detailForm.action = "returnCodeAction_delete?return_code=" + paramArr;
						detailForm.paramIdStr.value = paramArr.substring(0,paramArr.length-1);
						setTimeout("detailForm.submit()", 100);
					}
				}
				
			}
		}      
      
		function returnCodeAction_toAdd() {
			$.layer({
		        type: 2,
		        title: "增加返回码",
		        maxmin: false,
		        area : ['410px' , '270px'],
		        offset : ['', ''],
		        iframe: {src: 'returnCodeAction_toAdd'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='returnCodeAction_toQuery';
		        }
		    });
		}
		
		function returnCodeAction_toModi() {
			selectedRecord("修改","returnCodeAction_toModi");
		}
		function selectedRecord(button,url){
			var return_code= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("item");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					return_code = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要"+ button + "的返回码！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个返回码进行"+ button +"！");
				return;
			}
			
			$.layer({
		        type: 2,
		        title: button,
		        maxmin: false,
		        area : ['410px' , '270px'],
		        offset : ['', ''],
		        iframe: {src: url+"?return_code="+return_code},
		        close: function(index){
		            parent.frames['${frame}'].location.href='returnCodeAction_toQuery';
		        }
		    });
		}
	</script>
</body>
</html>
