<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");

        try {
            String url = "jdbc:mysql://localhost/?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url,"root","1234");
            Statement smt = con.createStatement();

            String sql = "USE final";
            smt.execute(sql);

            request.setCharacterEncoding("UTF-8");
            ResultSet rs = null;

            String previousPage = "";
%>
