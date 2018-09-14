<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<table id="dg"></table> 
<script type="text/javascript">
function pageLoad(){
	$('#dg').datagrid({  
		title:'菜单配置信息',
	    url:'<%=basePath%>login/getAllNavs', 
	    columns:[[
			{field:'ck',checkbox:true},
	        {field:'id',title:'主键',width:100,align:'center'},    
	        {field:'text',title:'标题',width:100,align:'center',formatter:function(value,row,index){
	        	if(row.pid==0){
	        		return "<span style='color:red'>"+value+"</span>";
	        	}else{
	        		return value;
	        	}
	        }},    
	        {field:'iconCls',title:'节点图标',width:100,align:'center'} ,
	        {field:'state',title:'节点状态',width:100,align:'center',formatter:function(value,row,index){
	        	if(value=="open"){
	        		return "展开";
	        	}else{
	        		return "关闭";
	        	}
	        }},    
	        {field:'pid',title:'上级节点',width:100,align:'center'},    
	        {field:'href',title:'菜单地址',width:150,align:'center',formatter:function(value,row,index){
	        	if(value=='noUrl'){
	        		return "无链接";
	        	}else{
	        		return value;
	        	}
	        }}  ]],
	    pagination:true,
	    /* singleSelect:true, */
	    fit:true,
	    toolbar: [{
			iconCls: 'icon-add',
			text:"添加",
			handler: function(){
				$('#add').window({    
					title:'添加菜单',
					width:600,    
				    height:400,    
				    collapsible:false,
				    draggable:false,
				    minimizable:false,
				    resizable:false
				});
				$('#add').form('load',{
					id:"",
					text:"",
					href:"",
					iconCls:"",
					pid:"",
					state:""
				});
			}
		},'-',{
			iconCls: 'icon-edit',
			text:'修改',
			handler: function(){
				var rows =$("#dg").datagrid('getSelections');
				if(rows.length>1||rows.length<=0){
					$.messager.alert("提示","请选择一条数据进行修改！");
				}else{
					$('#add').window({    
						title:'修改菜单',
						width:600,    
					    height:400,    
					    collapsible:false,
					    draggable:false,
					    minimizable:false,
					    resizable:false
					});
					$('#add').form('load',{
						id:rows[0].id,
						text:rows[0].text,
						href:rows[0].href,
						iconCls:rows[0].iconCls,
						pid:rows[0].pid,
						state:rows[0].state
					});


				}
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				var rows =$("#dg").datagrid('getSelections');
				debugger;
				if(rows.length<=0){
					$.messager.alert("提示","请至少选择一条数据进行删除！");
				}else{
					var ids = [];
			        for (var i = 0; i < rows.length; i++) {
			            var id = rows[i].id;
			            ids.push(id); //把单个id循环放到ids的数组中  
			        }
					 $.ajax({
				   		   type:'post',
				   			data:{ids : ids.join(',')},
				   		   url:'login/deleteNavs',
				   		   dataType:'json',
				   		   
				   		   success:function(successData){
				   			  	//alert(successData);
				   				$.messager.alert("提示","成功删除"+successData+"条数据"); 
				   				$("#dg").datagrid('reload');
				   		   },
				   		   error:function(errorData) {
				   			   debugger;
				   				$.messager.alert("提示","删除失败！"+errorData);	
						   }
				   	   });
				}
			}
		}]
	});
}

$('#pid').combobox({    
    url:'<%=basePath%>login/getNavsForCombox',    
    valueField:'id',    
    textField:'text'   
}); 
$(function(){ 
	pageLoad();
	/*
	保存
	*/
    $('#save').bind('click', function(){  
    	debugger;
    	var data1 =$('#form1').serialize();
   	   $.ajax({
   		   type:'post',
   		   url:'login/saveNavs',
   		   dataType:'json',
   		   data:data1,
   		   success:function(data2){
   				$.messager.alert("提示","保存成功");  
   		   },
   		   error:function(data3) {
   				$.messager.alert("提示","保存失败！");	
		   }
   	   });
    });
    /*
    	返回并重新查询
    */
    $("#cancle").bind('click',function(){
		$("#add").window('close');
		pageLoad();
	});
});  


</script>
<div id="add">
	<center style="padding-top: 30px">
		<form id="form1" action="" method="post">
		<input type="hidden" id="id" name="id"/>
		<p>菜单标题：<input type="text" id="text" name="text"/></p>
		<p>菜单地址：<input type="text" id="href" name="href"/></p>
		<p>菜单图标：<input type="text" id="iconCls" name="iconCls"/></p>
		<p>上级节点：<input id="pid" name="pid" value="无"/></p>
		<!-- <p>节点状态开关：<input id="state" class="easyui-switchbutton" ></p> -->
		<p>节点状态开关：<select id="state" name="state">
							<option value="closed">关闭</option>
							<option value="open">展开</option>
						</select>
		<p>
			<a class="easyui-linkbutton" id="save" data-options="iconCls:'icon-save'">保存</a>
			&nbsp
			<a class="easyui-linkbutton" id="cancle" data-options="iconCls:'icon-cancel'">返回</a>
		</p>
	</form>
	</center>
</div>  
</body>
</html>