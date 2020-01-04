<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		String Page = request.getParameter("page");
		previousPage = "../product.jsp?page=" + Page;
		sql = "SELECT * FROM course WHERE idcourse = '" + Page + "'";
		rs = smt.executeQuery(sql);

		String deadline = "";
		String name = "";
		int price = 0;
		String time = "";
		int residual = 0;
		String img_path = "";
		String ingredients = "";
		String lecturer = "";
		String AVG = "";
		String img_path_1 = "";
		String img_path_2 = "";

		if (rs.next()) {
			deadline = rs.getString("time");
			name = rs.getString("name");
			price = Integer.parseInt(rs.getString("price"));
			time = rs.getString("time");
			residual = Integer.parseInt(rs.getString("residual"));
			img_path = rs.getString("file_path") + "/" + rs.getString("img_file");
			ingredients = rs.getString("ingredients");
			lecturer = rs.getString("lecturer");
			AVG = rs.getString("avg_rate");
			img_path_1 = rs.getString("img_path_1");
			img_path_2 = rs.getString("img_path_2");
		}
	%>
<head>
	<title><%=name%></title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="Shortcut Icon" href="">
	<!-- css folder -->
	<link rel="stylesheet" type="text/css" href="../f/assets/css/product.css">
	<link rel="stylesheet" type="text/css" href="css/style-1.css">
	<link rel="stylesheet" type="text/css" href="css/checked.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/product.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
		integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<!-- SweetAlert2 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
	<!-- Google Fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&display=swap">
</head>

