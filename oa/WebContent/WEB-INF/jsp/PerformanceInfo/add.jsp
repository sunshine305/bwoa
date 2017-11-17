<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<link rel="stylesheet" href="css/JFtable.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<title>信息录入</title>
</head>
<body>
	<div id="saper-container">
		<div id="saper-hd"></div>
		<div id="saper-bd">
			<div class="subfiled clearfix">
				<h2>收款信息录入</h2>
			</div>
			<!--表格开始-->
			<!--表格开始-->
			<div class="table"> 

				<!--表格具体内容-->
				<div class="table-box">
					<table border="1px" cellpadding="0" cellspacing="0"> 
						<thead>
							<tr>
								<th colspan="9">新盘售盘数量</th>
								<th colspan="5">老户服务费收取</th>
								
							</tr>
							<tr>
								<th colspan="4">小规模</th>
								<th colspan="4">一般纳税人</th>	
								<th rowspan="3">合计</th>					
								<th rowspan="2" colspan="2">主盘</th>
								<th rowspan="2" colspan="2">分盘</th>
								<th rowspan="3">合计</th>
								
							</tr>
							<tr>
								<th colspan="2">主盘</th>
								<th colspan="2">分盘</th>								
								<th colspan="2">主盘</th>
								<th colspan="2">分盘</th>
							</tr>
							<tr>
								<th>已开票</th>
								<th>未开票</th>								
								<th>已开票</th>
								<th>未开票</th>
								<th>已开票</th>
								<th>未开票</th>								
								<th>已开票</th>
								<th>未开票</th>
								<th>已开票</th>
								<th>未开票</th>								
								<th>已开票</th>
								<th>未开票</th>
							</tr>
						</thead>						
					
							<tbody>
								<tr>
									<div id="newInfo">	
										
										
									</div>
								</tr>
							</tbody>
						
					</table>
				</div>
			</div>
			<!--表格结束-->
			<br>
			<br>
			<br>
			<!--表格开始-->
			<div class="table"> 
				<!--表格具体内容-->
				<div class="table-box">
					<table border="1px" cellpadding="0" cellspacing="0" bordercolor="blue"> 
						<thead>
							<tr>	
								<th colspan="12">通用设备销售数量</th>
							</tr>
							<tr>						
								<!-- 查询数据库,显示设备型号 -->
								<th rowspan="2">A1</th>
								<th rowspan="2">A2</th>
								<th rowspan="2">A3</th>
								<th rowspan="2">A4</th>
								<th rowspan="2">A5</th>
								<th rowspan="2">A6</th>
								<th rowspan="2">A7</th>
								<th rowspan="2">A8</th>
								<th rowspan="2">A9</th>
								<th rowspan="2">A10</th>
								<th rowspan="2">A11</th>
								<th rowspan="2">合计</th>				
							</tr>
							
						</thead>						
					
							<tbody>
								<tr>
									<div id="newInfo">	
										
										
									</div>
								</tr>
							</tbody>
						
					</table>
				</div>
			</div>
			<!--表格结束-->
			<br>
			<br>
			<br>
			<!--表格开始-->
			<div class="table"> 
				<!--表格具体内容-->
				<div class="table-box">
					<table border="1px" cellpadding="0" cellspacing="0" bordercolor="blue"> 
						<thead>
							<tr>		
								<th colspan="3">金额</th>
							</tr>
							<tr>							
								<th rowspan="2">总销售收入</th>
								<th rowspan="2">已上交</th>
								<th rowspan="2">未上交</th>
							</tr>			
						</thead>						
					
							<tbody>
								<tr>
									<div id="newInfo">	
										<td style="height:30px;width:50px;">
										<!-- 只能输入数字和小数点 -->
											<input onkeyup="value=value.replace(/[^\d.]/g,'')"  maxlength="8" type="text" style="width: 50px;border: 0px" />
										</td>
										<td style="height:30px;width:50px;">
									
											<input onkeyup="value=value.replace(/[^\d.]/g,'')"  maxlength="8" type="text" style="width: 50px;border: 0px" />
										</td>
										<td style="height:30px;width:50px;">
									
											<input onkeyup="value=value.replace(/[^\d.]/g,'')"  maxlength="8" type="text" style="width: 50px;border: 0px" />
										</td>
										
									</div>
								</tr>
							</tbody>
						
					</table>
				</div>
			</div>
			<!--表格结束-->
			
			
			<div class="subfiled-content">
				
				<a href="javascript:;"  style="left: 90%" class="sapar-btn sapar-btn-recom query-btn">提交</a>
			</div>
		</div>
		<div id="saper-ft"></div>
	</div>

</body>

</html>