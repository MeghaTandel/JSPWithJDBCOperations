<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <head>
        <title>SELECT Operation</title>
    </head>

    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/csedept"
                           user = "root"  password = "root"/>

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * FROM persons;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th colspan="2">Action</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.userName}"/></td>
                    <td><c:out value = "${row.password}"/></td>
                    <td><c:out value = "${row.age}"/></td>

                    <td><a href = "editScreen.jsp?id=${row.id}" >Edit</td>
                    <td><a href= "delete.jsp?id=${row.id}" onclick="return confirm('Are you sure?')">Delete</a></td>
                    
                </tr>
            </c:forEach>
        </table>

    </body>
</html>