<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>权限</title>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//获取用户的权限
	$.ajax({
		type : "post",
		url : "privilegeAction_getButton",
		//data: {privilege_id:$("#privilege_id").val()},
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
</script>
</head>

<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	权限管理	
    </div>
	<form action="privilegeAction_selectAllPrivileges" method="post" >
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>权限代码：</label> 
			<input class="text" type="text" value="${param.privilege_id}" name="privilege_id" id="privilege_id" />
		</li>
		<li>
			<label>权限名称：</label> 
			<input class="text" type="text" value="${param.privilege_name}" name="privilege_name" id="privilege_name" />		
		</li>
	</ul>
	</form>
	
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		权限管理列表
		<div class="privileges" id="myPrivileges">
			<!-- 在此显示权限按钮 -->
       	</div>
    </div>
	 <table cellspacing="0" cellpadding="0" border="1" class="data-content" style="margin-left:0; border-left:0; border-right:0;">
       
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
            	<th class="checkBox">
            		<input type="checkbox" id="selectAll" onclick="selectAll()"/>	
				</th>
            	<th>权限代码</th>
				<th>权限名称</th>
				<th>父ID</th>
				<th>父权限</th>
				<th>URL</th>
            </tr>
        </thead>
		<tbody id="TableData">
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="privileges" value="${rst.privilege_id}"/></td>
		        	<td>${rst.privilege_id}</td>
		        	<td>${rst.privilege_name}</td>
		        	<td>${rst.parent_id}</td>
		        	<td>${rst.parent_PriName}</td>
		        	<td>${rst.url}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="10" align="center">无相关信息</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<div class="page-tag clearfix">
		<div style="float:left">
		<form action="privilegeAction_selectAllPrivileges" method="post" name="listForm">
			<input type="hidden" name="pageNo"/>
			${paramCover.unCoveredForbidInputs } ${page.footerHtml}
		</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="privilegeAction_selectAllPrivileges"/>
			${paramCover.coveredInputs}
	</form>
	<script type="text/javascript">
		var checkedLists = $("input[name='privileges']");
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
	
		function privilegeAction_selectPrivilege() {
			document.forms[0].submit();
		}
		
		function privilegeAction_addPrivilegeUI() {
			$.layer({
		        type: 2,
		        title: '添加权限',
		        maxmin: false,
		        area : ['400px' , '260px'],
		        offset : ['', ''],
		        iframe: {src: 'privilegeAction_addPrivilegeUI'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='privilegeAction_selectAllPrivileges';
		        }
		    });
		}
		
		function privilegeAction_updatePrivilegeUI() {
			var privilege_id= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("privileges");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					privilege_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要修改的权限！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个权限进行修改！")
				return;
			}
			$.layer({
		        type: 2,
		        title: '修改权限',
		        maxmin: false,
		        area : ['400px' , '260px'],
		        offset : ['', ''],
		        iframe: {src: 'privilegeAction_updatePrivilegeUI?privilege_id='+privilege_id},
		        close: function(index){
		            parent.frames['${frame}'].location.href='privilegeAction_selectAllPrivileges';
		        }
		    });
		}
		
		function privilegeAction_deletePrivilege() {
			var privilege_id = "";
			var checkedList = document.getElementsByName("privileges");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					
					privilege_id = privilege_id + checkedList[i].value + ",";
				}
			}
			if(privilege_id == "") {
				alert("请选择需要删除的权限！");
				return;
			}else {
				if(confirm("确定要删除选中的权限吗？")) {
					window.location.href = "privilegeAction_deletePrivilege()?privilege_id=" + privilege_id;
				}
			}
			
		}
	</script>
</body>
</html>
