<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Data</h1><br/>

        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/csedept"
                           user = "root"  password = "root"/>

        <c:set var = "Id" value = "${param.id}"/>

        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * FROM persons WHERE id = ?;
            <sql:param value="${param.id}"/>
        </sql:query>

        <form action = "edit.jsp" action="post">
            <c:forEach var = "row" items = "${result.rows}">
                <input type="hidden" name="id" value="${row.id}">
                
                <table border = "1" width = "100%">
                    <tr>
                        <td>Username</td><td><input type="text" placeholder="Enter Username" name="uname" value="${row.userName}"></td>
                    </tr>
                    <tr>
                        <td>Password</td><td><input type="password" placeholder="Enter Password" name="pwd" value="${row.password}"></td>
                    </tr>
                    <tr>
                        <td>Age</td><td><input type="number" placeholder="Enter Age" name="age" value="${row.age}"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="submit">Save</button></td>
                    </tr>
                </table>
            </c:forEach>
        </form>
    </body>
</html>
