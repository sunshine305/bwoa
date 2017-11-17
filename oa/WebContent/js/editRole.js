/**
 * @作者 王培源
 * @描述 editRole.jsp的js
 * @创建时间 2017/11/3
 */
//修改状态为有效
		function update(dId,name,status) {
			window.location.href="update.do?departmentId="+dId+"&name="+name+"&status="+status;
		}
		//查询
		function query() {
			
			var name = document.getElementById('queryName').value;
			//alert("query:"+name);
			window.location.href="queryRoleByName.do?name="+name;
		}
		//编辑
		function edit(dId,name) {		
			//alert(dId+","+name);
			var editTb="<input type='hidden' id='"+dId+"dNameHidden' value='"+name+"'/>"+
			"<input type='text' id='dName' style='height:23px' value='"+name+"'/>"+
			"&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:updateName("+dId+");' >修改</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
			"<a href='javascript:reset("+dId+");' >撤销</a>";
			document.getElementById(dId).innerHTML=editTb;
			//alert(editTb)
		}
		//修改角色名
		function updateName(dId) {
			var name= document.getElementById('dName').value;
			window.location.href="updateRoleName.do?roleId="+dId+"&name="+name;
		}
		//撤销
		function reset(dId) {
			//alert("reset");
			var name = document.getElementById(dId+'dNameHidden').value;
			document.getElementById(dId).innerHTML=name;
		}
		//删除
		function delet(dId) {
			//alert(dId);
			window.location.href="deleteRole.do?roleId="+dId;
		}