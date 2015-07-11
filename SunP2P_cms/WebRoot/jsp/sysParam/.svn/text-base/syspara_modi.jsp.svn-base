<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
	
					<form id="form" name="form" method="post" action="sysParamAction_modi" >
						
						<ul class="main-actions clearfix">
						     <li>
								<label class="extra">参数类型：</label>
								<select class="tool-select" name="sysParam.param_type" id="param_type" onchange="show_type()" >
									<c:forEach items="${K_PARAMTYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
								<script type="text/javascript">
									document.getElementById('param_type').value='${sysParam.param_type }';
								</script>
							</li>
						   
						      <li id="show_prod_id"> 
								<label class="extra" id="prod_id">产品代码：</label>
								<input name="sysParam.prod_id" type="text" value="${sysParam.prod_id }" class="required tool-text"/>
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
								<input name="show_param_id" type="text" value="${sysParam.param_id }" class="tool-text"  disabled="disabled"/>
							    <input name="sysParam.param_id" type="hidden" value="${sysParam.param_id }" class="tool-text" />
							</li>
							<li>
								<label class="extra">参数名称：</label>
								<input name="sysParam.value_name" type="text" value="${sysParam.value_name }" class="required tool-text"/>
							</li>
							
							<li>
								<label class="extra">值：</label>
								<input name="sysParam.param_value" type="text" value="${sysParam.param_value }" class="required number tool-text"/>
							</li>
							
							<li>
								<label class="extra">说明：</label>
								<input name="sysParam.reserve1" type="text" value="${sysParam.reserve1 }" class="tool-text"/>
							</li>
						    
						    <li>
								<label class="extra">允许修改标志：</label>
							    <span>
									<input name="sysParam.modi_flag" class="sysParam.modi_flag" type="checkbox" value="1" checked="checked" />允许修改&nbsp;&nbsp;
								</span>
							</li>
							
						</ul>
						<div class="tool-buttons">
							<input class="tool-btn" type="submit" value="修 改" />&nbsp;
							<input class="tool-btn" type="reset"  value="重 置" />&nbsp;
							<input class="tool-btn" type="button" value="返 回" id="closeLayer" />
						</div>
					</form>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	//获取当前窗口索引
	    	var index = parent.layer.getFrameIndex(window.name);
	    	$("#closeLayer").click(function(){
	    		parent.layer.close(index);
	    	});
			$('#show_prod_type').hide();
			$('#show_prod_id').hide();
		    show_type();
		    
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});
		
		function show_type(){
			var val = $('#param_type option:selected').val();

			if(val == '3'){
				$('#show_prod_id').show();
				$('#show_prod_type').hide();
				}
			else if(val=='2'){
				$('#show_prod_id').hide();
				$('#show_prod_type').show();
			}else{
				$('#show_prod_id').hide();
				$('#show_prod_type').hide();
			}
		}
		
	</script>		
	</body>
</html>
