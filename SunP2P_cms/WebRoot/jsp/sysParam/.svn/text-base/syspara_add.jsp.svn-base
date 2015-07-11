<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.sunyard.directbank.enums.MODIFLAG" %>
<%@ page import="com.sunyard.directbank.enums.PARAMTYPE" %>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
	</head>
	<body>
	
					<form id="form" name="form" method="post" action="sysParamAction_add" onsubmit="getCheckBoxVal();">
						<c:if test="${empty param._backUrl}">
							<input type="hidden" name="_backUrl" value="sysParamAction_toQuery"/>
						</c:if>
						${paramCover.unCoveredForbidInputs}
						<ul class="main-actions clearfix">
						     <li>
								<label class="extra">参数类型：</label>
								<select class="tool-select" name="sysParam.param_type" id="param_type"onchange="show_type()">
									<c:forEach items="${K_PARAMTYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
						   
					        <li id="show_prod_id"> 
								<label class="extra" id="prod_id">产品代码：</label>
								<input name="sysParam.prod_id" type="text"  class="required tool-text"/>
						     </li>
							
							  
						     <li id="show_prod_type">
							    <label class="extra" id="prod_type">产品类型</label>
							    <select class="tool-select" name="prod_type" >
									<c:forEach items="${K_PRODTYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							  </li>
							 
							 
							<li>
								<label class="extra">参数ID：</label>
								<input name="sysParam.param_id" type="text" class="required digits tool-text" />
							</li>
							
							<li>
								<label class="extra">参数标识名称：</label>
								<input name="sysParam.param_name" type="text" class="required  tool-text" />
							</li>
							
							<li>
								<label class="extra">参数名称：</label>
								<input name="sysParam.value_name" type="text" class="required tool-text"/>
							</li>
							
							<li>
								<label class="extra">参数值：</label>
								<input name="sysParam.param_value" type="text" class="required number tool-text"/>
							</li>
							
							<li>
								<label class="extra">说明：</label>
								<input name="sysParam.reserve1" type="text" class="tool-text"/>
							</li>
						    
						    <li>
								<label class="extra">允许修改标志：</label>
							    <span>
									<input name="sysParam.modi_flag" id="modi_flag" class="sysParam.modi_flag" type="checkbox"  checked="checked" />允许修改
								</span>
							</li>
							
						</ul>
						<div class="tool-buttons">
						    <input class="tool-btn" type="hidden" value="<%=MODIFLAG.Yes.getCode() %>" id="flag_yes"/>
							<input class="tool-btn" type="hidden" value="<%=PARAMTYPE.Products.getCode() %>" id="param_products"/>
							<input class="tool-btn" type="hidden" value="<%=PARAMTYPE.Single.getCode() %>" id="param_single"/>
							<input class="tool-btn" type="submit" value="增 加" onclick="modi()"/>&nbsp;
							<input class="tool-btn" type="reset"  value="重 置" />&nbsp;
							<input class="tool-btn" type="button" value="返 回" id="closeLayer" />
						</div>
					</form>
					
		<script type="text/javascript" >	
		$(document).ready(function() {
			//获取当前窗口索引
			var index = parent.layer.getFrameIndex(window.name);
			$("#closeLayer").click(function(){
				parent.layer.close(index);
			});
			$('#show_prod_type').hide();
			$('#show_prod_id').hide();
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});
		
		function show_type(){
			var val = $('#param_type option:selected').val();
            var param_products = document.getElementById('param_products').value;
            var param_single = document.getElementById('param_single').value;
            
			if(val == param_single){
				$('#show_prod_id').show();
				$('#show_prod_type').hide();
				}
			else if(val==param_products){
				$('#show_prod_id').hide();
				$('#show_prod_type').show();
			}else{
				$('#show_prod_id').hide();
				$('#show_prod_type').hide();
			}
		}
		
		function modi(){
		   var obj = document.getElementById('modi_flag');
		   if(obj.checked == true){
		       obj.value = document.getElementById("flag_yes").value;
		   }
		}
	</script>
</body>
</html>
