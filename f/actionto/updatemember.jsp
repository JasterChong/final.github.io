<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <title>Pâtisserie de Rêve｜會員資料修改</title>
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
				if (session.getAttribute("member") == null) {
					response.sendRedirect("index.jsp");
				}

                String newid = request.getParameter("id");
				String newemail = request.getParameter("email");
				String oldpwd = request.getParameter("oldpwd");
				String newpwd = request.getParameter("newpwd");
				String repeatpwd = request.getParameter("repeatpwd");

                if ((newid != null && !newid.equals("")) && (newemail != null && !newemail.equals("")) && (oldpwd != null && !oldpwd.equals("")) && (newpwd != null && !newpwd.equals("")) && (repeatpwd != null && !repeatpwd.equals(""))) {

					sql = "SELECT * FROM  member WHERE id = '" + session.getAttribute("member") + "'";
					rs = smt.executeQuery(sql);

					String pwd = "";

					if (rs.next()) {
						pwd = rs.getString("pwd");
					}

					if (!pwd.equals(oldpwd)) {
	%>
    <script>
        swal ({
            title: "舊密碼不符合",
            html: "<input type='button' class='swal-btn btn btn-danger' onclick='javascript:history.back();' value='舊密碼不對喔!'></input>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
	<%
					}
					else {

						if (!newpwd.equals(repeatpwd)) {
	%>
    <script>
        swal ({
            title: "新密碼與確認密碼不相符",
            html: "<input type='button' class='swal-btn btn btn-warning' onclick='javascript:history.back();' value='密碼是人生大事!'></input>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
	<%
						}
						else {

							sql = "SELECT * FROM  member WHERE id = '" + session.getAttribute("member") + "'";
							rs = smt.executeQuery(sql);

							String id = "";
							String email = "";

							if (rs.next()) {

								id = rs.getString("id");
								email = rs.getString("email");

								sql = "UPDATE member SET id = '" + newid + "' WHERE id = '" + id + "'";
								smt.executeUpdate(sql);

								sql = "UPDATE member SET pwd = '" + newpwd + "' WHERE pwd = '" + pwd + "'";
								smt.executeUpdate(sql);

								sql = "UPDATE member SET email = '" + newemail + "' WHERE email = '" + email + "'";
								int updaters = smt.executeUpdate(sql);

								if (updaters == 1) {
									session.setAttribute("member", newid);

	%>
	<script>
        swal ({
            title: "修改成功",
            html: "<a href='../member.jsp'><input type='button' class='swal-btn btn btn-success' value='要記好囉'></input></a>",
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
				}
				else {
    %>
    <script>
        swal ({
            title: "資料填選不完全!",
            html: "<input type='button' class='swal-btn btn btn-danger' onclick='javascript:history.back();' value='唉呦我這金魚腦'></input>",
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
