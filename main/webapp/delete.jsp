
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete Data</h1><br/>

        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/csedept"
                           user = "root"  password = "root"/>

        <sql:update dataSource = "${snapshot}" var = "count">
            DELETE FROM persons WHERE id = ?;
            <sql:param value="${param.id}"/>
        </sql:update>


        <%
            Object countObj = pageContext.getAttribute("count");

            int updatedRows = 0;

            if (countObj != null) {

                updatedRows = ((Number) countObj).intValue();

            }

            if (updatedRows == 1) {

                RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
                rd.forward(request, response);
            }
        %>
    </body>
</html>
