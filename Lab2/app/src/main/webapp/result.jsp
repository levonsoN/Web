<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Values Table</h1>
<p style="display: block; width: 300px; height: 500px; padding: 10px; overflow-y: scroll">
    <%@ page import="com.lab2.app.*" %>
    <%
        ValueFilter filter = new ValueFilter();
        double a = Double.parseDouble(request.getParameter("a_param"));
        double b = Double.parseDouble(request.getParameter("b_param"));
        double h = Double.parseDouble(request.getParameter("h_param"));
        Tabulator tabulator = new Tabulator(new LabFunction(1.5));
        Value[] values = tabulator.tabulate(a, b, h);
        for (int i = 0; i < values.length; i++) {
            Value value = values[i];
            out.println((i + 1) + ". X = " + Math.round(value.getX() * 10000) / 10000. + "; Y = " + Math.round(value.getY() * 10000) / 10000. + ";");
            out.println("<br>");
        }
    %>
</p>
<p>
    <%
        int minIndex = filter.findExtrema(values, true);
        int maxIndex = filter.findExtrema(values, false);
    %>
    Min Value: <%=  Math.round(values[minIndex].getY() * 10000) / 10000.%> [Index: <%=minIndex%>]
    <br>
    Max Value: <%= Math.round(values[maxIndex].getY() * 10000) / 10000.%> [Index: <%=maxIndex%>]
    <br>
    Sum: <%= Math.round(filter.sumValues(values) * 10000) / 10000.%>
    <br>
    Avg: <%= Math.round(filter.avgValues(values) * 10000) / 10000.%>
</p>
<a href="main.html">Back to the Main Page</a>
</body>
</html>
