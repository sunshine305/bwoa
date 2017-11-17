<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet" href="css/sapar.css" />
<link rel="stylesheet" type="text/css" href="css/detail.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<script type="text/javascript" src="js/WdatePicker.js"></script>
<script type="text/javascript" src="js/total.js"></script>
<title>统计</title>
</head>
<body>
<script type="text/javascript">
 function showDetail() {

	window.showModalDialog('xxx.do',window, 'height=100, width=400, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')

}
</script>
	<div id="saper-container">
		<div id="saper-hd"></div>
		<div id="saper-bd">
			<div class="subfiled clearfix">
				<h2>数据统计</h2>
			</div>
			<div class="subfiled-content">
				<div class="search-box clearfix">
					<div class="kv-item clearfix">
						<label>日期：</label>
						<div class="kv-item-content time-select-wrap">
							<div class="time-select">
								<input id="startTime" type="text" onfocus="changInputType(startTime)"
									placeholder="开始时间"> <i class="date-icon"></i>
							</div>
							<span class="line">-</span>
							<div class="time-select">
								<input id="endTime" type="text" onfocus="changInputType(endTime)"
									placeholder="结束时间"> <i class="date-icon"></i>
							</div>
						</div>
					</div>
					<div class="kv-item clearfix">
						<label>户型：</label>
						<div class="kv-item-content">
							<select name="">
								<option value="">全部</option>
								<option value="">老户</option>
								<option value="">新户</option>
							</select>
						</div>
						<label>盘型：</label>
						<div class="kv-item-content">
							<select name="">
								<option value="">全部</option>
								<option value="">主盘</option>
								<option value="">分盘</option>
							</select>
						</div>
					</div>

					<a href="javascript:;" class="sapar-btn sapar-btn-recom query-btn">查询</a>
				</div>
				<div class="alert alert-warning" role="alert">
					总金额:<b>¥0</b>&nbsp;&nbsp;&nbsp;已交金额:<b>¥0</b>&nbsp;&nbsp;&nbsp;未交金额:<b>¥0</b>
				</div>

				<!--表格开始-->
				<div class="table">

					<!--表格操作-->
					<div class="table-operate ue-clear">
						<a href="javascript:;" class="add">导出excel</a>
					</div>

					<!--表格具体内容-->
					<div class="table-box">
						<table>
							<thead>
								<tr>
									<th class="num">新户数量</th>
									<th class="name">服务费(老)</th>
									<th class="process">通用设备销售数量</th>
								</tr>
							</thead>
							<tbody>
								<tr class="no-data">
									<td>暂无数据</td>
									<td><a href="javascript:showDetail();">点进去有明细</a></td>
									<td>暂无数据</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!--表格结束-->
			</div>
		</div>
		<div id="saper-ft"></div>
	</div>
</body>
</html>