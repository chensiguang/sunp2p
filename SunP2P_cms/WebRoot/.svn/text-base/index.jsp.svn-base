<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>信雅达直销银行产品v0.1demo版</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="javascript/jquery/jquery-1.11.0.min.js"></script>
	</head>

	<body>
		
		<form action="" method="post">
			<button id="fundInfoBtn">基金产品管理</button>&nbsp;&nbsp;&nbsp;
			<button id="p2pInfoBtn">p2p产品管理</button>&nbsp;&nbsp;&nbsp;
			<button id="custInfoBtn">注册用户查询</button>&nbsp;&nbsp;&nbsp;
			<button id="transInfoBtn">交易流水查询</button>&nbsp;&nbsp;&nbsp;<br>
			<button id="runLogBtn">系统运行日志查询</button>&nbsp;&nbsp;&nbsp;
			<button id="operLogBtn">系统操作日志查询</button>&nbsp;&nbsp;&nbsp;
			<button id="capitalTransBtn">资金交易报表</button>&nbsp;&nbsp;&nbsp;
			<button id="capitalFlowBtn">资金流转报表</button>&nbsp;&nbsp;&nbsp;<br>
			<button id="batchp2pBtn">p2p产品成立</button>&nbsp;&nbsp;&nbsp;
			<button id="batchRepayBtn">p2p还款管理</button>&nbsp;&nbsp;&nbsp;
			<button id="batchRepayCheckBtn">p2p还款检查</button>&nbsp;&nbsp;&nbsp;
			<button id="batchRepay">p2p批量还款</button>&nbsp;&nbsp;&nbsp;
			<button id="sumData">数据汇总</button>&nbsp;&nbsp;&nbsp;
		</form>
	</body>
	
	<script type="text/javascript">
		$('#fundInfoBtn').click(function(){
			document.forms[0].action="fundInfoAction_toQuery";
			document.forms[0].submit();
		});
		
		$('#p2pInfoBtn').click(function(){
			document.forms[0].action="p2pInfoAction_toQuery";
			document.forms[0].submit();
		});
		$('#custInfoBtn').click(function(){
			document.forms[0].action="custInfoAction_toQuery";
			document.forms[0].submit();
		});
		$('#transInfoBtn').click(function(){
			document.forms[0].action="transInfoAction_toQuery";
			document.forms[0].submit();
		});
		$('#runLogBtn').click(function(){
			document.forms[0].action="sysLogAction_toQuery";
			document.forms[0].submit();
		});
		$('#operLogBtn').click(function(){
			document.forms[0].action="sysLogAction_toQuery1";
			document.forms[0].submit();
		});
		$('#capitalTransBtn').click(function(){
			document.forms[0].action="capitalInfoAction_toQuery";
			document.forms[0].submit();
		});
		$('#capitalFlowBtn').click(function(){
			document.forms[0].action="capitalInfoAction_toQuery1";
			document.forms[0].submit();
		});
		$('#batchp2pBtn').click(function(){
			document.forms[0].action="batchP2pAction_establish";
			document.forms[0].submit();
		});
		$('#batchRepayBtn').click(function(){
			document.forms[0].action="batchP2pAction_entryRepaymentInfo";
			document.forms[0].submit();
		});
		$('#batchRepayCheckBtn').click(function(){
			document.forms[0].action="batchP2pAction_checkRepaymentInfo";
			document.forms[0].submit();
		});
		$('#batchRepay').click(function(){
			document.forms[0].action="batchP2pAction_batchRepayment";
			document.forms[0].submit();
		});
		
		$('#sumData').click(function(){
			document.forms[0].action="sumDataAction_summarizationData";
			document.forms[0].submit();
		})
	</script>

</html>
