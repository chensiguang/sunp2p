<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>voucher</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/themes/icon.css" />
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css" />
<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//获取用户的权限
		$.ajax({
			type : "post",
			url : "voucherAction_getButton",
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
	<div class="main-title" id="Title">抵用券管理</div>
	<form action="voucherAction_toQuery" name="queryVoucher" id="queryVoucher" method="post">
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label>抵用券编号</label>
				<input class="text" type="text" value="${param.voucher_no}" name="voucher_no" id="voucher_no" />
			</li>
			<li>
				<label>所属账户：</label>
				<input class="text" type="text" value="${param.eacc_no}" name="eacc_no" id="eacc_no" />
			</li>
			<li>
				<label>状态：</label>
				<select name="status" class="select" id="status">
					<option value="">===请选择一个状态===</option>
					<c:forEach items="${K_VOUCHERSTATUS}" var="rstt">
						<option value="${rstt.val}" <c:if test="${param.status eq rstt.val}">selected</c:if> >${rstt.prompt}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>有效起始日期：</label>
				<input class="text" type="text" value="${param.begin_date}" name="begin_date" id="begin_date" onfocus="WdatePicker()" />
			</li>
			<li>
				<label>有效截止日期：</label>
				<input class="text" type="text" value="${param.end_date}" name="end_date" id="end_date" onfocus="WdatePicker()" />
			</li>
			<li>
				<label>类型：</label>
				<select name="voucher_type" class="select" id="voucher_type">
					<option value="">===请选择一个类型===</option>
					<c:forEach items="${K_VOUCHERTYPE}" var="rstt">
						<option value="${rstt.val}" <c:if test="${param.voucher_type eq rstt.val}">selected</c:if> >${rstt.prompt}</option>
					</c:forEach>
				</select>
			</li>
		</ul>
	</form>
	<div class="toolBar">
		<span class="toolbar-icon"></span>抵用券管理列表
		<div class="privileges" id="myPrivileges">
			<!-- 在此显示页面权限按钮 -->
		</div>
	</div>
	<table cellspacing="0" cellpadding="0" border="1" class="data-content" style="margin-left:0; border-left:0; border-right:0;">
		<thead>
			<tr align="center" valign="middle" id="TableData">
				<th class="checkBox"><input type="checkbox" id="selectAll" onclick="selectAll()" /></th>
				<th>抵用券编号</th>
				<th>金额</th>
				<th>所属账户</th>
				<th>生成日期</th>
				<th>有效起始日期</th>
				<th>有效截止日期</th>
                <th>使用日期</th>
				<th>抵用券类型</th>
				<th>抵用券状态</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result}" var="rst">
				<tr style="text-align: center;">
					<td><input type="checkbox" name="voucher" id="voucher" value="${rst.voucher_no}" /></td>
					<td>${rst.voucher_no}</td>
					<td>${rst.voucher_amt}</td>
					<td>${rst.eacc_no}</td>
					<td>${rst.create_date}</td>
					<td>${rst.begin_date}</td>
					<td>${rst.end_date}</td>
					<td>${rst.used_date}</td>
                    <td>${rst.voucher_type}</td>
                    <td>${rst.status}</td>
                     <td>${rst.description}</td>
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
			 <form action="voucherAction_toQuery" method="post" name="listForm">
				<input type="hidden" name="pageNo"/> 
					${paramCover.unCoveredForbidInputs } ${page.footerHtml}
			</form>
		</div>
		<div class="page-num">${page.toolbarHtml}</div>
	</div>
	 <form method="post" name="detailForm">
		<input type="hidden" name="_backUrl" value="voucherAction_toQuery"/>
			${paramCover.coveredInputs}
	</form> 
	<script type="text/javascript">
		var checkedLists = $("input[name='voucher']");
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

		function voucherAction_delete() {
			var detail = "";
			var checkedList = document.getElementsByName("voucher");
			for ( var i = 0; i < checkedList.length; i++) {
				if (checkedList[i].checked) {
					detail = detail + checkedList[i].value + ",";
				}
			}
			if (detail == "") {
				alert("请选择要是删除的抵用券！！！！");
				return;
			} else {
				if (confirm("您确定要删除选中的抵用券？")) {
					$.layer({
						type : 2,
						title : '删除抵用券',
						maxmin : false,
						area : [ '500px', '360px' ],
						offset : [ '', '' ],
						iframe : {src : "voucherAction_delete?detail="+ detail},
						close : function(index) {
							parent.frames['${frame}'].location.href = 'voucherAction_toQuery';
						}
					});
				}
			}
		}

		function voucherAction_addUI() {
			$.layer({
				type : 2,
				title : '添加抵用券',
				maxmin : false,
				area : [ '600px', '400px' ],
				offset : [ '', '' ],
				iframe : {
					src : 'voucherAction_addUI'
				},
				close : function(index) {
					parent.frames['${frame}'].location.href = 'voucherAction_toQuery';
				}
			});
		}
		
		function voucherAction_updateUI() {
			var updetail = "";
			var count = 0;
			var checkedList = document.getElementsByName("voucher");
			for ( var i = 0; i < checkedList.length; i++) {
				if (checkedList[i].checked) {
					updetail =  checkedList[i].value ;
					count = count+1;
				}
			}
			if(count==0){
			 	alert("请选择需要修改的抵用券");
			 	return;
			}
			if(count>1){
				alert("每次只能选择一张抵用券进行修改");
				return;
			}
            $.layer({
		        type: 2,
		        title: '修改抵用券',
		        maxmin: false,
		        area : ['700px' , '500px'],
		        offset : ['', ''],
		        iframe: {src: 'voucherAction_updateUI?updetail='+updetail},
		        close: function(index){
		            parent.frames['${frame}'].location.href='voucherAction_toQuery';
		        }
		    });
		}
		
		function voucherAction_select(){
			setTimeout("queryVoucher.submit()", 100);
		}
		
	</script>
</body>
</html>
