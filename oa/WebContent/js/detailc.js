/**
 * 
 */
function showXHDetail() {
		var content = "<br><br><br><div class=\"alert alert-warning\" role=\"alert\">明细</div>"+
						//表格开始
						"<div class=\"table\">"+
							//表格操作
							"<div class=\"table-operate ue-clear\"><a href=\"javascript:;\" class=\"add\">导出excel</a></div>"+
							//表格具体内容	
							"<div class=\"table-box\">" +	
							"<table><thead><tr><th class=\"num\">地区</th>" +
										"<th class=\"name\">280</th>" +
										"<th class=\"process\">140</th><th class=\"process\">合计</th></tr></thead><tbody>"+
										"<tr class=\"no-data\"><td><a>合计</a></td>"+
											"<td><a>暂无数</a></td>"+
											"<td><a>暂无数据</a></td></tr>"+
										"<tr class=\"no-data\">" +
										"<td><a>暂无数据</a></td>" +
										"<td><a>暂无数</a></td>" +
										"<td><a>暂无数据</a></td></tr></tbody></table></div></div>";
						//表格结束
		document.getElementById('detail').innerHTML = content;
		//alert(content);
		document.getElementById('detail').style.display="";

	} 
function showOldDetail() {
	var content = "<br><br><br><div class=\"alert alert-warning\" role=\"alert\">明细</div>"+
					//表格开始
					"<div class=\"table\">"+
						//表格操作
						"<div class=\"table-operate ue-clear\"><a href=\"javascript:;\" class=\"add\">导出excel</a></div>"+
						//表格具体内容	
						"<div class=\"table-box\">" +	
						"<table><thead><tr><th class=\"num\">地区</th>" +
									"<th class=\"name\">280</th>" +
									"<th class=\"process\">140</th><th class=\"process\">合计</th></tr></thead><tbody>"+
									"<tr class=\"no-data\"><td><a>合计</a></td>"+
										"<td><a>暂无数</a></td>"+
										"<td><a>暂无数据</a></td></tr>"+
									"<tr class=\"no-data\">" +
									"<td><a>暂无数据</a></td>" +
									"<td><a>暂无数</a></td>" +
									"<td><a>暂无数据</a></td></tr></tbody></table></div></div>";
					//表格结束
	document.getElementById('detail').innerHTML = content;
	//alert(content);
	document.getElementById('detail').style.display="";

} 