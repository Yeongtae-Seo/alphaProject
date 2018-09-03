<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
	<style>
	#lay_pop{position:absolute;z-index:500;width:1000px;height:700px;display:none;background-color:#ffffff;border:2px solid #cccccc}
	#all_body{position:absolute;z-index:9;display:block;filter:alpha(opacity=50);opacity:0.5;-moz-opacity:0.5;background-color:#000000;left:0;top:0}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script language="javascript">
	function pushLayer(){
		var $width=parseInt($("#lay_pop").css("width"));
		var $height=parseInt($("#lay_pop").css("height"));
		var left=($(window).width()-$width)/2;
		var sctop=$(window).scrollTop()*2;
		var top=($(window).height()-$height+sctop)/2;
		var height=document.getElementsByTagName("body")[0].scrollHeight;
		$("#lay_pop").css("left",left);
		$("#lay_pop").css("top",top);
		$("#lay_pop").css("display","block");
		$("#lay_pop").css("z-index","555");
		$("#all_body").css("display","block");
		$("#all_body").css("width",$(window).width());
		$("#all_body").css("height",height);

	}
	function layerClose(lay1,lay2){
		$("#"+lay1).css("display","none");
		$("#"+lay2).css("display","none");
	}
</script>
</head>
<body>
		<div id="all_body">	
		</div>
		
		<div id="lay_pop" style="background-color:black;">
			<div align="right">
				<a href="javascript:;" onclick="layerClose('lay_pop','all_body')"><img src="/img/x.jpg" style="height:25px; width:25px;"/></a>
			</div>
			<br/>
			<iframe style="width:100%; height:80%;"src="https://www.youtube.com/embed/o90sXZ1Z7dc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			
		</div>
		<div id="all_body"></div>
<input type="button" value="레이어" onclick="pushLayer()">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>