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
<link rel="stylesheet" href="css/sapar.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sapar.js"></script>
<title>信息录入</title>
</head>
<script type="text/javascript">
	function showEqm() {
		document.getElementById("serverMoney").style.display = "none";
		document.getElementById("equipment").style.display = "";
	}

	function showFwf() {
		document.getElementById("equipment").style.display = "none";
		document.getElementById("serverMoney").style.display = "";
	}
	/*
	*添加设备信息
	*/
	function eqmAdd() {
		//获取填写的数据信息
		var name=document.getElementById("equipmentName").value;
		var quantity=document.getElementById("equipmentQuantity").value;
		var isInvoice=getRadioBoxValue("isInvoice");
		//添加设备信息
		$.ajax({
		url:"performanceInfo/addEquipment.do",
		type:"post",
		data:{"name":name,"quantity":quantity,"isInvoice":isInvoice},
		success: function(data){
			if(data=="success"){
				alert("添加成功！");
				$.ajax({
				url:"performanceInfo/showUpdate.do",
				type:"post",
				data:{},
				success: function(data){
					//刷新页面
					window.location.reload();
				}
			});			
			}else{
				alert("添加失败");
			}
		}
	});				
		
	}
	/*
	*添加服务费信息
	*/
	function serviceChargeAdd(){		
		//获取填写的数据信息
		var familyType=getRadioBoxValue("familyType");
		var plateType=getRadioBoxValue("plateType");
		var invoice=getRadioBoxValue("invoice");
		var number=document.getElementById("number").value;		
		//添加服务费信息
		$.ajax({
		url:"performanceInfo/addServiceCharge.do",
		type:"post",
		data:{"familyType":familyType,"plateType":plateType,"isInvoice":invoice,"quantity":number},
		success: function(data){
			if(data=="success"){
				alert("添加成功！");
				//更新显示列表
				$.ajax({
				url:"performanceInfo/showUpdate.do",
				type:"post",
				data:{},
				success: function(data){
					//刷新页面					
					window.location.reload();
				}
			});
			}else{
				alert("添加失败");
			}
		}
	});	
	
	}
	/*
	*获取radio选中的值
	*/
	function   getRadioBoxValue(radioName) 
	{ 
	    var obj = document.getElementsByName(radioName);  //这个是以标签的name来取控件
	       for(i=0; i<obj.length;i++)    {
	          if(obj[i].checked)    { 
	                 return   obj[i].value; 
	             } 
	       }         
	   return "undefined";       
	}
</script>
<script type="text/javascript">
var isFirst=true;
function showEquipmentName(){	
	var equipment=document.getElementById("equipmentName");
	$.ajax({
		url:"performanceInfo/getEquipmentName.do",
		type:"post",
		data:{},			
		dataType:"json",
		success: function(data){			
			//判断是否为第一次执行
			if(isFirst==true){				
				//将数据转换成json格式										
				var child=eval(data);				
				for(var i=0;i<child.length;i++){
				//动态的创建节点				
				var equipmentName=document.createElement("option");				
				//设置节点的value属性				
				equipmentName.innerHTML=child[i];				
				//添加子节点
				equipment.appendChild(equipmentName);
				//设置全局变量为
				isFirst=false;	
			}
															
		}
	}
		
	});	
}
			
