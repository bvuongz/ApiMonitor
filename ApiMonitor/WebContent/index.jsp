<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bvworks.apimonitor.action.CallAction" %>

<%
CallAction action = new CallAction();
String[] names = action.getCallNames();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API Monitor</title>
<script src="jquery-1.11.2.min.js"></script>
<script src="Chart.min.js"></script>
</head>
<body>
<h1>API Monitor</h1>
<%
if (names.length > 0) {
	out.println("<select id=\"apinames\">");
	for (String name : names) {
	    out.println(String.format("<option value=\"%s\">%s</option>", name,name));
	}
	out.println("</select>");
}
%>
<br/>
<canvas id="myChart" width="400" height="400"></canvas>
<script>

var label = [];
var data = [];
var data = {
        labels : label,
        datasets : [ {
            label : "Times Accessed",
            fillColor : "rgba(220,220,220,0.2)",
            strokeColor : "rgba(220,220,220,1)",
            pointColor : "rgba(220,220,220,1)",
            pointStrokeColor : "#fff",
            pointHighlightFill : "#fff",
            pointHighlightStroke : "rgba(220,220,220,1)",
            data : data
        } ]
    };

    var options = {

        ///Boolean - Whether grid lines are shown across the chart
        scaleShowGridLines : true,

        //String - Colour of the grid lines
        scaleGridLineColor : "rgba(0,0,0,.05)",

        //Number - Width of the grid lines
        scaleGridLineWidth : 1,

        //Boolean - Whether to show horizontal lines (except X axis)
        scaleShowHorizontalLines : true,

        //Boolean - Whether to show vertical lines (except Y axis)
        scaleShowVerticalLines : true,

        //Boolean - Whether the line is curved between points
        bezierCurve : true,

        //Number - Tension of the bezier curve between points
        bezierCurveTension : 0.4,

        //Boolean - Whether to show a dot for each point
        pointDot : true,

        //Number - Radius of each point dot in pixels
        pointDotRadius : 4,

        //Number - Pixel width of point dot stroke
        pointDotStrokeWidth : 1,

        //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
        pointHitDetectionRadius : 20,

        //Boolean - Whether to show a stroke for datasets
        datasetStroke : true,

        //Number - Pixel width of dataset stroke
        datasetStrokeWidth : 2,

        //Boolean - Whether to fill the dataset with a colour
        datasetFill : true,

        //String - A legend template

    };

    var ctx = document.getElementById("myChart")
            .getContext("2d");
    var myLineChart = new Chart(ctx).Line(data, options);

</script>
</body>
</html>