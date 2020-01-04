<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = request.getParameter("previousPage");
	%>
<head>
    <title>登入</title>
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


    <%
                String id = request.getParameter("id");
                String pwd = request.getParameter("pwd");

                //空值判斷
                if ((id != null && !id.equals("")) && (pwd != null && !pwd.equals(""))) {

                    sql = "SELECT * FROM member WHERE idmember = 1 AND id = '" + id + "' AND pwd = '" + pwd + "'";
                    rs = smt.executeQuery(sql);

                    if (rs.next()) {
                        session.setAttribute("member", id);
                        session.setAttribute("admin", id);
    %>
    <script>
        swal ({
            title: "還敢下來R管理員!",
            html: "<h4 class='swal-text'></h4><a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='南無阿彌陀佛'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                    }
                    else {

                        sql = "SELECT * FROM member WHERE id = '" + id + "' AND pwd = '" + pwd + "'";
                        rs = smt.executeQuery(sql);

                    //登入成功
                        if (rs.next()) {
                            session.setAttribute("member", id);
    %>
    <script>
        swal ({
            title: "登入成功",
            html: "<h4 class='swal-text'>歡迎回到Ivre!</h4><a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='又要去BUY家囉~'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%

                        }
                    //登入失敗
                        else {
                            sql = "SELECT * FROM member WHERE id = '" + id + "' AND pwd != '" + pwd + "'";
                            rs = smt.executeQuery(sql);

                            if (rs.next()) {
    %>
    <script>
        swal ({
            title: "密碼錯誤!",
            html: "<input type='button' class='swal-btn btn btn-warning' onclick='javascript:history.back();' value='哪尼!!!!!'></input>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                            }
                            else {
    %>
    <script>
        swal ({
            title: "找不到您的帳戶!",
            html: "<input type='button' class='swal-btn btn btn-danger' onclick='javascript:history.back();' value='ㄚㄚㄚ我個金魚腦'></input>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                            }
                        }
                    }
                }
                else {
    %>
    <script>
        swal ({
            title: "資料填選不完全!",
            html: "<input type='button' class='swal-btn btn btn-danger' onclick='javascript:history.back();' value='好嘛...再一次機會'></input>",
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
