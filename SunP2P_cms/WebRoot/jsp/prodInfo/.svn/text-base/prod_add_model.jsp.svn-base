<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	    <title>按模块新增</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<link rel="stylesheet" href="${ctx}/style/validate.css" type="text/css"/>
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.validate.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/jquery.metadata.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/jquery/messages_cn.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
	
	    <link type="text/css" href="${ctx}/style/base/jquery.ui.all.css" rel="stylesheet" />
	    <script src="${ctx}/javascript/jquery/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/ui/jquery.ui.core.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/ui/jquery.ui.position.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/ui/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/ui/jquery.ui.autocomplete.js"></script>
	    
	   <!--  <script type="text/javascript">
	    function query(){
	    $(function()
			{
				$("#model_id").autocomplete({
					source: function(request, response) 
					{
						$.getJSON("prodInfoAction_getId?prodInfo.prod_id="+$('#model_id').val(), 
						{
						},response);
					},
					minLength: 0,
					focus: function(event, ui) {
					return false;},
				    select: function(event, ui) {
					return ui.item.value;}
				});
			});
			}	
   </script> -->
	</head>
	<body>
	<form name="form" id="form" method="post" >
		<c:if test="${empty param._backUrl}">
			<input type="hidden" name="_backUrl" value="prodInfoAction_toQuery"/>
		</c:if>
		${paramCover.unCoveredForbidInputs}
		
		<ul class="main-actions clearfix">
			<li>
				<label class="extra">模板产品代码：</label>
				<span class="tool-text" style="position:relative; display:inline-block; ">
					<span style="width:222px;overflow:hidden;position:absolute; left:-1px; top:-1px; z-index:1;">
						<select class="tool-select"style="width:222px;" id="mySelect" 
							onchange="setModelId(this.value)">
						</select>
					</span>
					<input id="model_id" name="model_id" type="text" onkeyup="getProdInfoList()" onblur="getProdInfoList()"
					style="width:200px; border-width:0; position:absolute;left:0; top:0; z-index:2;" class="required number tool-text"/>
				</span>
			</li>
			<li>
				<label class="extra">产品代码：</label>
				<input class="required  tool-text" name="prod_id" id="prod_id" type="text" />
			</li>
			<li>
				<label class="extra">产品名称：</label>
				<input class="required  tool-text" name="prod_name" id="prod_name" type="text" />
			</li>
		</ul>
	 
		<div class="tool-buttons">                            
			<input class="tool-btn" type="button" id="pagebtn" value="确定"  onclick="show_frame()"/>&nbsp;
			<input class="tool-btn" type="reset"  value="重 置" />&nbsp;
			<input class="tool-btn" type="button" value="返 回" id="closeLayer"/>
		</div>
		</form>
		
	<script type="text/javascript">
		$(document).ready(function() {
			//获取当前窗口索引
			var index = parent.layer.getFrameIndex(window.name);
			$("#closeLayer").click(function(){
				parent.layer.close(index);
			});
			getProdInfoList();
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});
		
		function doBack() {
			parent.parent.frames['${frame}'].location.href="prodInfoAction_toQuery";
		}
		function show_frame() {
		    var model_id = $("#model_id").val();
		    var prod_id = $("#prod_id").val();
		    var prod_name = $("#prod_name").val();
		    parent.parent.frames['${frame}'].location.href="prodInfoAction_toAdd?model_id="
		         +model_id+"&prod_id="+prod_id+"&prod_name="+prod_name;
		}
		function getProdInfoList(){
			var prodId = $('#model_id').val();
			if (typeof(prodId) == "undefined") {
				prodId="";
			}  
			$.ajax({
				type : "post",
				url : "prodInfoAction_getProdInfoList",
				dataType : "text",
				data:'prodInfo.prod_id='+prodId,
				cache : false,
				error : function(msg) {
				},
				success : function(result) {
					jQuery("#mySelect").empty();
					var prodList = eval("("+result+")");
					var selObj = $("#mySelect");
					$.each(prodList, function(i, list){
						var value= list.prod_id;  
					    var text=list.prod_id + "||" + list.prod_name; 
						selObj.append("<option value='"+value+"'>"+text+"</option>");
					});
				}
			});
		}
		
		function setModelId(value){
			$("#model_id").val(value);
		}
	</script>
	</body>
</html>
