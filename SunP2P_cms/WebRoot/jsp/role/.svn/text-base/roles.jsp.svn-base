<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>roles</title>
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//获取角色的权限
		$.ajax({
			type : "post",
			url : "roleAction_getButton",
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
						searchHtml += "<li><span class='sch-button' onclick='"+list.url+"()'>查询</span></li>";
					}else{
						privilegeHtml += "<a class='button' onclick='"+list.url+"()"+"'>"+list.privilege_name+"</a>"+"&nbsp;";
					}
				})
				$("#myPrivileges").html(privilegeHtml);
				$("#mainAction").html(searchHtml);
			}
		});
	})
</script>
</head>

<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	 角色管理	
    </div>
	<form action="roleAction_selectAllRoles" method="post" >
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>角色ID：</label> 
			<input class="text" type="text" value="${param.role_id}" name="role_id" id="role_id" />
		</li>
		<li>
			<label>角色名称：</label> 
			<input class="text" type="text" value="${param.role_name}" name="role_name" id="role_name" />
		</li>
	</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		角色管理信息
		<div class="privileges" id="myPrivileges">
       		<!-- 在此显示页面权限按钮 -->
		</div>
    </div>
	<table cellspacing="0" cellpadding="0" border="1" class="data-content" style="margin-left:0; border-left:0; border-right:0;">
		<thead>
			<tr align="center" valign="middle" id="TableData">
				<th class="checkBox">
					<input type="checkbox" id="selectAll" onclick="selectAll()"/>	
				</th>
				<th>角色ID</th>
				<th>角色名称</th>
				<th>角色说明</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="roles" value="${rst.role_id}"/></td>
		        	<td>${rst.role_id}</td>
		        	<td>${rst.role_name}</td>
		        	<td>${rst.role_desc}</td>
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
		<div  class="float-l">
		<form action="roleAction_selectAllRoles" method="post" name="listForm">
			<input type="hidden" name="pageNo"/>
			${paramCover.unCoveredForbidInputs } ${page.footerHtml}
		</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="roleAction_selectAllRoles"/>
			${paramCover.coveredInputs}
	</form>
	<script type="text/javascript">
	var checkedLists = $("input[name='roles']");
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
	
		function roleAction_selectRole() {
			document.forms[0].submit();
		}
		
		function roleAction_addRoleUI() {
			$.layer({
		        type: 2,
		        title: '添加角色',
		        maxmin: false,
		        area : ['400px' , '260px'],
		        offset : ['', ''],
		        iframe: {src: 'roleAction_addRoleUI'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='roleAction_selectAllRoles';
		        }
		    });
		}
		
		function roleAction_updateRoleUI() {
			selectedRecord("修改","roleAction_updateRoleUI?role_id=");
		}
		
		function roleAction_privilegeDistbUI() {
			var role_id= "";
			var url="roleAction_privilegeDistbUI?role_id=";
			var selectedCount = 0;
			var checkList = document.getElementsByName("roles");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					role_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要权限分配的角色！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个角色进行权限分配！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '权限分配',
		        maxmin: false,
		        area : ['750px' , '405px'],
		        offset : ['', ''],
		        iframe: {src: url+role_id+"&privilege_id="+$("#privilege_id").val()},
		        close: function(index){
		            parent.frames['${frame}'].location.href='roleAction_selectAllRoles';
		        }
		    });
		}
		
		function roleAction_deleteRole() {
			var role_id = "";
			var checkedList = document.getElementsByName("roles");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					role_id = role_id + checkedList[i].value + ",";
				}
			}
			if(role_id == "") {
				alert("请选择要删除的角色！");
				return;
			}else {
				if(confirm("确定要删除选中的角色吗？")) {
					window.location.href = "roleAction_deleteRole?role_id=" + role_id+"&privilege_id="+$("#privilege_id").val();
				}
			}
		}
		
		function selectedRecord(button,url){
			var role_id= "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("roles");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					role_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要"+ button + "的角色！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个角色进行"+ button +"！");
				return;
			}
			$.layer({
		        type: 2,
		        title: button,
		        maxmin: false,
		        area : ['400px' , '260px'],
		        offset : ['', ''],
		        iframe: {src: url+role_id+"&privilege_id="+$("#privilege_id").val()},
		        close: function(index){
		            parent.frames['${frame}'].location.href='roleAction_selectAllRoles';
		        }
		    });
			//window.location.href=url+role_id+"&privilege_id="+$("#privilege_id").val();
		}
	</script>
</body>
</html>
