<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>transStatus</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css" />
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "transStatusAction_getButton",
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
	<div class="main-title" id="Title">产品交易状态管理</div>
	<form action="transStatusAction_toQuery" name="queryTransStatus"
		id="queryTransStatus" method="post">
		<ul id="mainAction" class="main-actions clearfix">
			<li><label>产品类型：</label> 
			<select name="prod_type" class="select" id="prod_type">
					<option value="">===请选择产品类型===</option>
					<c:forEach items="${K_PRODTYPE}" var="rstt">
						<option value="${rstt.val}">${rstt.prompt}</option>
					</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById("prod_type").value="${param.prod_type}"
			</script>
			</li>
			<li><label>产品代码：</label> 
			<input class="text" type="text" value="${param.prod_id}" name="prod_id" id="prod_id" />
			</li>
			<li><label>交易代码：</label> 
			<input class="text" type="text" value="${param.trans_code}" name="trans_code" id="trans_code"  />
			</li>
			<li><label>当前状态：</label> 
			<select name="status" class="select" id="status">
					<option value="">===请选择一个状态===</option>
					<c:forEach items="${K_ENABLEFLAG}" var="rstt">
						<option value="${rstt.val}">${rstt.prompt}</option>
					</c:forEach>
			</select>
			<script type="text/javascript">
				document.getElementById("status").value="${param.status}"
			</script>
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span> 产品交易状态管理
		<div class="privileges" id="myPrivileges">
			<!-- 在此显示页面权限按钮 -->
		</div>
	</div>
	<table cellspacing="0" cellpadding="0" border="1" class="data-content" 
	 style="margin-left:0; border-left:0; border-right:0;">
		<thead>
			<tr align="center" valign="middle" id="TableData">
				<th class="checkBox"><input type="checkbox" id="selectAll" onclick="selectAll()" /></th>
				<th>产品类型</th>
				<th>产品代码</th>
				<th>交易代码</th>
				<th>交易允许</th>
				<th>当前状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="transstatus" id="transstatus" 
						value="${rst.prod_type}/${rst.prod_id}/${rst.trans_code}" />
					</td>
					<td>
						<c:forEach items="${K_PRODTYPE}" var="rstt">
							<c:if test="${rstt.val eq rst.prod_type}">${rstt.prompt}</c:if>
						</c:forEach>
					</td>
					<td>${rst.prod_id}</td>
					<td>${rst.trans_code}</td>
					<td>${rst.enable_flag}</td>
					<td>${rst.status}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty page.result}">
				<tr>
					<td height="25" colspan="17" align="center">无相关信息</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<div class="page-tag clearfix">
		<div class="float-l">
			 <form action="transStatusAction_toQuery" method="post" name="listForm">
			<input type="hidden" name="pageNo"/> 
			${paramCover.unCoveredForbidInputs } ${page.footerHtml}
		</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	 <form method="post" name="detailForm">
		<input type="hidden" name="prodIdStr" />
		<input type="hidden" name="_backUrl" value="transStatusAction_toQuery"/>
			${paramCover.coveredInputs}
	</form> 
	<script type="text/javascript">
		var checkedLists = $("input[name='transstatus']");
		for ( var i = 0; i < checkedLists.length; i++) {
			checkedLists.eq(i).click(function() {
				if ($(this).is(":checked")) {
					$(this).parent().parent().addClass("checkedTr");
				} else {
					$(this).parent().parent().removeClass("checkedTr");
				}
			});
		};

		function selectAll() {
			for ( var i = 0; i < checkedLists.length; i++) {
				if ($('#selectAll').is(":checked")) {
					checkedLists.eq(i).prop('checked', true);
					checkedLists.eq(i).parent().parent().addClass('checkedTr');
				} else {
					checkedLists.eq(i).prop('checked', false);
					checkedLists.eq(i).parent().parent().removeClass(
							'checkedTr');
				}
			}
		}

		function transStatusAction_delete() {
			var detail = "";
			var checkedList = document.getElementsByName("transstatus");
			for ( var i = 0; i < checkedList.length; i++) {
				if (checkedList[i].checked) {
					detail = detail + checkedList[i].value + ",";
				}
			}
			if (detail == "") {
				alert("请选择要是删除的产品交易状态！！！！");
				return;
			} else {
				if (confirm("您确定要删除选中的产品交易状态？")) {
					$.layer({
						    type : 2,
							title : '删除产品交易状态',
							maxmin : false,
							area : [ '500px', '360px' ],
							offset : [ '', '' ],
							iframe : {src:"transStatusAction_delete?detail="+detail},
							close : function(index) {
							parent.frames['${frame}'].location.href = 'transStatusAction_toQuery';
							}
					});
				}
			}

		}

		function transStatusAction_addUI() {
			$.layer({
					type : 2,
					title : '添加产品交易状态',
					maxmin : false,
					area : [ '500px', '330px' ],
					offset : [ '', '' ],
					iframe : {src:'transStatusAction_addUI'},
					close : function(index) {
						parent.frames['${frame}'].location.href ='transStatusAction_toQuery';
						}
					});
       }
       
		function transStatusAction_updateUI() {
			var updetail = "";
			var count = 0;
			var checkedList = document.getElementsByName("transstatus");
			for ( var i = 0; i < checkedList.length; i++) {
				if (checkedList[i].checked) {
					updetail =  checkedList[i].value ;
					count = count+1;
				}
			}
			if(count==0){
			 	alert("请选择需要修改的产品交易状态");
			 	return;
			}
			if(count>1){
				alert("每次只能选择一条产品交易状态修改");
				return;
			}
            $.layer({
		        type: 2,
		        title: '修改产品交易状态',
		        maxmin: false,
		        area : ['560px' , '400px'],
		        offset : ['', ''],
		        iframe: {src:'transStatusAction_updateUI?updetail='+updetail},
		        close: function(index){
		            parent.frames['${frame}'].location.href='transStatusAction_toQuery';
		        }
		    });
		}
		
		function transStatusAction_select(){
			setTimeout("queryTransStatus.submit()", 100);
		}
		
	</script>
</body>
</html>
