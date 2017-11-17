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
<link href="<%=path%>/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<%=path%>/ztree/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/ztree/js/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript" src="js/total.js"></script>
<script type="text/javascript" src="js/detailc.js"></script>
<title>统计</title>
</head>
<body>
	
	<div id="saper-container">
		<div id="saper-hd"></div>
		<div id="saper-bd">
			<div class="subfiled clearfix">
				<h2>数据统计</h2>
			</div>
			<div style="position: absolute; left: 20px; top: 50px;">
				<!-- 菜单实现 -->
				<div class="zTreeDemoBackground left"
					style="position: absolute; left: 0px;">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
			</div>
			<div
				style="position: absolute; left: 25%; top: 50px; width: 75%; height: 100%">
				<div class="subfiled-content">
					<div class="search-box clearfix">
						<div class="kv-item clearfix">
							<label>日期：</label>
							<div class="kv-item-content time-select-wrap">
								<div class="time-select">
									<input id="startTime" type="text"
										onfocus="changInputType('startTime')" placeholder="开始时间">
									<i class="date-icon"></i>
								</div>
								<span class="line">-</span>
								<div class="time-select">
									<input id="endTime" type="text"
										onfocus="changInputType('endTime')" placeholder="结束时间">
									<i class="date-icon"></i>
								</div>
							</div>

						</div>
						<a href="javascript:;" class="sapar-btn sapar-btn-recom query-btn">查询</a>
					</div>

					<div class="alert alert-warning" role="alert">
						广西百旺
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
									<tr >
										<td><a href="javascript:showXHDetail();">暂无数据</a></td>
										<td><a href="javascript:showDetail();">暂无数</a></td>
										<td><a href="javascript:showDetail();">暂无数据</a></td>
									</tr>
									

								</tbody>
							</table>
						</div>
					</div>
					<!--表格结束-->
					<!-- 明细表格 -->
					<div id="detail" style="display: none">
					</div>
				</div>
			</div>
		</div>
		<div id="saper-ft"></div>
	</div>
</body>
</html>