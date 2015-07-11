<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>修改基金产品</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="${ctx}/javascript/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	修改基金产品	
    </div>
	<form name="form" method="post" action="fundInfoAction_modi" onsubmit="return doSave();">
		<c:if test="${empty param._backUrl}">
			<input type="hidden" name="_backUrl" value="fundInfoAction_toQuery"/>
		</c:if>
		${paramCover.unCoveredInputs}
		<ul id="mainAction" class="main-actions clearfix">
			<li>
				<label class="extra">基金产品代码：</label>
				<input class="tool-text" name="fundInfo.prod_id" type="text" readonly value="${fundInfo.prod_id}" />
			</li>
			<li>
				<label class="extra">基金产品名称：</label>
				<input class="tool-text" name="fundInfo.prod_name" type="text" value="${fundInfo.prod_name}" />
			</li>
			<li>
				<label class="extra">基金产品类型：</label>
				<select class="tool-select" name="fundInfo.prod_type" id="prod_type">
					<c:forEach items="${K_PRODTYPE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_type').value='${fundInfo.prod_type}'
				</script>
			</li>
			<li>
				<label class="extra">最新净值：</label>
				<input class="tool-text" name="fundInfo.net_worth" type="text" value="${fundInfo.net_worth}" />
			</li>
			<li>
				<label class="extra">净值日期：</label>
				<input class="tool-text" name="fundInfo.net_date" type="text" value="${fundInfo.net_date}" onfocus="WdatePicker()" />
			</li>
			<li>
				<label class="extra">产品风险等级：</label>
				<select class="tool-select" name="fundInfo.risk_lvl" id="risk_lvl">
					<c:forEach items="${K_RISKLVL}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('risk_lvl').value='${fundInfo.risk_lvl}'
				</script>
			</li>
			<li>
				<label class="extra">最小购买金额：</label>
				<input class="tool-text" name="fundInfo.lowest_limit" type="text" value="${fundInfo.lowest_limit}" />
			</li>
			<li>
				<label class="extra">最小追加金额：</label>
				<input class="tool-text" name="fundInfo.addition_limit" type="text" value="${fundInfo.addition_limit}" />
			</li>
			<li>
				<label class="extra">7日年化收益率：</label>
				<input class="tool-text" name="fundInfo.ist_7day" type="text" value="${fundInfo.ist_7day}" />
			</li>
			<li>
				<label class="extra">产品状态：</label>
				<select class="tool-select" name="fundInfo.prod_state" id="prod_state">
					<c:forEach items="${K_PRODSTATE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_state').value='${fundInfo.prod_state}'
				</script>
			</li>
			<li>
				<label class="extra">是否推荐：</label>
				<select class="tool-select" name="fundInfo.hpage_promoted" id="hpage_promoted">
					<c:forEach items="${K_HPAGEPROMOTED}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('hpage_promoted').value='${fundInfo.hpage_promoted}'
				</script>
			</li>
			<li>
				<label class="extra">额度控制：</label>
				<select class="tool-select" name="fundInfo.quota_control" id="quota_control" onchange="show_quota()">
					<c:forEach items="${K_QUOTACONTROL}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('quota_control').value='${fundInfo.quota_control}'
				</script>
			</li>
			<li id="total_control">
				<label class="extra">总额度：</label>
				<input class="tool-text" name="fundInfo.issue_total" type="text" value="${fundInfo.issue_total}" />
			</li>
			<li id="channel_control">
				<ul class="clearfix">
				<li>
					<label class="extra">web总额度：</label>
					<input class="tool-text" name="fundInfo.web_total" type="text" value="${fundInfo.web_total}" />
				</li>
				<li>
					<label class="extra">app总额度：</label>
					<input class="tool-text" name="fundInfo.app_total" type="text" value="${fundInfo.app_total}" />
				</li>
				<li>
					<label class="extra">微信总额度：</label>
					<input class="tool-text" name="fundInfo.weixin_total" type="text" value="${fundInfo.weixin_total}" />
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
				<script type="text/javascript">
					document.getElementById('sale_channel_control').value='${fundInfo.sale_channel_control}'
				</script>
			</li>
			<li>
				<label id="sale_channel" class="extra">允许销售渠道：</label>
				<span id="sale_channel_content">
					<input name="sale_channel_name" type="checkbox" value="1" />web端&nbsp;&nbsp;
					<input name="sale_channel_name" type="checkbox" value="1" />app端&nbsp;&nbsp;
					<input name="sale_channel_name" type="checkbox" value="1" />微信端&nbsp;&nbsp;
					<input type="hidden" name="fundInfo.sale_channel" id="sale_channel_hidden" value="${fundInfo.sale_channel}" />
				</span>
			</li>
		</ul>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="修改" />&nbsp;
			<input class="tool-btn" type="button" value="返 回" onclick="history.back();" />
		</div>
	</form>
	<script type="text/javascript">
	
		$(document).ready(function() {
			show_quota();
			show_sale();
			initCheckBox();
		});
		
		function initCheckBox(){
			var initVal = document.getElementById("sale_channel_hidden").value;
			var obj = document.getElementsByName("sale_channel_name");
			for(i=0;i<initVal.length;i++){
				 //alert(initVal.charAt(i));
				 if(initVal.charAt(i) =="1"){
					 obj[i].checked = 1;
				 }
			}
		}
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
		
		function doSave() {
			getCheckBoxVal();
			setTimeout("form.submit();", 100);
			return false;
		}
		
		function doBack() {
			backForm.action = "fundInfoAction_toQuery";
			backForm.submit();
		}
	</script>		
	</body>
</html>
