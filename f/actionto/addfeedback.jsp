<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat, java.text.DecimalFormat"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <title>留言提交</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

    <%!
        String newline (String str) {
            int index = 0;

            while ((index = str.indexOf("\n")) != -1) {
                str = str.substring(0, index) + "<br>" + str.substring(index + 1);
            }
            return (str);
        }
    %>


    <%
                String courseID = request.getParameter("page");
                Date submitTime = new Date();
                SimpleDateFormat dateft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
                String author = String.valueOf(session.getAttribute("member"));
                String rate = request.getParameter("star");
                String feedback = request.getParameter("memo");

                sql = "INSERT INTO board(courseID, author, rate, submitTime, feedback) VALUES('" + courseID + "', '" + author + "', '" + rate + "', '" + (dateft.format(submitTime)).toString() + "', '" + newline(feedback) +  "')";
                smt.execute(sql);

                int sum_rate = 0;
                double feedback_num = 0.0;
                double avg_rate = 0.0;

                sql = "SELECT rate FROM board WHERE courseID = '" + courseID + "'";
                rs = smt.executeQuery(sql);

                while (rs.next()) {
                    sum_rate += Integer.parseInt(rs.getString(1));
                    feedback_num += 1.0;
                }

                avg_rate = sum_rate / feedback_num;

                DecimalFormat decimalft = new DecimalFormat("#0.0");

                sql = "UPDATE course SET avg_rate = '" + decimalft.format(avg_rate).toString() + "' WHERE idcourse = '" + courseID + "'";
                int updaters = smt.executeUpdate(sql);

                //sql = "SELECT * FROM board";
                //rs = smt.executeQuery(sql);

                if (updaters == 1) {

    %>
    <script>
        swal ({
            title: "提交成功",
            html: "<a href='../product.jsp?page=<%=courseID%>'><input type='button' class='swal-btn btn btn-success' value='留言成功囉'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                }
    %>
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
