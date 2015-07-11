<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>增加基金产品</title>
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
       	增加基金产品	
    </div>
					<form id="form" name="form" method="post" action="fundInfoAction_add" onsubmit="getCheckBoxVal();">
						<c:if test="${empty param._backUrl}">
							<input type="hidden" name="_backUrl" value="fundInfoAction_toQuery"/>
						</c:if>
						${paramCover.unCoveredForbidInputs}
						<ul class="main-actions clearfix">
							<li>
								<label class="extra">产品代码：</label>
								<input name="fundInfo.prod_id" type="text" class="required digits tool-text" />
							</li>
							<li>
								<label class="extra">产品名称：</label>
								<input name="fundInfo.prod_name" type="text" class="required tool-text"/>
							</li>
							<li>
								<label class="extra">产品类型：</label>
								<select class="tool-select" name="fundInfo.prod_type">
									<c:forEach items="${K_PRODTYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li>
								<label class="extra">最新净值：</label>
								<input name="fundInfo.net_worth" type="text" class="required number tool-text"/>
							</li>
							<li>
								<label class="extra">净值日期：</label>
								<input name="fundInfo.net_date" type="text" onfocus="WdatePicker()" class="required tool-text"/>
							</li>
							<li>
								<label class="extra">风险等级：</label>
								<select class="tool-select" name="fundInfo.risk_lvl">
									<c:forEach items="${K_RISKLVL}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li>
								<label class="extra">最小购买金额：</label>
								<input name="fundInfo.lowest_limit" type="text" class="required digits tool-text"/>
							</li>
							<li>
								<label class="extra">最小追加金额：</label>
								<input name="fundInfo.addition_limit" type="text" class="required digits tool-text"/>
							</li>
							<li>
								<label class="extra">7日年化收益率：</label>
								<input name="fundInfo.ist_7day" type="text" class="required number tool-text"/>
							</li>
							<li>
								<label class="extra">产品状态：</label>
								<select class="tool-select" name="fundInfo.prod_state">
									<c:forEach items="${K_PRODSTATE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li>
								<label class="extra">是否推荐：</label>
								<select class="tool-select" name="fundInfo.hpage_promoted">
									<c:forEach items="${K_HPAGEPROMOTED}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li>
								<label class="extra">额度控制：</label>
								<select class="tool-select" name="fundInfo.quota_control" id="quota_control" onchange="show_quota()">
									<c:forEach items="${K_QUOTACONTROL}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li id="total_control">
								<label class="extra">总额度：</label>
								<input name="fundInfo.issue_total" type="text" class="number tool-text"/>
							</li>
							<li id="channel_control">
								<ul class="clearfix">
								<li>
									<label class="extra">web总额度：</label>
									<input name="fundInfo.web_total" type="text" class="number tool-text"/>
								</li>
								<li>
									<label class="extra">app总额度：</label>
									<input name="fundInfo.app_total" type="text" class="number tool-text"/>
								</li>
								<li>
									<label class="extra">微信总额度：</label>
									<input name="fundInfo.weixin_total" type="text" class="number tool-text"/>
								</li>
								</ul>
							</li>
							<li>
								<label class="extra">销售渠道控制：</label>
								<select class="tool-select" name="fundInfo.sale_channel_control" id="sale_channel_control" onchange="show_sale()">
									<c:forEach items="${K_SALECHANNELCONTROL}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
							</li>
							<li>
								<label class="extra" id="sale_channel">允许销售渠道：</label>
								<span id="sale_channel_content">
									<input name="sale_channel_name" type="checkbox" value="1" />web端&nbsp;&nbsp;
									<input name="sale_channel_name" type="checkbox" value="1" />app端&nbsp;&nbsp;
									<input name="sale_channel_name" type="checkbox" value="1" />微信端&nbsp;&nbsp;
									<input type="hidden" name="fundInfo.sale_channel" id="sale_channel_hidden" />
								</span>
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
		$(document).ready(function() {
			show_quota();
			show_sale();
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});
		
		function show_sale(){
			var val = $('#sale_channel_control option:selected').val();
			if(val == '0'){
				$('#sale_channel').hide();
				$('#sale_channel_content').hide();
			}else if(val == '1'){
				$('#sale_channel').show();
				$('#sale_channel_content').show();
			}
		}
		
		function show_quota(){
			var val = $('#quota_control option:selected').val();
			if(val == '0'){
				$('#total_control').hide();
				$('#channel_control').hide();
			}else if(val == '1'){
				$('#total_control').show();
				$('#channel_control').hide();
			}else if(val == '2'){
				$('#total_control').hide();
				$('#channel_control').show();
			}else{
				$('#total_control').show();
				$('#channel_control').show();
			}
		}
		
		function getCheckBoxVal(){
			var obj = document.getElementsByName("sale_channel_name");
			var s='';
            for(var i=0;i<obj.length;i++){  
                 if(obj[i].checked) {
                	 s+=obj[i].value;  
                 }else{
                	 s+="0";
                 }  
            }
            //销售渠道 比如100 代表web 010 代表app 110 代表web,app都可以 
            document.getElementById("sale_channel_hidden").value = s;
		}
		
		function doBack() {
			backForm.action = "fundInfoAction_toQuery";
			backForm.submit();
		}
	</script>
</body>
</html>
