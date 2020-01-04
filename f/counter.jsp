<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<%
    sql = "SELECT * FROM counter";
    rs = smt.executeQuery(sql);

    while (rs.next()) {
        String countS = rs.getString("count");
        int count = Integer.parseInt(countS);

        if (session.isNew()) {
            count++;
        }
        out.print("您是第" + count + "位訪客");
        sql = "UPDATE counter SET count = '" + count + "'";
    }

    smt.executeUpdate(sql);
%>
