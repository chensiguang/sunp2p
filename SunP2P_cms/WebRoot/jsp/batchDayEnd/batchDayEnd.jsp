<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>日终清算</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="${ctx}/style/tools.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/style/main-css/global.css" type="text/css" />
<script src="${ctx}/javascript/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ctx}/javascript/layer/layer.min.js"></script>
<style>
.batch_order {
	background-attachment: initial;
	background-clip: initial;
	background-color: rgba(6, 72, 131, 0.0976563);
	background-image: initial;
	background-origin: initial;
	background-position: initial initial;
	background-repeat: initial initial;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
    margin-left: auto;
    margin-right: auto;
	padding: 60px;
	width: 700px;
}
.pipelineGroup {
    background-color: #fcae3f;
	background-color: rgba(252, 174, 63, 0.7);
}
.batch-card {
    float: left;
    height:70px;
    line-height:70px;
    margin:0 10px 10px 0;
    display:inline;
}

.batch-card img {
	margin-top:25px;
}

.rounded {
    width: 141px;
    text-align:center;
    -webkit-opacity: 0.9;
    opacity: 0.9;

    -webkit-border-radius: 6px;
    border-radius: 4px;

    -webkit-box-shadow: 4px 4px 4px #555;
    box-shadow: 4px 4px 4px #555;

    font-size: 12px;
    font-weight: normal;
    color: white;
    margin-left: auto;
    margin-right: auto;
    
	cursor:pointer;
}
.UnActivated {
	background-color: #c8c6c7 !important;
    color: #222;
}

.Success {
    background-color: #1bd130;
    color: #222;
}

.Failure {
    background-color: #ef2929;
}

.Processing {
    background-color: #f7f94b;
    color: #222;
}

.Activated {
    background-color: #c8c6c7;
    color: #222;
}

.Abort {
    background-color: #bab4b4;
}

.Pending {
    background-color: #00ccff;
    color: #222;
}

</style>
</head>
<!-- 
 * 0 - 未激活 - disabled
 * 1 - 已激活 - NOT_BUILT
 * 2 - 作业暂停 - PENDING
 * 3 - 作业成功 - SUCCESS
 * 4 - 作业失败 - FAILURE
 * 5 - 作业中断 - ABORT
 * Z - 正在处理  - BUILDING
 -->
<body>
	<div class="main-title" id="Title"><!--页面标题-->
       	日终清算
    </div>
	<form action="batchDayEndAction_batchDayEnd" id="batchDayEnd" method="post" name="batchDayEnd">
		<div class="toolBar">
			<span class="toolbar-icon"></span>
				日终清算
		</div>
	</form>
	<div class="batch_order" >
		<div><h1>日终清算</h1></div><br />
		<ul class="pipelineGroup clearfix" >
			<c:forEach items="${batchOrders}" var="order" varStatus="index" >
				<%-- <li class="batch-card rounded ${order.deal_status}" onclick="${order.reserve1}()" >${order.task_name}</li> --%>
 				<li class="batch-card rounded ${order.deal_status}" onclick="t00038_batchStart()" >${order.task_name}</li>
				<c:if test="${!index.last}">
					<li class="batch-card" ><img src="${ctx}/images/next.png" alt="next" /></li>
				</c:if>
				<c:if test="#{index.last}">
					<img src="" alt="next" />
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<script type="text/javascript">
		/* $(document).ready(function() {
			//获取用户的权限
			$.ajax({
				type : "post",
				url : "batchDayEndAction_batchDayEn",
				dataType : "text",
				cache : false,
				success : function(result) {
					var tmpPrivilege = eval("("+result+")");
					var privilegeHtml=$("#myPrivileges").html();
					$.each(tmpPrivilege, function(i, list) {
						privilegeHtml += "<li class='batch-card rounded "+list.deal_status+"'"+" onclick='batchAutoAction_autoProcess()'>"+list.task_name+"</li>";
					});
					$("#myPrivileges").html(privilegeHtml);
				}
			});
		})	 */
		
		//setTimeout("batchDayEnd()", 5000);
		
		function batchAutoAction_autoProcess() {
			window.location.href = "batchAutoAction_autoProcess";
		}
		
		function batchDayEnd() {
			window.location.href = 'batchDayEndAction_batchDayEnd';
		}
		
		function t00038_batchStart() {
			$.layer({
		        type: 2,
		        title: '清算开始',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 't00038_batchStart'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		
		function t00039_batchEnd() {
			$.layer({
		        type: 2,
		        title: '清算结束',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 't00039_batchEnd'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function t00045_prodEnd() {
			$.layer({
		        type: 2,
		        title: '产品终止',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 't00045_prodEnd'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function t00044_invalid() {
			$.layer({
		        type: 2,
		        title: '债权转让失效',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 't00044_invalid'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function batchP2pAction_establish() {
			$.layer({
		        type: 2,
		        title: 'p2p产品成立',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 'batchP2pAction_establish'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function batchP2pAction_checkRepaymentInfo() {
			$.layer({
		        type: 2,
		        title: 'p2p还款检查',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 'batchP2pAction_checkRepaymentInfo'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function batchP2pAction_batchRepayment() {
			$.layer({
		        type: 2,
		        title: 'p2p批量还款',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 'batchP2pAction_batchRepayment'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function sumDataAction_summarizationData() {
			$.layer({
		        type: 2,
		        title: '数据汇总',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 'sumDataAction_summarizationData'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		function t00047_doFiling() {
			$.layer({
		        type: 2,
		        title: '文件归档',
		        maxmin: false,
		        area : ['500px' , '370px'],
		        offset : ['', ''],
		        iframe: {src: 't00047_doFiling'},
		        close: function(index){
		            parent.frames['${frame}'].location.href='batchDayEndAction_batchDayEnd';
		        }
		    });
		}
		
	</script>
</body>
</html>
