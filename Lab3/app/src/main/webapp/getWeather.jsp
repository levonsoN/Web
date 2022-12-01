<%@ page import="com.example.app.*" %>
<%@ page import="java.time.LocalDate" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Get Weather Data</title>
    <style>
        table, th, td {
            border: 1px solid;
            max-width: 100%;
            white-space: nowrap;
        }
    </style>
</head>
<body>

<% Region[] regions = DbHandler.getRegions();%>
<h1>Get Weather Data</h1>
<div style="display: inline-block; max-height: 500px; overflow-y: scroll; margin-bottom: 10px;">
    <%

        if (request.getParameter("submit") != null) {
            try {
                int regionIndex = Integer.parseInt(request.getParameter("region"));
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                WeatherData data = DbHandler.getWeatherData(regions[regionIndex], date);
    %>
    <table>
        <tr>
            <th>Region Name</th>
            <th>Date</th>
            <th>Temperature</th>
            <th>Precipitation</th>
        </tr>
        <tr>
            <td><%=data.getRegion().getName()%></td>
            <td><%=data.getDate()%></td>
            <td><%=data.getTemperature()%></td>
            <td><%=data.getPrecipitation()%></td>
        </tr>
    </table>
    <%
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    %>
</div>

<form method="POST">
    <label for="datePicker">Date: </label>
    <input type="date" id="datePicker" name="date" value="2022-01-01" required>
    <br>
    <label for="regionPicker">Region: </label>
    <select id="regionPicker" name="region">
        <%
            for (int i = 0; i < regions.length; i++) {
        %>
        <option value="<%=i%>"><%=regions[i].getName()%>
        </option>
        <%}%>
    </select>
    <br>
    <button name="submit" type="submit" style="margin: 10px;">Get Weather Data</button>
</form>
<%@include file="allPages.html" %>
</body>
</html>
