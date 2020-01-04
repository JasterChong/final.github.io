<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = request.getParameter("previousPage");
	%>
<head>
    <title>管理商品</title>
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
                String op = request.getParameter("op");
                String idcourse = request.getParameter("idcourse");

                if (op.equals("upd")) {

                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String time = request.getParameter("time");
                    String residual = request.getParameter("residual");
                    String img_file = request.getParameter("img_file");
                    String category = request.getParameter("category");
                    String ingredients = request.getParameter("ingredients");
                    String lecturer = request.getParameter("lecturer");

                    sql = "UPDATE course SET idcourse = '" + idcourse + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET name = '" + name + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET price = '" + price + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET time = '" + time + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET residual = '" + residual + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET img_file = '" + img_file + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET category = '" + category + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET ingredients = '" + ingredients + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
                    sql = "UPDATE course SET lecturer = '" + lecturer + "' WHERE idcourse = '" + idcourse + "'";
                    smt.executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "更新成功",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='總算可以更新了'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%
                }

                if (op.equals("del")) {

                    sql = "DELETE FROM course WHERE idcourse = " + idcourse;
                    smt.executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "移除成功",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='移除也做好了www'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%

                }

                if (op.equals("ins")) {

                    String name = request.getParameter("name");
                    String price = request.getParameter("price");
                    String time = request.getParameter("time");
                    String residual = request.getParameter("residual");
                    String img_file = request.getParameter("img_file");
                    String category = request.getParameter("category");
                    String ingredients = request.getParameter("ingredients");
                    String lecturer = request.getParameter("lecturer");

                    sql = "INSERT INTO course(name, price, time, residual, avg_rate, file_path, img_file, category, ingredients, lecturer, img_path_1, img_path_2) VALUES('" + name + "', " + price + ", '" + time + "', " + residual + ", '0', 'photo/course', '" + img_file + "', '" + category + "', '" + ingredients + "', '" + lecturer + "', 'img/product/1_1.png', 'img/product/1_2.png')";
                    smt.executeUpdate(sql);
    %>
    <script>
        swal ({
            title: "新增成功",
            html: "<a href='<%=previousPage%>'><input type='button' class='swal-btn btn btn-success' value='還有新增商品也不能漏掉'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
    <%

                }
    %>

    <script>
		function myFunction() {
            var x = document.getElementById("mySelect");
            x.remove(x.selectedIndex);
		}
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
