<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>数据字典新增</title>
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
	<div class="main-title" id="Title"><!--页面标题-->
       	数据字典新增	
    </div>
					<form id="form" name="form" method="post" action="dictInfoAction_add" onsubmit="initMethod();">
						<c:if test="${empty param._backUrl}">
							<input type="hidden" name="_backUrl" value="dictInfoAction_toQuery"/>
						</c:if>
						${paramCover.unCoveredForbidInputs}
						<input type="hidden" name="val_str" id="val_str"/>
						<input type="hidden" name="dict_desc_str" id="dict_desc_str"/>
						<ul class="main-actions clearfix" id="itemList">
							<li>
								<label class="extra">名称：</label>
								<input name="dict_name" type="text" class="required  tool-text" />
							</li>
							<li>
								<label class="extra">主键：</label>
								<input name="sun_key" type="text" class="required tool-text"/>
							</li>
							<li>
								<input type="button" value="添加一行" onclick="newOne();"/>
							</li>
							<li>
								<label class="extra">值：</label>
								<input name="val" type="text" class="required  tool-text"/>
							</li>
							<li>
								<label class="extra">说明：</label>
								<input name="dict_desc" type="text" class="required tool-text"/>
							</li>
							<li>
								<input type="button" value="删除一行" onclick="deleteOne();"/>
							</li>
						</ul>
						<div class="tool-buttons">
							<input class="tool-btn" type="submit" value="增 加" />&nbsp;
							<input class="tool-btn" type="reset"  value="重 置" />&nbsp;
							<input class="tool-btn" type="button" value="返 回" onclick="history.back();" />
						</div>
					</form>
					<!-- <form method="post" name="backForm"></form> -->
	<script type="text/javascript" >
		var init_ul_len;
		var twiceDelete = false;
		$(document).ready(function() {
			var ulObject = document.getElementById("itemList");
			init_ul_len = ulObject.childNodes.length;
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});	
		
		function initMethod(){
			document.getElementById("val_str").value = getInputName("val");
			document.getElementById("dict_desc_str").value = getInputName("dict_desc");
		}
		
		function getInputName(name){
			var str = "";
			var els =document.getElementsByName(name);
			for (var i = 0, j = els.length; i < j; i++){
				str = str + els[i].value + ",";
			}
			return str;
		}
		
		function newOne(){
			createLi("值：","val");
			createLi("说明：","dict_desc");
		}
		
		function createLi(label_text,input_name){
			var ulObject = document.getElementById("itemList");
			var cur_ul_len = ulObject.childNodes.length;
			var li = document.createElement("li");
			var label = document.createElement("label");
			var input = document.createElement("input");
			label.className = "extra"; 
			label.innerHTML = label_text;
			li.appendChild(label);
			input.name = input_name;
			input.type = "text";
			input.className = "required  tool-text";
			li.appendChild(input);
			ulObject.insertBefore(li, ulObject.childNodes[cur_ul_len-2]);
		}
		
		function deleteOne(){
			removeLi();
			if(twiceDelete){
				removeLi();
			}
			
		}
		
		function removeLi(){
			var ulObject = document.getElementById("itemList");
			var cur_ul_len = ulObject.childNodes.length;
			if(cur_ul_len > init_ul_len){
				twiceDelete = true;
				ulObject.removeChild(ulObject.childNodes[cur_ul_len-3]);
			}else{
				twiceDelete = false;
				alert("已经是初始化页面，无法删除！");
			}
		}
		
	</script>
</body>
</html>
