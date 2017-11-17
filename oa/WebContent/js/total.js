/**
 * @作者 王培源
 */
/** ************************ztree*********************************** */
// 设置ztree标题的颜色,ajax和ztree获取数据的方式都可以用
function setFontCss(treeId, treeNode) {
	return treeNode.level == 1 ? {
		color : "black"
	} : {};
};

var zTreeNodes;
var zTreeObj;
var setting = {
	// check: {
	// enable: true//启动多选框记得导入jquery.ztree.excheck-3.4.js
	// },

	data : {
		simpleData : {
			enable : true,// 如果设置为 true，请务必设置 setting.data.simpleData 内的其他参数:
							// idKey / pIdKey / rootPId，并且让数据满足父子关系。
			idKey : "areaId",
			pIdKey : "parentId",
			rootPId : 1
		},
		key : {
			name : "name",
			url : "" // 设置节点点击之后跳转的链接，打开的是新页面
		}

	},

	view : {
		showLine : false,// 显示连接线
		showIcon : true,// 显示节点图片
		// fontCss: {color:"red"}
		fontCss : setFontCss
	// 节点颜色

	},

	async : { // ztree异步请求数据
		enable : true,
		url : "area/treeNOBM.do",// 请求action方法
		autoparam : [ "id" ]
	},

	callback : {
		// beforeClick: zTreeBeforeClick,
		// 设置节点点击事件
		onClick : zTreeOnclick,
		onAsyncSuccess : zTreeOnAsyncSuccess

	}
};

// 启动树节点
$(function($) {

	$.fn.zTree.init($("#treeDemo"), setting);
});

// 节点点击事件
function zTreeOnclick(event, treeId, treeNode) {
	// var name = document.getElementById("name").value;
	// alert(treeNode.areaId);
	document.getElementById("name").value = "";
	$
			.ajax({
				url : "showAreaRole.do?nowPage=0&name=" + name, // 要提交的URL路径
				type : "get", // 发送请求的方式
				data : "areaId=" + treeNode.areaId, // 要发送到服务器的数据
				dataType : "json", // 指定传输的数据格式
				success : function(result) {// 请求成功后要执行的代码
					document.getElementById("name").value = "";
					// alert("success");
					var paging = "";
					var tbody = "";
					document.getElementById("dq").value = treeNode.name;
					document.getElementById("dqid").value = treeNode.areaId;

					if ((name != null || name != "")) {

						// document.getElementById("choseContext").innerHTML =
						// treeNode.name + ">" +name + ">";
						document.getElementById("choseContext").innerHTML = treeNode.name
								+ ">";
					} else {
						document.getElementById("choseContext").innerHTML = treeNode.name
								+ ">";
					}

					tbody = "<tr>";
					for (var i = 0; i < result.accountAreaEmployeeRoleViewList.length; i++) {
						tbody += "<td id='no'>"
								+ result.accountAreaEmployeeRoleViewList[i].employeeId
								+ "</td>"
								+ "<td>"
								+ result.accountAreaEmployeeRoleViewList[i].areaName
								+ "</td>"
								+ "<td>"
								+ result.accountAreaEmployeeRoleViewList[i].employeeName
								+ "</td><td style='width: 100px;'>"
								+ "<select id="
								+ result.accountAreaEmployeeRoleViewList[i].employeeId
								+ " style='width: 100%;'>"
								+ "<option value="
								+ result.accountAreaEmployeeRoleViewList[i].roleId
								+ ">"
								+ result.accountAreaEmployeeRoleViewList[i].roleName
								+ "</option>";
						for (var j = 0; j < result.roleList.length; j++) {
							if (result.roleList[j].name != result.accountAreaEmployeeRoleViewList[i].roleName) {
								tbody += "<option value="
										+ result.roleList[j].roleId + ">"
										+ result.roleList[j].name + "</option>";
							}
						}
						tbody += "</select></td><td><a href='' onclick='save("
								+ result.accountAreaEmployeeRoleViewList[i].employeeId
								+ ");'>保存</a></td></tr>";
					}
					// alert(tbody);
					paging = "<a onclick='turnPage(" + treeNode.areaId
							+ ",0)'> 首页 </a>";
					if (result.nowPage > 0) {
						alert("result.nowPage=" + result.nowPage);
						paging += "<a onclick='turnPage(" + treeNode.areaId
								+ "," + (result.nowPage - 1)
								+ ")'>&lt;&lt;上一页 </a>";
					}

					if (result.pageNumber <= 0) {
						paging += (result.nowPage) + "/" + result.pageNumber;
					} else
						paging += (result.nowPage + 1) + "/"
								+ result.pageNumber;
					if (result.nowPage < result.pageNumber - 1) {
						paging += "<a onclick='turnPage(" + treeNode.areaId
								+ "," + (result.nowPage + 1)
								+ ")'>下一页&gt;&gt; </a>";
					}
					paging += "<a onclick='turnPage(" + treeNode.areaId + ","
							+ (result.pageNumber - 1) + ")'>尾页 </a>";
					document.getElementById("tbody").innerHTML = tbody;// 表格具体内容
					document.getElementById("paging").innerHTML = paging;// 翻页按钮
				}
			});
}

function zTreeOnAsyncSuccess() {

	// alert('加载树成功');
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	// 设置展开根节点,默认不展开
	// treeObj.expandAll(true);

}

function showPanel(stitle, urlpath) {

	// alert(urlpath); 子节点请求路径
	if ($('#ttab').tabs('exists', stitle)) {
		$('#ttab').tabs('select', stitle);
	} else {
		$('#ttab')
				.tabs(
						'add',
						{
							title : stitle,
							content : '<iframe src='
									+ urlpath
									+ ' scrolling=no frameborder=0 height=100% width=100% marginheight=0 marginwidth=0/>',
							closable : true
						});
	}

}

// 树节点的点击事件
function zTreeBeforeClick(treeId, treeNode, clickFlag) {

	// alert("treeNode.id--->"+treeNode.id);
	// alert("treeNode.url--->"+treeNode.url);
	// alert("treeNode.name--->"+treeNode.title);
	if (treeNode.url !== '') {// 不新建标签页面显示,让页面显示在中心区域
		showPanel(treeNode.title, treeNode.url);
	}

	return (treeNode.id !== 1);
};
/** **************************************************************** */
function changInputType(str) {
	// alert(str);
	document.getElementById(str).type = "date";
}
