<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>分配角色</title>
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

function filterRoleName() {
	var roleName= $("#roleName").val();
	var role=$('input:radio:checked').val();

	if(role == 0) {
	    <c:forEach items="${rightList}" var="rst"> 
	      if("${rst.role_name}".indexOf(roleName)>-1){
	    	  $("#right_"+"${rst.role_id}").show();
	      }else{
	    	  $("#right_"+"${rst.role_id}").hide();
	      }
	    </c:forEach>
	}
    
    if(role == 1) {
    	<c:forEach items="${leftList}" var="rst"> 
        if("${rst.role_name}".indexOf(roleName)>-1){
      	  $("#left_"+"${rst.role_id}").show();
        }else{
      	  $("#left_"+"${rst.role_id}").hide();
        }
      </c:forEach>
    }
}

function filterRoleId() {
	var roleId= $("#roleId").val();
	var role=$('input:radio:checked').val();
	
	if(role == 0) {
    <c:forEach items="${rightList}" var="rst"> 
      if("${rst.role_id}".indexOf(roleId)>-1){
    	  $("#right_"+"${rst.role_id}").show();
      }else{
    	  $("#right_"+"${rst.role_id}").hide();
      }
    </c:forEach> 
	}
	
	if(role == 1) {
		<c:forEach items="${leftList}" var="rst"> 
	      if("${rst.role_id}".indexOf(roleId)>-1){
	    	  $("#left_"+"${rst.role_id}").show();
	      }else{
	    	  $("#left_"+"${rst.role_id}").hide();
	      }
	    </c:forEach> 
	}
}
</script>
</head>

<body>
<div class="window-pop" style="width:710px;">
	<form action="userAction_roleDistb" method="post" >
		<div class="window-box">
			<label>用户ID：</label><input class="tool-text" style="width:160px;" type="text" name="user_id" value="${user.user_id}" readonly="readonly" />&nbsp;
			<label>用户名称：</label><input class="tool-text" style="width:160px;" type="text" name="user_name" value="${user.user_name}" readonly="readonly" />&nbsp;
			<label>说  明：</label><input class="tool-text" style="width:160px;" type="text" name="user_desc" value="${user.user_desc}" readonly="readonly" />
		</div>
		<div class="window-box">
			<label>角色ID：</label><input class="tool-text" style="width:160px;" type="text" value="" id="roleId" onkeyup="filterRoleId()" />&nbsp;
			<label>角色名称 ：</label><input class="tool-text" style="width:160px;" type="text" value="" id="roleName" onkeyup="filterRoleName()" />&nbsp;
			<input type="radio" value="1" name="role" /><label>已分配</label>&nbsp;
			<input type="radio" value="0" name="role" checked="checked" /><label>可分配</label>
		</div>
                  <table style="width:710px; font-size:12px;"  border="0" cellpadding="0" cellspacing="0">
                  	<tr>
                  		<td height="40" align="center" width="300">已分配角色</td>
                  		<td></td>
                  		<td align="center" width="300">可分配角色</td>
                  	</tr>
                    <tr>
                      <td>
                      	  <select multiple size="10" id="leftList" name="leftRoles" style="width: 100%;">
				          	<option disabled="disabled">角色ID　角色名</option>
				          	<c:forEach items="${leftList}" var="rst">
								<option  value="${rst.role_id}" id="left_${rst.role_id}">${rst.role_id}　　${rst.role_name}</option>
							</c:forEach>
				          </select>
                      </td>
                      <td align="center"> 
                      	<input class="tool-btn" type="button" value=" < " id="toleft"><br /><br />
                      	<input class="tool-btn" type="button" value=" > " id="toright">
                      </td>
                      <td> 
                         <select multiple size="10" id="rightList" name="rightRoles" style="width: 100%;">
                          	<option disabled="disabled">角色ID　角色名</option>
				          	<c:forEach items="${rightList}" var="rst">
								<option value="${rst.role_id}" id="right_${rst.role_id}">${rst.role_id}　　${rst.role_name}</option>
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
