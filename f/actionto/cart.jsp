<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = request.getParameter("previousPage");
	%>
<head>
    <title>購物車</title>
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
                String memberID = (String)session.getAttribute("member");

                String op = request.getParameter("op");

                if (op.equals("add")) {

                    int setnumber = Integer.parseInt(request.getParameter("setnumber"));
                    int residual = Integer.parseInt(request.getParameter("residual"));

                    if (setnumber > residual) {
    %>
    <script>
        swal ({
            title: "商品庫存不足",
            html: "<input type='button' class='swal-btn btn btn-warning' onclick='javascript:history.back();' value='別走啊!馬上生貨給你!'></input>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                    }

                    else {

                        String idcourse = request.getParameter("idcourse");

                        sql = "SELECT * FROM course WHERE idcourse = '" + idcourse + "'";
                        rs = smt.executeQuery(sql);

                        residual = 0;
                        String name = "";
                        String img_path = "";
                        String time = "";
                        int price = 0;

                        if (rs.next()) {
                            residual = Integer.parseInt(rs.getString("residual"));
                            name = rs.getString("name");
                            img_path = rs.getString("file_path") + "/" + rs.getString("img_file");
                            time = rs.getString("time");
                            price = Integer.parseInt(rs.getString("price"));
                        }

                        sql = "INSERT INTO cart(memberID, courseID, residual, name, img_path, time, price, setnumber, subtotal) VALUES";
                        sql += "('" + memberID + "', '" + idcourse + "', '" + residual + "', '" + name + "', '" + img_path + "', '" + time + "', '" + price + "', '" + setnumber + "', '" + price * setnumber + "')";
                        smt.execute(sql);
    %>
    <script>
        swal ({
            title: "成功加入購物車",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='快快快繼續選別手軟了!'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%

                    }
                }

                if (op.equals("del")) {

                    String idcart =request.getParameter("idcart");
                    sql = "DELETE FROM cart WHERE idcart = " + idcart;
                    smt.executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "成功移出購物車",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='別這樣...'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%

                }

                if (op.equals("clear")) {

                    sql = "DELETE FROM cart WHERE memberID = '" + memberID + "'";
                    smt.executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "購物車已全數清除",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='傷心嗚嗚嗚'></input></a>",
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