</script>
<body>
	<div id="saper-container">
		<div id="saper-hd"></div>
		<div id="saper-bd">
			<div class="subfiled clearfix">
				<h2>收款信息录入</h2>
			</div>

			<div class="subfiled-content">
				<div class="kv-item clearfix">
					<label>收款类型：</label>
					<div class="kv-item-content">
						<span class="choose"> <input type="radio" name="money"
							onclick="showEqm()"> <span class="text">设备</span>
						</span> <span class="choose"> <input type="radio" name="money"
							onclick="showFwf()"> <span class="text">服务费</span>
						</span>
					</div>

				</div>

			</div>

			<div id="equipment" style="display: none;">
				<div class="subfiled-style2 clearfix">
					<h2>设备收款</h2>
				</div>
				<div class="kv-item clearfix">
					<br /> <label>设备类型：</label>
					<div class="kv-item-content">
						<select onclick="showEquipmentName()" name="name" id="equipmentName">
							<option>请选择设备</option>							
						</select>
					</div>
				</div>
				<div class="kv-item clearfix">
					<label>数量：</label>
					<div class="kv-item-content">
						<input type="text" id="equipmentQuantity"/>
					</div>
				</div>
				<div class="kv-item clearfix">
					<label>是否开票：</label>
					<div class="kv-item-content">
						<span class="choose"> <input type="radio" name="isInvoice" checked="checked" value="1">
							<span class="text">是</span>
						</span> <span class="choose"> <input type="radio" name="isInvoice" value="0">
							<span class="text">否</span>
						</span>
					</div>
				</div>
				<a href="javascript:eqmAdd();"
					class="sapar-btn sapar-btn-recom query-btn">添加</a><br />
			</div>

			<div id="serverMoney" style="display: none;">
				<div class="subfiled-style2 clearfix">
					<h2>服务费收款</h2>
					<br />
				</div>
				<div class="kv-item clearfix">
					<br /> <label>户型：</label>
					<div class="kv-item-content">
						<span class="choose"> <input type="radio" name="familyType" checked="checked" value="老户">
							<span class="text">老户</span>
						</span> <span class="choose"> <input type="radio" name="familyType" value="新户">
							<span class="text">新户</span>
						</span>
					</div>
				</div>
				<div class="kv-item clearfix">
					<label>盘型：</label>
					<div class="kv-item-content">
						<span class="choose"> <input type="radio" name="plateType" checked="checked" value="主盘">
							<span class="text">主盘</span>
						</span> <span class="choose"> <input type="radio" name="plateType" value="分盘">
							<span class="text">分盘</span>
						</span>
					</div>
				</div>
				<div class="kv-item clearfix">
					<label>数量：</label>
					<div class="kv-item-content">
						<input type="text" id="number"/>
					</div>
				</div>
				<div class="kv-item clearfix">
					<label>是否开票：</label>
					<div class="kv-item-content">
						<span class="choose"> <input type="radio" name="invoice" checked="checked" value="1">
							<span class="text">是</span>
						</span> <span class="choose"> <input type="radio" name="invoice" value="0">
							<span class="text">否</span>
						</span>
					</div>
				</div>
				<a href="javascript:serviceChargeAdd();" class="sapar-btn sapar-btn-recom query-btn">添加</a><br />
			</div>

			<br />
			<div class="subfiled-style2 clearfix">
				<h2>已添加信息</h2>
			</div>

			<!--表格开始-->
			<div class="table">

				<!--表格具体内容-->
				<div class="table-box">
					<table>
						<thead>
							<tr>
								<th>收款类型</th>
								<th>类型</th>
								<th>数量</th>
								<th>是否开票</th>
								<th>操作</th>
							</tr>
						</thead>						
						<c:forEach items="${infoVos}" var="infoVo">
							<tbody>
								<tr>
									<div id="newInfo">
										<td>${infoVo.equipmentId==0?'设备':'服务费'}</td>
										<td>${infoVo.type}</td>
										<td>${infoVo.quantity}</td>
										<td>${infoVo.isInvoice==1?'是':'否'}</td>
										<th><a>刪除</a>&nbsp;&nbsp;&nbsp;&nbsp; <a>修改</a></th>
									</div>
								</tr>
							</tbody>
						</c:forEach>
						
					</table>
				</div>
			</div>
			<!--表格结束-->
			<br>
			<div class="subfiled-style2 clearfix">
				<h2>填写收款金额</h2>
			</div>
			<div class="subfiled-content">
				<div class="kv-item clearfix">
					<label>銷售收入：</label>
					<div class="kv-item-content">
						<input type="text" placeholder="填写你想要备注的内容哦" />
					</div>
					<label>已上交：</label>
					<div class="kv-item-content">
						<input type="text" placeholder="填写你想要备注的内容哦" />
					</div>
					<label>未上交：</label>
					<div class="kv-item-content">
						<input type="text" placeholder="填写你想要备注的内容哦" disabled />
					</div>
				</div>
				<a href="javascript:;" class="sapar-btn sapar-btn-recom query-btn">提交</a>
			</div>
		</div>
		<div id="saper-ft"></div>
	</div>

</body>

</html>