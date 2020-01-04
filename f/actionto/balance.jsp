<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = request.getParameter("previousPage");
	%>
<head>
    <title>結帳</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- css folder -->
    <link rel="stylesheet" type="text/css" href="../css/swal.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap">
</head>


<body>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!-- SweetAlert2.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
        type="text/javascript"></script>

    <%
                int count = Integer.parseInt(request.getParameter("count"));
                sql = "SELECT * FROM cart WHERE memberID = '" + session.getAttribute("member") + "'";
                rs = smt.executeQuery(sql);

                String courseID = "";
                int residual = 0;
                int setnumber = 0;
                Date submitTime = new Date();
                SimpleDateFormat dateft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");

                while (rs.next()) {
                    courseID = rs.getString("courseID");
                    residual = Integer.parseInt(rs.getString("residual"));
                    setnumber = Integer.parseInt(rs.getString("setnumber"));

                    sql = "UPDATE course SET residual = '" + (residual - setnumber) + "' WHERE idcourse = '" + courseID + "'";
                    con.createStatement().executeUpdate(sql);

                    sql = "INSERT INTO orderlist(memberID, courseID, amount, submitTime, count) VALUES('" + session.getAttribute("member") + "', '" + courseID + "', '" + setnumber + "', '" + (dateft.format(submitTime)).toString() + "', '" + count + "')";
                    con.createStatement().executeUpdate(sql);
                }

                sql = "DELETE FROM cart WHERE memberID = '" + session.getAttribute("member") + "'";
                con.createStatement().executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "購買成功",
            html: "<a href='../member.jsp'><input type='button' class='swal-btn btn btn-success' value='感恩客人大恩大德~'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
</body>
    <%

                con.close();
            }

            catch (SQLException sExec) {
                out.println("SQL錯誤!" + sExec.toString());
            }
        }

        catch (ClassNotFoundException err) {
            out.println("class錯誤" + err.toString());
        }
    %>
</html>
