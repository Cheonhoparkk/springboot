<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="../../../js/jquery.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="../../../js/trirand/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="../../../js/trirand/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="../../../css/trirand/ui.jqgrid-bootstrap.css" />

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>
<body>
<div style="margin-left:20px">
	<table id="jqGrid"></table>
	<div id="gqGridPager"></div>
</div>
<script>
$(document).ready(function(){
	const config = {
			url:'/yes24s',
			mtype:'GET',
			styleUI:'Bootstrap',
			datatype:'jsonp',
			pager:'#gqGridPager',
			colModel : [
				{label:'순위',name:'ysNum', key:true, width:60},
				{label:'제목',name:'ysTitle', width:200},
				{label:'저자', name:'ysAuter', width:200},
				{label:'출판사', name:'ysPublishing', width:200},
				{label:'가격', name:'ysPrice', width:200},
			],
			jsonReader:{
				root:'list',
				page:'pageNum',
				total:'pages'
			},
			height:300,
			rowNum:10,
	}
	$('#jqGrid').jqGrid(config);
})
</script>
</body>
</html>