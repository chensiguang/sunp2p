<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>用户信息审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
</head>
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	用户信息审核
    </div>
    <ul id="mainAction" class="main-actions clearfix" >
		<li>
			<label>电子账号：</label>
			<input class="tool-text" type="text" name="eacc_no" id="eacc_no" value="${details.eacc_no}" readonly="readonly"/>			
		</li>
		<li>
			<label>客户姓名：</label>
			<input class="tool-text" type="text" name="name" id="name" value="${details.name}" readonly="readonly"/>			
		</li>
		<li>
			<label>性别：</label>
			<input class="tool-text" type="text" name="sex" id="sex" value="${details.sex}" readonly="readonly"/>			
		</li>
		<li>
			<label>证件号码：</label>
			<input class="tool-text" type="text" name="id_code" id="id_code" value="${details.id_code}" readonly="readonly"/>			
		</li>
		<li>
			<label>手机号码：</label>
			<input class="tool-text" type="text" name="mobile" id="mobile" value="${details.mobile}" readonly="readonly"/>			
		</li>
		<li>
			<label>电子邮箱：</label>
			<input class="tool-text" type="text" name="email" id="email" value="${details.email}" readonly="readonly"/>			
		</li>
		<li>
			<label>邮箱是否验证：</label>
			<input class="tool-text" type="text" name="email_state" id="email_state" value="${details.email_state}" readonly="readonly"/>			
		</li>
		<li>
			<label>注册时间：</label>
			<input class="tool-text" type="text" name="reg_time" id="reg_time" value="${details.reg_time}" readonly="readonly"/>			
		</li>
		<li>
			<label>账户状态：</label>
			<input class="tool-text" type="text" name="acc_state" id="acc_state" value="${details.acc_state}" readonly="readonly"/>			
		</li>
	</ul>
	<div style="text-align:center; margin-top: 20px;">
		<c:if test="${empty files}">
			<h2>${alt}</h2>
		</c:if>
		<c:forEach items="${files}" var="rst">
			<img src="${ctx}/images/user_pictures/${rst}" height="240px" width="370px" id="${rst}" onclick="toBig('${rst}')" />
		</c:forEach>
	</div>
	<div class="privileges" id="myPrivileges">
		<!-- 在此显示权限按钮 -->
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "userApproveAction_getButton",
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
						if(list.privilege_name.indexOf("查询")>-1 || list.privilege_name == "审核"){
							searchHtml += "<input type='hidden' name='approve'/>";
						}else{
							privilegeHtml += "<a class='button' onclick='"+list.url+"()"+"'>"+list.privilege_name+"</a>"+"&nbsp;";
						}
					});
					$("#myPrivileges").html(privilegeHtml);
					$("#mainAction").html(searchHtml);
				}
			});
		})	
		
		function userApproveAction_userApproved() {
			if(confirm("确定审核通过吗？")) {
				$.layer({
			        type: 2,
			        title: '审核通过',
			        maxmin: false,
			        area : ['500px' , '360px'],
			        offset : ['', ''],
			        iframe: {src: 'userApproveAction_userApproved?eacc_no=' + "${details.eacc_no}"},
			        close: function(index){
			            parent.frames['${frame}'].location.href='userApproveAction_selectUserInfo';
			        }
			    });
			}
		}
		
		function userApproveAction_userRefused() {
			if(confirm("确定审核拒绝吗？")) {
				$.layer({
			        type: 2,
			        title: '审核拒绝',
			        maxmin: false,
			        area : ['500px' , '360px'],
			        offset : ['', ''],
			        iframe: {src: 'userApproveAction_userRefused?eacc_no=' + "${details.eacc_no}"},
			        close: function(index){
			            parent.frames['${frame}'].location.href='userApproveAction_selectUserInfo';
			        }
			    });
			}
		}
		
		function toBig(img) {
			var img = document.getElementById(img);
			var src = img.src;
			$.layer({
		        type: 2,
		        title: '放大图片',
		        shadeClose: true,
		        maxmin: false,
		        area : ['760px' , '500px'],
		        offset : ['', ''],
		        iframe: {src: src},
		    });
		}
		
	</script>
</body>
</html>
