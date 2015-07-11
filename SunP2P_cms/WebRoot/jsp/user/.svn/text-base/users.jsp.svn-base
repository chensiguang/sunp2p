<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>用户</title>
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "userAction_getButton",
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
       	用户管理	
    </div>
	<form action="userAction_selectAllUsers" method="post" >
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>用户ID：</label>
			<input class="text" type="text" value="${param.user_id}" name="user_id" id="user_id" />
		</li>
		<li>
			<label>用户名称：</label> 
			<input class="text" type="text" value="${param.user_name}" name="user_name" id="user_name" />
		</li>
		<li>
			<label>用户状态：</label> 
			<select class="select" name="user_state">
				<option value="">==请选择用户状态==</option>
				<c:forEach items="${K_USERSTATE}" var="rst" >
					<option value="${rst.val}" <c:if test="${rst.val eq param.user_state}">selected</c:if> >${rst.prompt}</option>
				</c:forEach>
			</select>
		</li>
		<li>
			<label>所属机构：</label> 
			<select class="select" name="department_id" id="department_id">
				<option value="">==请选择机构==</option>
				<c:forEach items="${departmentTree}" var="rst">
					<option value="${rst.department_id}" <c:if test="${rst.department_id eq param.department_id}">selected</c:if> > ${rst.department_name}</option>
				</c:forEach>
			</select>
		</li>
	</ul>
	</form>
    <div class="toolBar">
    	<span class="toolbar-icon"></span>
    	用户管理列表
        <!-- 在此显示页面权限按钮 -->
        <div class="privileges" id="myPrivileges">
        </div>
	</div>
	
    <div id="scrollDiv" style="width: 100%; overflow-y: auto; height: 100%;">
		<table class="data-content" width="100%" border="1" cellpadding="0" cellspacing="0">
			<thead>
				<tr align="center" valign="middle" id="TableData">
					<th class="checkBox"><input type="checkbox" id="selectAll" onclick="selectAll()"/></th>
					<th>用户ID</th>
					<th>用户姓名</th>
					<th>用户密码</th>
					<th>用户类型</th>
					<th>用户状态</th>
					<th>用户创建时间</th>
					<th>密码修改时间</th>
					<th>用户说明</th>
					<th>所属机构</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.result}" var="rst">
					<tr style="text-align: center;">
						<td><input type="checkbox" name="users" value="${rst.user_id}"/></td>
			        	<td>${rst.user_id}</td>
			        	<td>${rst.user_name}</td>
			        	<td>${rst.user_pwd}</td>
			        	<td>${rst.user_type}</td>
			        	<td>${rst.user_state}</td>
			        	<td>${rst.create_date}</td>
			        	<td>${rst.pwd_modify_date}</td>
			        	<td>${rst.user_desc}</td>
			        	<td>${rst.department_name}</td>
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
			<form action="userAction_selectAllUsers" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs } ${page.footerHtml}
			</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
	</div>
	<form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="userAction_selectAllUsers"/>
			${paramCover.coveredInputs}
	</form>	
	<script type="text/javascript">
	function formsubmit() {
		detailForm.action='userAction_selectAllUsers';
		detailForm.submit();
	}
	var checkedLists = $("input[name='users']");
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
		function userAction_selectUser() {
			document.forms[0].submit();
		}
		
		function userAction_addUserUI() {
			$.layer({
		        type: 2,
		        title: '添加用户',
		        maxmin: false,
		        area : ['500px' , '340px'],
		        offset : ['', ''],
		        iframe: {src: 'userAction_addUserUI'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
		        }
		    });
		}
		
		function userAction_updateUserUI() {
			selectedRecord("修改","userAction_updateUserUI?user_id=","420px","355px");
		}
		
		function userAction_lockUser() {
			var user_id = "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("users");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					user_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要锁定的用户！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个用户进行锁定！");
				return;
			}
			if(confirm('确定要锁定用户吗？')) {
				$.layer({
			        type: 2,
			        title: '添加用户',
			        maxmin: false,
			        area : ['500px' , '340px'],
			        offset : ['', ''],
			        iframe: {src: "userAction_lockUser?user_id="+user_id},
			        close: function(index){
			            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
			        }
			    });
			}
		}
		
		function userAction_unlockUser() {
			var user_id = "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("users");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					user_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要解锁的用户！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个用户进行解锁！");
				return;
			}
			if(confirm('确定要解锁用户吗？')) {
				$.layer({
			        type: 2,
			        title: '添加用户',
			        maxmin: false,
			        area : ['500px' , '370px'],
			        offset : ['', ''],
			        iframe: {src: "userAction_unlockUser?user_id="+user_id},
			        close: function(index){
			            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
			        }
			    });
			}
		}
		
		function userAction_updatePwdUI() {
			selectedRecord("密码修改","userAction_updatePwdUI?user_id=","400px","260px");
		}
		
		function userAction_resetPwd() {
			var user_id = "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("users");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					user_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要密码重置的用户！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个用户进行密码重置！");
				return;
			}
			if(confirm("确定要重置密码为888888吗？")) {
				$.layer({
			        type: 2,
			        title: '添加用户',
			        maxmin: false,
			        area : ['500px' , '340px'],
			        offset : ['', ''],
			        iframe: {src: "userAction_resetPwd?user_id="+user_id},
			        close: function(index){
			            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
			        }
			    });
			}
		}
		
		function userAction_roleDistbUI() {
			selectedRecord("角色分配","userAction_roleDistbUI?user_id=","750px","405px");
		}
		
		function userAction_deleteUser() {
			var user_id = "";
			var checkedList = document.getElementsByName("users");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					user_id = user_id + checkedList[i].value + ",";
				}
			}
			if(user_id == "") {
				alert("请选择需要删除的用户！");
				return;
			}else {
				if(confirm("确定要删除选中的用户吗？")) {
					$.layer({
				        type: 2,
				        title: '添加用户',
				        maxmin: false,
				        area : ['500px' , '340px'],
				        offset : ['', ''],
				        iframe: {src: "userAction_deleteUser?user_id=" + user_id},
				        close: function(index){
				            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
				        }
				    });
				}
			}
		}
		
		function selectedRecord(button,url,width,height){
			var user_id = "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("users");
			var checkList1 = document.getElementsByName("pageNo")[0].value;
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					user_id = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要"+ button + "的用户！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个用户进行"+ button +"！")
				return;
			}
			$.layer({
		        type: 2,
		        title: button,
		        maxmin: false,
		        area : [width , height],
		        offset : ['', ''],
		        iframe: {src: url+user_id+"&privilege_id="+$("#privilege_id").val()},
		        close: function(index){
		            parent.frames['${frame}'].location.href='userAction_selectAllUsers';
		        }
		    });
		}
	</script>
</body>
</html>
