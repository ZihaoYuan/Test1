<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var now=new Date();
var hour=now.getHours();
if(hour>=0&&hour<=3){
     document.write("午夜好");
}
if(hour>=3&&hour<=6){
     document.write("早上好");
}
if(hour>=6&&hour<=11){
     document.write("上午好");
}
if(hour>=11&&hour<=13){
     document.write("中午好");
}
if(hour>=13&&hour<=18){
     document.write("下午好");
}
if(hour>=18&&hour<=24){
     document.write("晚上好");
}
document.write("<p>今天日期："+now.getYear()+"年"+now.getMonth()+"月"+now.getDate()+"日");
document.write("<p>现在时间："+now.getHours()+"点"+now.getMinutes()+"分"+now.getSeconds()+"秒");
</script>
</head>
<body>

</body>
</html>