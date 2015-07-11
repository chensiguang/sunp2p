<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>分配权限</title>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	//获取当前窗口索引
	var index = parent.layer.getFrameIndex(window.name);
	$("#closeLayer").click(function(){
		parent.layer.close(index);
	});
	 //移到右边
    $('#toright').click(function() {
      $('#leftList option:selected').remove().appendTo('#rightList');
    });
    //移到左边
    $('#toleft').click(function() {
      $('#rightList option:selected').remove().appendTo('#leftList');
    });
});

function filterPrivilegeName() {
	var privilegeName= $("#privilegeName").val();
	var privilege=$('input:radio:checked').val();

	if(privilege == 0) {
	    <c:forEach items="${rightList}" var="rst"> 
	      if("${rst.privilege_name}".indexOf(privilegeName)>-1){
	    	  $("#right_"+"${rst.privilege_id}").show();
	      }else{
	    	  $("#right_"+"${rst.privilege_id}").hide();
	      }
	    </c:forEach>
	}
    
    if(privilege == 1) {
    	<c:forEach items="${leftList}" var="rst"> 
        if("${rst.privilege_name}".indexOf(privilegeName)>-1){
      	  $("#left_"+"${rst.privilege_id}").show();
        }else{
      	  $("#left_"+"${rst.privilege_id}").hide();
        }
      </c:forEach>
    }
}

function filterPrivilegeId() {
	var privilegeId= $("#privilegeId").val();
	var privilege=$('input:radio:checked').val();
	
	if(privilege == 0) {
    <c:forEach items="${rightList}" var="rst"> 
      if("${rst.privilege_id}".indexOf(privilegeId)>-1){
    	  $("#right_"+"${rst.privilege_id}").show();
      }else{
    	  $("#right_"+"${rst.privilege_id}").hide();
      }
    </c:forEach> 
	}
	
	if(privilege == 1) {
		<c:forEach items="${leftList}" var="rst"> 
	      if("${rst.privilege_id}".indexOf(privilegeId)>-1){
	    	  $("#left_"+"${rst.privilege_id}").show();
	      }else{
	    	  $("#left_"+"${rst.privilege_id}").hide();
	      }
	    </c:forEach> 
	}
}
</script>
</head>

<body>
<div class="window-pop" style="width:710px;">
	<form action="roleAction_privilegeDistb" method="post" >
	<div class="window-box">
		<label>角色ID：</label><input class="tool-text" style="width:160px;" type="text" name="role_id" value="${role.role_id}" readonly="readonly" />&nbsp;
		<label>角色名称：</label><input class="tool-text" style="width:160px;" type="text" name="role_name" value="${role.role_name}" readonly="readonly" />&nbsp;
		<label>说  明：</label><input class="tool-text" style="width:160px;" type="text" name="role_desc" value="${role.role_desc}" readonly="readonly" />
	</div>
	<div class="window-box">
		<label>权限ID：</label><input class="tool-text" type="text" value="" id="privilegeId" onkeyup="filterPrivilegeId()" />&nbsp;
		<label>权限名称 ：</label><input class="tool-text" type="text" value="" id="privilegeName" onkeyup="filterPrivilegeName()" />&nbsp;
		<input type="radio" value="1" name="privilege" /><label>已分配</label>&nbsp;
		<input type="radio" value="0" name="privilege" checked="checked" /><label>可分配</label>
	</div>
		
                  <table border="0" style="width:710px; font-size:12px;" cellpadding="0" cellspacing="0">
                  	<tr>
                  		<td height="40" align="center" width="300">已分配权限</td>
                  		<td></td>
                  		<td align="center" width="300">可分配权限</td>
                  	</tr>
                    <tr>
                      <td>
                      	  <select multiple size="10" id="leftList" name="leftPrivileges" style="width: 100%;">
				          	<option disabled="disabled">权限ID　权限名</option>
				          	<c:forEach items="${leftList}" var="rst">
								<option value="${rst.privilege_id}" id="left_${rst.privilege_id}">${rst.privilege_id}　　${rst.privilege_name}</option>
							</c:forEach>
				          </select>
                      </td>
                      <td align="center"> 
                      	<input class="tool-btn" type="button" value=" < " id="toleft"><br /><br />
                      	<input class="tool-btn" type="button" value=" > " id="toright">
                      </td>
                      <td> 
                         <select multiple size="10" id="rightList" name="rightPrivileges" style="width: 100%;">
                          	<option disabled="disabled">权限ID　权限名</option>
				          	<c:forEach items="${rightList}" var="rst">
								<option value="${rst.privilege_id}" id="right_${rst.privilege_id}">${rst.privilege_id}　　${rst.privilege_name}</option>
							</c:forEach>
				          </select>
					  </td>
                    </tr>
                  </table>
	    	<div style="text-align:center; padding-top:20px;">
	    		<input class="tool-btn" type="reset" onclick="javascript:window.location.reload();" value="重  置" />&nbsp;
	    		<input class="tool-btn" type="submit" value="提  交" />&nbsp;
				<input class="tool-btn" type="button" value="返  回" id="closeLayer" />
	    	</div>
	</form>
</div>
</body>
</html>
