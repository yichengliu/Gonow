<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" import="db.DBInterface, models.Entertainment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="http://api.map.baidu.com/api?v=1.5&ak=D9afd1763d4820178898956607a1269e" type="text/javascript"></script>
<style type="text/css">  
    html{height:100%}
    body{height:100%;margin:0px;padding:0px}
    #container{height:100%}
</style> 
<%
    String id = request.getParameter("id");
    Entertainment e = DBInterface.getInstance().getEntertainmentById(id);
%>
<title><%=id%> 的结果</title>
</head>
<body>
<div style="width:300px;height:300px;">
<div id="container"></div>
<script type="text/javascript">
    var map = new BMap.Map("container");
    var geocoder = new BMap.Geocoder();
    geocoder.getPoint("<%=e.name%>", function(point){
        if (point) {
            map.centerAndZoom(point, 15);
            map.addOverlay(new BMap.Marker(point));
        }
    }, "北京市");
</script>
</div>
</body>
</html>