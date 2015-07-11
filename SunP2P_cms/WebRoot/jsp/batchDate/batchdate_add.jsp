<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/public/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>清算日编辑</title>
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
       	清算日编辑	
    </div>
					<form id="form" name="form" method="post" action="batchDateAction_add">
						<c:if test="${empty param._backUrl}">
							<input type="hidden" name="_backUrl" value="batchDateAction_toQuery"/>
						</c:if>
						${paramCover.unCoveredInputs}
						<ul class="main-actions clearfix" id="itemList">
							<li>
								<label class="extra">清算日类型：</label>
								<select class="tool-select" name="batchdate_type" id="batchdate_type" onchange="show_batchType()">
									<c:forEach items="${K_BATCHDATETYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
								<script type="text/javascript">
									document.getElementById('batchdate_type').value='${rst.batchdate_type}'
								</script>
							</li>
							<li id="prod_type">
								<label class="extra">产品类型：</label>
								<select class="tool-select" name="prod_type" id="prod_type_show">
									<c:forEach items="${K_PRODTYPE}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
								<script type="text/javascript">
									document.getElementById('prod_type_show').value='${rst.prod_type}'
								</script>
							</li>
							<li id="prod_id">
								<label class="extra">产品代码：</label>
								<input name="prod_id" type="text" class="tool-text" value="${rst.prod_id}" />
							</li>
							<li>
								<label class="extra">批量添加：</label>
								<select class="tool-select" name="batch_add" id="batch_add" onchange="show_batchAdd()">
									<c:forEach items="${K_BATCHADD}" var="rst">
										<option value ="${rst.val}">${rst.prompt}</option>
									</c:forEach>
								</select>
								<script type="text/javascript">
									document.getElementById('batch_add').value='${rst.batch_add}'
								</script>
							</li>
							
							<li id="choose_year">
								<label class="extra">选择年份：</label>
								<input name="choose_year" type="text" class="tool-text" value="${rst.choose_year}" onfocus="WdatePicker({dateFmt:'yyyy'})"/>
							</li>
							
							<li id="choose_month">
								<label class="extra">选择月份：</label>
								<input name="month_start" type="text" class="tool-text" value="${rst.month_start}" onfocus="WdatePicker({dateFmt:'yyyy-MM'})"/>&nbsp;&nbsp;--&nbsp;&nbsp;
								<input name="month_end" type="text" class="tool-text" value="${rst.month_end}" onfocus="WdatePicker({dateFmt:'yyyy-MM'})"/>
							</li>
							
							<li id="choose_date">
								<label class="extra">选择日期范围：</label>
								<input name="date_start" type="text" class="tool-text" value="${rst.date_start}" onfocus="WdatePicker()"/>&nbsp;&nbsp;--&nbsp;&nbsp;
								<input name="date_end" type="text" class="tool-text"  value="${rst.date_end}" onfocus="WdatePicker()"/>
							</li>
							<li>
								<label class="extra">清算日期：</label>
								<input name="spec_date" type="text" class="tool-text" value="${rst.spec_date}"/>
							</li>
							
							<li>
								<label class="extra">非清算日期：</label>
								<input name="not_batch_date" type="text" class="tool-text" value="${rst.not_batch_date}"/>
							</li>
							
							<li>
								<label class="extra">清算时间：</label>
								<input name="batch_time" type="text" class="tool-text" value="${rst.batch_time}"  onfocus="WdatePicker({dateFmt:'H:mm:ss'})"/>
							</li>
							
						</ul>
						<div class="tool-buttons">
							<input class="tool-btn" type="submit" value="保存" />&nbsp;
							<input class="tool-btn" type="reset"  value="重 置" />&nbsp;
							<input class="tool-btn" type="button" value="返 回" onclick="history.back();" />
						</div>
					</form>
	<script type="text/javascript" >
		$(document).ready(function() {
			show_batchType();
			show_batchAdd();
			$("#form").validate({onfocusout: function(element) { $(element).valid(); },});
		});	
		
		function show_batchType(){
			var val = $('#batchdate_type option:selected').val();
			if(val == '0'){
				$('#prod_type').hide();
				$('#prod_id').hide();
			}else if(val == '1'){
				$('#prod_id').show();
				$('#prod_type').hide();
			}else if(val == '2'){
				$('#prod_id').hide();
				$('#prod_type').show();
			}
		}
		
		function show_batchAdd(){
			var val = $('#batch_add option:selected').val();
			if(val == '0'){
				$('#choose_year').show();
				$('#choose_month').hide();
				$('#choose_date').hide();
			}else if(val == '1'){
				$('#choose_year').hide();
				$('#choose_month').show();
				$('#choose_date').hide();
			}else if(val == '2'){
				$('#choose_year').hide();
				$('#choose_month').hide();
				$('#choose_date').show();
			}
		}
		
	</script>
</body>
</html>
