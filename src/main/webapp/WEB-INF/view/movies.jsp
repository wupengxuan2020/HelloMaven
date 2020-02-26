<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<LINK href="resources/css/css.css" type="text/css" rel="stylesheet">
<script src="resources/js/jquery-1.8.2.min.js"></script>
  <script src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	
	function quan(own) {
		$("[name=check]").prop("checked",own.checked);
	}
	function delall() {
		var size=$("[name=check]:checked").size();
		if(size>1){
			
		 	/* var ids = $("[name=check]:checked").map(function(){
				return this.value;
			}).get().join();  */
		 	var ids=new Array();
			$("[name=check]:checked").each(function(i){
			
				ids[i] =$(this).val()
			}) 
		/* 	var ids="";
			$("[name=check]:checked").each(function(){
				ids+=","+this.value;
			})
			ids=ids.substring(1); */
			
			/* var ids new Array();
			$("[name=check]:checked").each(function(i){
				ids[i]=$(this).val();
			}) */
			alert(ids)
			$.post("/delete",{ids:ids},function(data){
				if(data)//data就是后台返回的数据
			     {
				alert("删除成功");
				location="selects"
				}
			    else alert("删除失败")
			    });
			
		}else{
			if(size==0){
				alert("请选择要删除的记录");
			}else{
				alert("批量删除至少选择两条数据");
			}
			
		}
		
	}
	function px(orderName) {
		
		var orderM= '${movieOV.orderM}';
		 orderM= orderM=='desc'?'asc':'desc';
		alert(orderM);
		location.href="/selects?orderName="+orderName+"&orderM="+orderM;
	
	}
		
		
	
	function fenye(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	
</script>
<style type="text/css">
	.pp{
		cursor:pointer;
	}
</style>
</head>
<body>
<form action="selects" method="post">
<input type="hidden" name="pageNum">
	影片名称:<input type="text" name="name" value="${movieOV.name }"> 上映时间:<input type="text" name="t1" onclick="WdatePicker()" value="${movieOV.t1 }">至 <input type="text" name="t2" onclick="WdatePicker()" value="${movieOV.t2 }"><br>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;导演    :<input type="text" name="actor" value="${movieOV.actor }"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格    :<input type="text" name="p1" value="${movieOV.p1 }"> - <input type="text" name="p2" value="${movieOV.p2 }"><br>
	电影时代:<input type="text" name="years" value="${movieOV.years }"> 电影时长:<input type="text" name="l1" value="${movieOV.l1 }"> - <input type="text" name="l2" value="${movieOV.l2 }"><br>
	<input type="submit" value="查询">
	<input type="reset" value="重置查询">
 	<input type="button" value="删除影片" onclick="delall()"> 
 	<input type="button" value="添加影片" onclick="add()"> 
</form>

	<table>
		<tr>
			<td>
				<input type="checkbox" onclick="quan(this)">
			</td>
			<td>序号</td>
			<td>电影名称</td>
			<td>导演</td>
			<td><a onclick="px('price')" class="pp">价钱</a></td>
			<td>上映时间</td>
			<td><a onclick="px('longtime')" class="pp">电影时长</a></td>
			<td>类型</td>
			<td><a onclick="px('years')" class="pp">年代</a></td>
			<td>区域</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${movies }" var="m" varStatus="count">
			<tr>
				<td>
					<input type="checkbox" name="check" value="${m.id }" >
				</td>
				<td>${count.count+page.startRow-1}</td>
				<td>${m.name }</td>
				<td>${m.actor }</td>
				<td>${m.price }</td>
				<td>${m.uptime }</td>
				<td>${m.longtime }</td>
				<td>${m.type }</td>
				<td>${m.years }</td>
				<td>${m.area }</td>
				<td>${m.status }</td>
				<td>
					
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="100">
					<button onclick="fenye(1)">首页</button>
					<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
					<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
					<button onclick="fenye(${page.pages})">尾页</button>
					第${page.pageNum }/${page.pages }页,共${page.total }条
			</td>
		</tr>
	</table>
</body>
</html>