<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" import="com.sunyard.directbank.prod.model.ProdBaseInfo"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>复核产品</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
		<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
	</head>
	<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	复核产品	
    </div>
	<form name="form" id="form" method="post" action="prodInfoAction_check" onsubmit="return doPass();">
		<input type="hidden" name="issue_state">
		<c:if test="${empty param._backUrl}">
			<input type="hidden" name="_backUrl" value="prodInfoAction_toQuery"/>
		</c:if>
		${paramCover.unCoveredForbidInputs}
		
		<ul class="main-actions clearfix">
			<li>
				<label class="extra">产品代码：</label>
				<input class="tool-text" name="prodInfo.prod_id" value="${prod.prod_id }" type="text" readonly="readonly"/>
			
			</li>
			<li>
				<label class="extra">产品名称：</label>
				<input class="required  tool-text" name="prodInfo.prod_name" value="${prod.prod_name }" type="text" />
			</li>
			<li>
				<label class="extra">产品类型：</label>
				<select class="tool-select" name="prodInfo.prod_type" id="prod_type" onchange="show_borrower()">
					<c:forEach items="${K_PRODTYPE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('prod_type').value='${prod.prod_type}';
				</script>
			</li>
			<li>
				<label class="extra">年化收益率：</label>
				<input class="required number tool-text" name="prodInfo.ist_year" value="${prod.ist_year }" type="text" />
			</li>
			<li>
				<label class="extra">产品周期(月)：</label>
				<input class="required digits tool-text" name="prodInfo.cycle" value="${prod.cycle }" type="text" id="cycle"/>
			</li>
			<li>
				<label class="extra">产品发行日：</label>
				<input class="required date tool-text" name="prodInfo.sell_date" id="sell_date" type="text" value="${prod.sell_date }" onfocus="WdatePicker()" />
			</li>
			<li>
				<label class="extra">产品风险等级：</label>
				<select class="tool-select" name="prodInfo.risk_lvl" id="risk_lvl">
					<c:forEach items="${K_RISKLVL}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('risk_lvl').value='${prod.risk_lvl}';
				</script>
			</li>
			<li>
				<label class="extra">最小购买金额：</label>
				<input class="required number tool-text" name="prodInfo.lowest_limit" value="${prod.lowest_limit }" type="text" />
			</li>
			<li>
				<label class="extra">最小追加金额：</label>
				<input class="required number tool-text" name="prodInfo.addition_limit" value="${prod.addition_limit }" type="text" />
			</li>
			<li>
				<label class="extra">融资信息编号：</label>
				<input class="required  tool-text" name="prodInfo.financ_id" value="${prod.financ_id }" type="text" />
			</li>
			<li>
				<label class="extra">还款方式：</label>
				<select class="tool-select" name="prodInfo.repay_type" id="repay_type">
					<c:forEach items="${K_REPAYTYPE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				document.getElementById('repay_type').value='${prod.repay_type}';
				</script>
			</li>
			<li>
				<label class="extra">产品起息方式：</label>
				<select class="tool-select" name="prodInfo.value_type" id="value_type" onchange="show_date()">
					<c:forEach items="${K_VALUETYPE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					document.getElementById('value_type').value='${prod.value_type}';
					function show_date(){
					    var val = document.getElementById('value_type').value;
					    if(val == '2'){
					      $('#show_value_date').show();
					      $('#show_expire_date').show();
					    }else{
					      $('#show_value_date').hide();
					      $('#show_expire_date').hide();
					    }
					}
				</script>
			</li>
			
			<li id="show_value_date">
				<label class="extra">产品起息日：</label>
				<input class="required date tool-text" name="prodInfo.value_date" value="${prod.value_date }" type="text" id="value_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',onpicked:function(dp){SetEndDate($dp.$('expire_date'));}});"/>
			</li>
			<li id="show_expire_date">
				<label class="extra">产品到期日：</label>
				<input class="required date tool-text" name="prodInfo.expire_date" value="${prod.expire_date }" type="text"  id="expire_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
			</li>
			<li>
				<label class="extra">产品审核机构：</label>
				<input class="required tool-text" name="prodInfo.prod_checker" value="${prod.prod_checker }" type="text" />
			</li>
			
			<li>
				<label class="extra">产品状态：</label>
				<select class="tool-select" name="prodInfo.prod_state" id="prod_state">
					<c:forEach items="${K_PRODSTATE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('prod_state').value = '${prod.prod_state }';
				</script>
			</li>
			<li id="transfer_rate">
				<label class="extra">转让费率：</label>
				<input class="required number tool-text" name="prodInfo.transfer_rate" value="${prod.transfer_rate }" type="text" />
			</li>
			<li id="transfer_valid_day">
				<label class="extra">转让有效天数：</label>
				<input class="required digits tool-text" name="prodInfo.transfer_valid_day" value="${prod.transfer_valid_day }" type="text" />
			</li>
			<li>
				<label class="extra">是否推荐：</label>
				<select class="tool-select" name="prodInfo.hpage_promoted" id="hpage_promoted">
					<c:forEach items="${K_HPAGEPROMOTED}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('hpage_promoted').value = '${prod.hpage_promoted }';
				</script>
			</li>
			<li>
				<label class="extra">额度控制：</label>
				<select class="tool-select" name="prodInfo.quota_control" id="quota_control" onchange="show_quota()">
					<c:forEach items="${K_QUOTACONTROL}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('quota_control').value = '${prod.quota_control }';
				</script>
			</li>
			<li id="total_control">
				<label class="extra">总额度：</label>
				<input class="required  number tool-text" name="prodInfo.total_limit" value="${prod.total_limit }" type="text" />
			</li>
			<li id="channel_control">
				<ul class="clearfix">
					<li>
						<label class="extra">web总额度：</label>
						<input class="required number tool-text" name="prodInfo.web_total" value="${prod.web_total }" type="text" />
					</li>
					<li>
						<label class="extra">app总额度：</label>
						<input class="required number tool-text" name="prodInfo.app_total" value="${prod.app_total }" type="text" />
					</li>
					<li>
						<label class="extra">微信总额度：</label>
						<input class="required number tool-text" name="prodInfo.weixin_total" value="${prod.weixin_total }" type="text" />
					</li>
				</ul>
			</li>
			<li>
				<label class="extra">销售渠道控制：</label>
				<select class="tool-select" name="prodInfo.sale_channel_control" id="sale_channel_control" onchange="show_sale()">
					<c:forEach items="${K_SALECHANNELCONTROL}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('sale_channel_control').value = '${prod.sale_channel_control }';
				</script>
			</li>
			<li>
				<label class="extra" id="sale_channel">允许销售渠道：</label>
				<span id="sale_channel_content">
					<input name="sale_channel_name" type="checkbox" value="1" />web端&nbsp;&nbsp;
					<input name="sale_channel_name" type="checkbox" value="1" />app端&nbsp;&nbsp;
					<input name="sale_channel_name" type="checkbox" value="1" />微信端&nbsp;&nbsp;
					<input type="hidden" name="prodInfo.sale_channel" id="sale_channel_hidden"  value="${prod.sale_channel }"/>
				</span>
			</li>
			<li>
				<label class="extra">产品收款账号：</label>
				<input class="required number tool-text" name="prodInfo.debit_account" value="${prod.debit_account }" type="text" />
			</li>
			<li>
				<label class="extra">产品付款账号：</label>
				<input class="required number tool-text" name="prodInfo.crebit_account" value="${prod.crebit_account }" type="text" />
			</li>
			</ul>
			<div id="show_borrower">
			   <ul class="main-actions clearfix">
			<li>
				<label class="extra">融资方类型：</label>
				<select class="tool-select" name="prodExtInfo.borrower_type" id="borrower_type">
					<c:forEach items="${K_BORROWERTYPE}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('borrower_type').value = '${prodExt.borrower_type }';
				</script>
			</li>
			<li>
				<label class="extra">融资方名称：</label>
				<input class="required  tool-text" name="prodExtInfo.borrower_name" value="${prodExt.borrower_name }" type="text" />
			</li>
			<li>
				<label class="extra">融资方年龄：</label>
				<input class="required digits tool-text" name="prodExtInfo.borrower_age" value="${prodExt.borrower_age }" type="text" />
			</li>
			<li>
				<label class="extra">融资方学历：</label>
				<select class="tool-select" name="prodExtInfo.borrower_edu" id="borrower_edu">
					<c:forEach items="${K_BORROWEREDU}" var="rst">
						<option value ="${rst.val}">${rst.prompt}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
				 document.getElementById('borrower_edu').value = '${prodExt.borrower_edu }';
				</script>
			</li>
			<li>
				<label class="extra">融资方收入：</label>
				<input class="required number tool-text" name="prodExtInfo.borrower_inc" value="${prodExt.borrower_inc }" type="text" />
			</li>
			<li>
				<label class="extra">收入来源：</label>
				<input class="required  tool-text" name="prodExtInfo.borrower_src" value="${prodExt.borrower_src }" type="text" />
			</li>
			<li>
				<label class="extra">融资方所在地：</label>
				<input class="required  tool-text" name="prodExtInfo.borrower_adr" value="${prodExt.borrower_adr }" type="text" />
			</li>
		</ul>
	  </div>
		<div class="tool-buttons">
			<input class="tool-btn" type="submit" value="复核通过">&nbsp;
			<input class="tool-btn" type="button" value="复核拒绝" onclick="doRefuse()">&nbsp;
			<input class="tool-btn" type="button" value="返 回" onclick="history.back();">
		</div>
		</form>
	</body>
	<script type="text/javascript">
	
		$(document).ready(function() {
		    show_date();
			show_quota();
			show_sale();
			show_borrower();
			show_transfer();
			
			initCheckBox();
			disabledState();
		});
		
		function disabledState(){
			$(":input").attr("disabled","disabled");
			$(":submit").removeAttr("disabled");
			$(":button").removeAttr("disabled");
		}
		
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
		
		function show_borrower(){
		    var type = $('#prod_type option:selected').val();
		    if(type == '1'){
		       $('#show_borrower').show();
		    }else{
		       $('#show_borrower').hide();
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
		
		function show_transfer(){
		  var state = $('#prod_state option:selected').val();
		  if(state == '6'){
		   $('#transfer_rate').show();	
		   $('#transfer_valid_day').show();	   
		  }else{
		   $('#transfer_rate').hide();	
		   $('#transfer_valid_day').hide();	
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
		
	/* 	function getCheckBoxVal(){
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
		} */
		
		
		function doPass(){
			$(":input").removeAttr("disabled");
			form.issue_state.value = "1"; //表示复核通过
			form.submit();
			disabledState();
			return false;
		}
		
		function doRefuse(){
			$(":input").removeAttr("disabled");
			form.issue_state.value = "2"; //表示复核拒绝
			form.submit();
			disabledState();
			return false;
		}
		
		function doBack() {
			backForm.action = "prodInfoAction_toQuery";
			backForm.submit();
		}
	</script>
</html>
