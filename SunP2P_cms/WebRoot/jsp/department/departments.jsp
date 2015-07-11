<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>机构</title>
<link rel="stylesheet" type="text/css" href="${ctx}/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/main-css/dtree.css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/dtree/dtree_dept.js"></script>
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript">
	<%-- 显示权限按钮 --%>
	$(document).ready(function() {
		//获取机构的权限
		$.ajax({
			type : "post",
			url : "departmentAction_getButton",
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

<body class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north'" style="border:0; overflow:visible;">
	<div class="main-title" id="Title"><!--页面标题-->
       	机构管理	
    </div>
	<form action="departmentAction_selectAllDepartments" method="post" >
	<ul id="mainAction" class="main-actions clearfix">
		<li>
			<label>机构代码：</label> 
			<input class="text" type="text" value="${param.department_id}" name="department_id" id="department_id" />
		</li>
		<li>
			<label>机构名称：</label> 
			<input class="text" type="text" value="${param.department_name}" name="department_name" id="department_name" />
		</li>	
	</ul>	
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>
		机构管理列表
		<div class="privileges" id="myPrivileges">
       		<!-- 在此显示页面权限按钮 -->
		</div>
    </div>
    </div>
    <div data-options="region:'west',split:true" id="area_treeboxreagent_tree" style="width:200px;background:#f7f9f9; border-left:0;">
			<script type="text/javascript">
					<%-- 显示机构树 --%>
					d = new dTree("d");
					<% String strTree = (String)request.getAttribute("departmentTree");
						out.println(strTree); 
					%>
					document.write(d);
			</script>
    </div>
    <div data-options="region:'center'" id="area">
	 <table cellspacing="0" cellpadding="0" border="1" class="data-content" style="margin-left:0; border-left:0; border-right:0;">      
        <thead>
            <tr align=center valign=middle>
            	<th class="checkBox">
					<input type="checkbox" id="selectAll" onclick="departmentCheckedAll()"/>
				</th>
            	<th>机构代码</th>
				<th>机构名称</th>
				<th>机构级别</th>
				<th>上级机构</th>
				<th>说明</th>
				<th>父ID</th>
            </tr>
        </thead>
		<tbody id="TableData">
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="departments" value="${rst.department_id}"/></td>
		        	<td>${rst.department_id}</td>   	
		        	<td>${rst.department_name}</td>	
		        	<td>${rst.department_level}</td>
		        	<td>${rst.parent_depName}</td>
		        	<td>${rst.department_desc}</td>
		        	<td>${rst.parent_id}</td>
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
			<form action="departmentAction_selectAllDepartments" method="post" name="listForm">
				<input type="hidden" name="pageNo"/>
				${paramCover.unCoveredForbidInputs } ${page.footerHtml}
			</form>
			</div>
			<div class="page-num">${page.toolbarHtml}</div>
		</div>
		<form method="post" name="detailForm">
			<input type="hidden" name="prodIdStr" />
			<input type="hidden" name="_backUrl" value="departmentAction_selectAllDepartments"/>
				${paramCover.coveredInputs}
		</form>
    </div>
    
	<script type="text/javascript">
		var checkedLists = $("input[name='departments']");
		for(var i = 0; i < checkedLists.length; i++) {
			checkedLists.eq(i).click(function(){
				if($(this).is(":checked")){
					$(this).parent().parent().addClass("checkedTr");	
				}else{
					$(this).parent().parent().removeClass("checkedTr");
				}
			});
		};
		
		function departmentCheckedAll(){
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
		
		function departmentAction_selectDepartment() {
			document.forms[0].submit();
		}
		
		function departmentAction_addDepartmentUI() {
			$.layer({
			        type: 2,
			        title: '添加机构',
			        maxmin: false,
			        area : ['400px' , '260px'],
			        offset : ['', ''],
			        iframe: {src: 'departmentAction_addDepartmentUI'},
			        close: function(index){
			            parent.frames['${frame}'].location.href='departmentAction_selectAllDepartments';
			        }
			    });
		}
	
		function departmentAction_deleteDepartment() {
			var departmentid = "";
			var checkedList = document.getElementsByName("departments");
			for(var i = 0; i < checkedList.length; i++) {
				if(checkedList[i].checked) {
					departmentid = departmentid + checkedList[i].value + ",";
				}
			}
			if(departmentid == "") {
				alert("请选择要删除的机构！");
				return;
			}else {
				if(confirm("确定要删除选中的机构吗？")) {
					departmentid = departmentid.substr(0, departmentid.length-1);
					window.location.href = "departmentAction_deleteDepartment?departmentid=" + departmentid;
				}
			}
		}
		
		function departmentAction_updateDepartmentUI() {
			var departmentid = "";
			var selectedCount = 0;
			var checkList = document.getElementsByName("departments");
			for (var i = 0; i < checkList.length; i++) {
				if (checkList[i].checked) {
					selectedCount = selectedCount + 1;
					departmentid = checkList[i].value;
				}
			}
			if(selectedCount == 0){
				alert("请选择要修改的机构！");
				return;
			}
			if(selectedCount > 1){
				alert("每次只能选择一个机构进行修改！");
				return;
			}
			$.layer({
		        type: 2,
		        title: '修改机构',
		        maxmin: false,
		        area : ['500px' , '290px'],
		        offset : ['', ''],
		        iframe: {src: 'departmentAction_updateDepartmentUI?departmentid='+ departmentid},
		        close: function(index){
		            parent.frames['${frame}'].location.href='departmentAction_selectAllDepartments';
		        }
		    });
		}
	</script>
</body>
</html>
