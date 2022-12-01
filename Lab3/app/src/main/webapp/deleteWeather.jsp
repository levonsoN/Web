<%@ page import="com.example.app.Region" %>
<%@ page import="com.example.app.DbHandler" %>
<%@ page import="java.time.LocalDate" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Weather Data</title>
</head>
<body>
<% Region[] regions = DbHandler.getRegions();%>
<h1>Delete Weather Data</h1>
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
    <button name="submit" type="submit" style="margin: 10px;">Delete Weather Data</button>
</form>
<p>
    <%

        if (request.getParameter("submit") != null) {
            try {
                int regionIndex = Integer.parseInt(request.getParameter("region"));
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                int rowsAffected = DbHandler.deleteWeatherData(regions[regionIndex], date);
                if (rowsAffected > 0)
                    out.println("Weather data has been deleted successfully");
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    %>
</p>
<%@include file="allPages.html" %>
</body>
</html>