<body style="background-color: black;">
    <header>

		<div class="menu1">
			<div>
				<h1> <font color="FFFFFF">Ivre</font></h1>
			</div>
		<div class="container-fluid">
			<ul>
				<div class="menu">
			<ul>			
				<li class="cool-link">
					<a href="index.jsp">首頁</a>
				</li>
				<li class="cool-link">
					<a href="menu.jsp">產品介紹</a>
				</li>
				<li class="cool-link">
					<a href="aboutus.html">關於我們</a>
				</li>
				
			</ul>
		
							<li class="home pl-4">
								<form action="actionto/logout.jsp" style="display: inline;">
									<div class="btn-group" role="group" aria-label="Basic example">
										<%
											if (session.getAttribute("member") != null) {
												sql = "SELECT * FROM member WHERE id = '" + session.getAttribute("member") + "'";
												rs = smt.executeQuery(sql);

												if (rs.next()) {
										%>
										<button type="button" class="btn btn-outline-secondary" onclick="javascript:showDialog();"><i class="fas fa-user-circle"></i></button>
										<button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='member.jsp';"><i class="fas fa-id-badge mr-2"></i><%=rs.getString("id")%></button>
										<button type="submit" class="btn btn-outline-secondary"><i class="fas fa-sign-out-alt mr-2"></i>Sign Out</button>
										<%
												}

												if (session.getAttribute("admin") != null) {
													sql = "SELECT * FROM member WHERE id = '" + session.getAttribute("admin") + "'";
													rs = smt.executeQuery(sql);

													if (rs.next()) {
										%>
										<button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='manager.jsp';"><i class="fas fa-tasks mr-2"></i>後臺管理</button>
										<%
													}
												}
											}
											else {
										%>
										<button type="button" class="btn btn-outline-secondary" onclick="javascript:showDialog();"><i class="fas fa-user-circle mr-2"></i>Sign In/Sign Up</button>
										<%
											}
										%>
									</div>
									<!-- previousPage -->
									<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
								</form>
								<!-- dialogue -->
								<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
									<div class="ui-dialog-title" id="dialogDrag" onselectstart="return false;"
										style="border: 1px solid rgba(0,0,0,.2); border-radius: .3rem .3rem 0 0; border-bottom-width: 0;">
										<a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>
									</div>
									<div class="login-wrap">
										<div class="login-html" style="padding: 20px 40px; border: 1px solid rgba(0,0,0,.2); border-radius: 0 0 .3rem .3rem; border-top-width: 0;">
											<%
												if (session.getAttribute("member") == null) {
											%>
											<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab" style="margin-bottom: 30px;">Sign In</label>&emsp;
											<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab" style="margin-bottom: 30px;">Sign Up</label>
											<div class="login-form" style="color: #454545;">
												<!-- sign in -->
												<form action="actionto/sign_in.jsp" method="POST" class="sign-in-form">
													<div class="sign-in-htm container">
														<div class="group form-group row">
															<label for="signin-id" class="col-4 label">Username</label>
															<input id="signin-id" name="id" type="text"
																class="form-control col-7 input" maxlength="12" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
														</div>
														<div class="group form-group row">
															<label for="signin-pwd" class="col-4 label">Password</label>
															<input id="signin-pwd" name="pwd" type="password"
																class="form-control col-7 input" maxlength="20" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
															<i class="fa fa-eye ml-2" id="eye1"
																onclick="showhide();"
																style="height: 25px; margin-top: 22px;"></i>
														</div>
														<div class="group form-group">
															<input type="submit" class="button" value="Sign In">
														</div>
														<div class="hr"></div>

													</div>
													<!-- previousPage -->
													<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
												</form>
												<!-- sign up -->
												<form action="actionto/sign_up.jsp" method="POST" class="sign-up-form">
													<div class="sign-up-htm container">
														<div class="group form-group row">
															<label for="signup-id" class="col-4 label">Username <span
																	class="text-danger">*</span></label>
															<input id="signup-id" name="id" type="text"
																class="form-control col-7 input" maxlength="12" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" placeholder=" ">
														</div>
														<div class="group form-group row">
															<label for="signup-pwd" class="col-4 label">Password <span
																	class="text-danger">*</span></label>
															<input id="signup-pwd" name="pwd" type="password"
																class="form-control col-7 input pww" maxlength="20" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" placeholder=" ">
															<i class="fa fa-eye ml-2" id="eye2"
																onclick="showhide();"
																style="height: 25px; margin-top: 22px;"></i>
															<span
																class="progress-bar-text foot-lnk col-6 offset-3">Password
																is
																Blank</span>
														</div>
														<div class="group form-group row">
															<label for="email" class="col-4 label">Email <span
																	class="text-danger">*</span></label>
															<input id="email" name="email" type="email"
																class="form-control col-7 input">
														</div>
														<div class="group form-group">
															<input type="submit" class="button" value="Sign Up">
														</div>
														<div class="hr"></div>
														<div class="foot-lnk">
															<label for="tab-1">Already Member?</a></label>
														</div>
													</div>
													<!-- previousPage -->
													<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
												</form>
											</div>
											<%
												}
												else {
													sql = "SELECT * FROM member WHERE id = '" + session.getAttribute("member") + "'";
													rs = smt.executeQuery(sql);

													if (rs.next()) {
											%>
											<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab"
												style="margin-bottom: 30px;">Member Info</label>
											<div class="login-form" style="color: #454545;">
												<!-- info -->
												<div class="sign-in-htm container" id="info">
													<i class="fas fa-user-circle group" style="font-size: 8rem; color: sienna;"></i>
													<div class="row text-left my-3">
														<div class="col-4">
															<h5>USERNAME:</h5>
														</div>
														<div class="col-7">
															<h5><%=rs.getString("id")%></h5>
														</div>
													</div>
													<div class="row text-left my-3">
														<div class="col-4">
															<h5>EMAIL:</h5>
														</div>
														<div class="col-7">
															<h5><%=rs.getString("email")%></h5>
														</div>
													</div>
													<div class="hr"></div>
													<div class="group form-group my-3">
														<button type="button" class="button" onclick="javascript:location.href='member.jsp'">Edit Profile</button>
													</div>
												</div>
											</div>
											<%
													}
												}
											%>
										</div>
									</div>
								</div>
							</li>
							</div>
							</div>
			</ul>
			
		
	</header>

	<div class="air" style="width: 100%; height: 120px;"></div>

    <!-- section start -->
	<section>
		<div class="container-fluid w-75">
			<div class="promain">
				<div class="promainpic">
					<div class="mySlides">
						<div class="numbertext">1 / 2</div>
						<img src="<%=img_path_1%>" style="width:100%">
					</div>
					<div class="mySlides">
						<div class="numbertext">2 / 2</div>
						<img src="<%=img_path_2%>" style="width:100%">
					</div>
					<a class="prev" onclick="plusSlides(-1)">❮</a>
					<a class="next" onclick="plusSlides(1)">❯</a>
					<div class="promainrow">
						<div class="promaincolumn">
							<img class="demo cursor" src="<%=img_path_1%>" style="width:100%" onclick="currentSlide(1)"
								alt="">
						</div>
						<div class="promaincolumn">
							<img class="demo cursor" src="<%=img_path_2%>" style="width:100%" onclick="currentSlide(2)"
								alt="">
						</div>
					</div>
				</div>
				<form class="produce" method="GET" action="actionto/cart.jsp">
					<div class="pro">
						
						<h1 style="font-size: 50px;margin-bottom: 10px; "><font color="#CD853F"><%=name%></font></h1>
						<p>
							<span class="bNT">NT$ <%=price%></span>
						</p>
						<p><font color="#CD853F">上架日期：<%=time%></font></p>
						<p><font color="#CD853F">庫存：<%=residual%></font></p>
						<p><font color="#CD853F">評價分：<%=AVG%></font></p>
						<p><font color="#CD853F">購買數量：<input class="number mr-2" type="number" name="setnumber" value="1" min="1" max="5" style="background-color:#CD853F"></font>
						
						<div class="mt-5">
						<br><br>
						<%
							if (session.getAttribute("member") != null) {
						%>
							<a href="order.jsp"><input class="buy" type="button" value="購買" style="background-color:#CD853F"></a>
						<%
								if (residual == 0) {
						%>
							<input class="buy" type="submit" value="目前缺貨中呦" disabled>
						<%
								}
								else {
						%>
							<input class="buy" type="submit" value="加入購物車" style="background-color:#CD853F">
						<%
								}
							}
							else {
						%>
							<input class="buy" type="button" value="請先登入" disabled>
						<%
							}
						%>
						</div>
						<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
						<input type="text" name="op" value="add" hidden>
						<input type="text" name="idcourse" value="<%=Page%>" hidden>
						<input type="text" name="residual" value="<%=residual%>" hidden>
					</div>
				</form>
			</div>

			<hr style="clear:both; border: 1px solid #B3B492;">

			<div class="prointro">
				<h2 style="font-size: 40px;margin-bottom: 10px; "></h2>
				<p><font color="#CD853F">產品介紹：<br><%=ingredients%></font></p>
				
				<p><font color="#CD853F">產品規格及內容物：<br><%=lecturer%></font></p>
				<hr style="clear:both; border: 1px solid #B3B492;">
				
			</div>

			<div class="rank">
				<h2 style="font-size: 40px;margin-bottom: 10px; "><i class="fab fa-telegram-plane mr-2"></i><font color="#FFFFFF">該是你評論的時候了</font></h2>
				<form class="write" action="actionto/addfeedback.jsp" method="POST">
					<span class="data">
						<%
							if (session.getAttribute("member") != null) {
								sql = "SELECT * FROM member WHERE id = '" + session.getAttribute("member") + "'";
								rs = smt.executeQuery(sql);

								if (rs.next()) {
						%>
						<p><%=rs.getString("id")%></p>
						<%
								}
							}
							else {
						%>
						<p>訪客</p>
						<%
							}
						%>
					</span>
					<div class="star">
						<input type="radio" id="star5" name="star" value="5" CHECKED hidden />
						<label for="star5"><i class="fas fa-star"></i></label>
						<input type="radio" id="star4" name="star" value="4" hidden />
						<label for="star4"><i class="fas fa-star"></i></label>
						<input type="radio" id="star3" name="star" value="3" hidden />
						<label for="star3"><i class="fas fa-star"></i></label>
						<input type="radio" id="star2" name="star" value="2" hidden />
						<label for="star2"><i class="fas fa-star"></i></label>
						<input type="radio" id="star1" name="star" value="1" hidden />
						<label for="star1"><i class="fas fa-star"></i></label>
					</div>
					<textarea name="memo" cols="20" rows="5" wrap="hard" maxlength="100" placeholder="說說說拉~" required></textarea>
					<%
						if (session.getAttribute("member") != null) {
					%>
					<input class="ok" type="submit" value="提交">
					<%
						}
						else {
					%>
					<input class="ok" type="submit" value="請先登入" disabled>
					<%
						}
					%>
					<input type="text" name="page" value="<%=Page%>" hidden>
				</form>

				<hr style="clear:both; border: 1px solid #B3B492;">

				<%
					sql = "SELECT * FROM board WHERE courseID = '" + Page + "' ORDER BY idboard DESC";
					rs = smt.executeQuery(sql);
				%>

				<h2 style="font-size: 40px;margin-bottom: 10px; "><i class="fab fa-telegram-plane mr-2"></i><font color="#FFFFFF">評論區</font></h2>
				<div class="rankall">
					<%
						String author = "";
						int rate = 0;
						String submitTime = "";
						String feedback = "";

						if (rs.next() == false) {
					%>
					<div class="history" style="height: auto;">
						<div class="review text-center py-4"><font color="#FFFFFF">本商品尚無任何留言</font></div>
					</div>
					<%
						}
						else {
							sql = "SELECT * FROM board WHERE courseID = '" + Page + "' ORDER BY idboard DESC";
							rs = smt.executeQuery(sql);

							rs.last();
							int total_page = rs.getRow();
					%>
					<h5 class="pl-3">共<%=total_page%>筆留言</h5>
					<hr>
					<%
							sql = "SELECT * FROM board WHERE courseID = '" + Page + "' ORDER BY idboard DESC";
							rs = smt.executeQuery(sql);

							while (rs.next()) {
								author = rs.getString("author");
								rate = Integer.parseInt(rs.getString("rate"));
								submitTime = rs.getString("submitTime");
								feedback = rs.getString("feedback");

					%>
					<div class="history" style="height: auto;">
						<span class="data">
							<p><%=author%></p>
							<p><%=submitTime%></p>
						</span>
						<div class="star">
						<%
								for (int i = 5; i >= 1; i--) {
									if (i == rate) {
										out.println("<input type='radio' id='star" + i + "' CHECKED hidden>");
									}
									else {
										out.println("<input type='radio' id='star" + i + "' hidden>");
									}
									out.println("<label for='star" + i + "' class='disabled'><i class='fas fa-star'></i></label>");
								}
						%>
						</div>
						<div class="review" style="height: auto;">
							<p><%=feedback%></p>
						</div>
					</div>
					<hr>
					<%
							}
						}
					%>
				</div>
			</div>


			

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
    <!-- js folder -->
	<script src="js/header.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/password.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/showhide.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/classie.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/leftTimer.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/mySlides.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/toast.js" type="text/javascript" charset="utf-8"></script>
	<!-- SweetAlert2.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
        type="text/javascript"></script>
	<!-- footer subscribe js -->
	<script>
		function myfunction(){
			document.getElementById("input-1").value="";
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
