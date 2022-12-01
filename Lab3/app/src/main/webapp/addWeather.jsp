<%@ page import="com.example.app.DbHandler" %>
<%@ page import="com.example.app.Region" %>
<%@ page import="java.time.LocalDate" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Weather Data</title>
</head>
<body>
<% Region[] regions = DbHandler.getRegions();%>
<h1>Add Weather Data</h1>
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
    <label for="temperatureInput">Temperature:</label>
    <input id="temperatureInput" name="temperature" type="number" value="0" step="0.01" min="-40" max="40">
    <br>
    <label for="precipitationPicker">Precipitation:</label>
    <select id="precipitationPicker" name="precipitation">
        <option value="none">none</option>
        <option value="rain">rain</option>
        <option value="snow">snow</option>
        <option value="sleet">sleet</option>
        <option value="hail">hail</option>
    </select>
    <br>
    <button name="submit" type="submit" style="margin: 10px;">Add Weather Data</button>
</form>
<p>
    <%
        if (request.getParameter("submit") != null) {
            try {


                int regionIndex = Integer.parseInt(request.getParameter("region"));
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                double temperature = Double.parseDouble(request.getParameter("temperature"));
                String precipitation = request.getParameter("precipitation");
                int rowsAffected = DbHandler.addWeatherData(regions[regionIndex], date, temperature, precipitation);
                if (rowsAffected > 0)
                    out.println("Weather data has been added successfully.");
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    %>
</p>
<%@include file="allPages.html" %>
</body>
</html>
