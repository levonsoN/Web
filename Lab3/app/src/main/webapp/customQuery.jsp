<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Execute Custom Query</title>
    <style>
        table, th, td {
            border: 1px solid;
            max-width: 100%;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<h1>Execute Custom Query</h1>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.app.*" %>
<div style="display: inline-block; max-height: 500px; overflow-y: scroll; margin-bottom: 10px;"><%
    String sql = request.getParameter("query");
    if (sql != null) {
        String output = "";
        try {
            Connection connection = DbHandler.getConnection();
            Statement statement = connection.createStatement();
            if (!statement.execute(sql))
                output += "Query executed. " + statement.getUpdateCount() + " row's affected.";
            else {
                ResultSet result = statement.getResultSet();
                ResultSetMetaData metaData = result.getMetaData();
                int columnsCount = metaData.getColumnCount();
                output += "<table>";
                output += "<tr>";
                for (int i = 0; i < columnsCount; i++)
                    output += "<th>" + metaData.getColumnLabel(i + 1) + "</th>";
                output += "</tr>";
                while (result.next()) {
                    output += "<tr>";
                    for (int i = 0; i < columnsCount; i++)
                        output += "<td>" + result.getObject(i + 1).toString() + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
            }
            out.println(output);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
%></div>

<form method="POST">
    <label for="queryTextarea">Query: </label>
    <textarea id="queryTextarea" name="query" style="width: 500px; height: 100px; resize:none"></textarea>
    <br>
    <button type="submit" style="margin: 10px;">Execute</button>
</form>
<%@include file="allPages.html" %>
</body>
</html>
