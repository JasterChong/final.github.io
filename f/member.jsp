<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = "../member.jsp";

		if (session.getAttribute("member") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
<head>
	<title>Ivre會員中心</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="Shortcut Icon" href="">
	<!-- css folder -->
	<link rel="stylesheet" type="text/css" href="../f/assets/css/product.css">
	<link rel="stylesheet" type="text/css" href="css/style-1.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
		integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<!-- Google Fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat&display=swap">
</head>

<body style="background-color:black;">

	<body>

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
	<!-- header end -->

	<div class="air" style="width: 100%; height: 80px;"></div>

	<!-- section sart -->
	<section>

			
				
			
			<%
				sql = "SELECT * FROM  member WHERE id = '" + session.getAttribute("member") + "'";
				rs = smt.executeQuery(sql);

				String id = "";
				String email = "";
				String idmember = "";
				String pwd = "";

				if (rs.next()) {
					id = rs.getString("id");
					email = rs.getString("email");
					idmember = rs.getString("idmember");
					pwd = rs.getString("pwd");
				}
			%>
			
				<p><font color="FFFFFF">會員基本資料料</font></p>
				<table>
					<tr><td width="30%"><font color="FFFFFF">會員編號：</td></font><td width="70%"><font color="FFFFFF"><%=idmember%></font></td></tr>
					<tr><td width="30%"><font color="FFFFFF">姓名：</td></font><td width="70%"><font color="FFFFFF"><%=id%></font></td></tr>
					<tr><td width="30%"><font color="FFFFFF">性別：</td></font><td width="70%"><font color="FFFFFF">男</font></td></tr>
					<tr><td width="30%"><font color="FFFFFF">E-mail：</td></font><td width="70%"><font color="FFFFFF"><%=email%></font></td></tr>
				</table>
			<br><br>
			<p><font color="FFFFFF">會員資料修改改</font></p>
				<div class="head" align="center"></div>
				<form class="self" action="actionto/updatemember.jsp" method="POST">
					<table>
						<tr><td width="30%"><font color="FFFFFF">姓名：</td><td width="70%"><input type="text" name="id" value="<%=id%>" style="background-color:#FFFFFF"></font></td></tr>
						<tr><td width="30%"><font color="FFFFFF">E-mail：</font></td><td width="70%"><input type="email" name="email" value="<%=email%>" style="background-color:#FFFFFF"></td></tr>
						<tr><td width="30%"><font color="FFFFFF">舊密碼：</font></td><td width="70%"><input type="password" name="oldpwd" style="background-color:#FFFFFF"></td></tr>
						<tr><td width="30%"><font color="FFFFFF">新密碼：</font></td><td width="70%"><input type="password" name="newpwd" style="background-color:#FFFFFF"></td></tr>
						<tr><td width="30%"><font color="FFFFFF">密碼確認：</font></td><td width="70%"><input type="password" name="repeatpwd" style="background-color:#FFFFFF"></td></tr>
						<tr><td colspan=2><input class="self_btn" type="reset" value="清空"style="background-color:#FFFFFF"><input class="self_btn" type="submit" value="確認修改"style="background-color:#FFFFFF"></td></tr>
					</table>
				</form>
			
			
				<%
					sql = "SELECT count(DISTINCT submitTime) FROM orderlist WHERE memberID = '" + session.getAttribute("member") + "'";
					rs = smt.executeQuery(sql);

					int FLAG = 0;
					if (rs.next()) {
						FLAG = Integer.parseInt(rs.getString(1));
					}

					int FlaG = 0;
					for (int i = 0; i < FLAG; i++) {
				%>
				<br><br>
				<button class="accordion"><font color="000000">訂單編號 #<%=i+1%></font></button>
				<%
						sql = "SELECT * FROM orderlist WHERE memberID = '" + session.getAttribute("member") + "'";
						rs = smt.executeQuery(sql);

						String courseID = "";
						String amount = "";
						String submitTime = "";
						int times = 0;
						ResultSet rs2 = null;

						int flag = 0;
						while (rs.next()) {
				%>
					
				<%
							flag++;
							FlaG++;

							rs.absolute(FlaG);

							times = Integer.parseInt(rs.getString("count"));
							courseID = rs.getString("courseID");
							amount = rs.getString("amount");
							submitTime = rs.getString("submitTime");

							sql = "SELECT * FROM course WHERE idcourse = '" + courseID + "'";
							rs2 = con.createStatement().executeQuery(sql);

							String name = "";
							String time = "";

							while (rs2.next()) {
								name = rs2.getString("name");
								time = rs2.getString("time");
							}
				%>
						<p><font color="FFFFFF">商品名稱：</font><font color="FFFFFF"><%=name%></font></p>
						<p><font color="FFFFFF">上架時間：</font><font color="FFFFFF"><%=time.substring(0, 10)%></font></p>
						<p><font color="FFFFFF">購買數量：</font><font color="FFFFFF"><%=amount%></font></p>
						<p><font color="FFFFFF">購買時間：</font><font color="FFFFFF"><%=submitTime%></font></p>
						<hr>
					
				<%
							if (flag == times) {
								flag = 0;
								break;
							}
						}
					}
				%>
			<p>留言歷史</p>
		
			<%
				String author = "";
				int rate = 0;
				String submitTime = "";
				String feedback = "";
				String courseID = "";
				ResultSet rs2 = null;

				sql = "SELECT * FROM board WHERE author = '" + session.getAttribute("member") + "' ORDER BY idboard DESC";
				rs = smt.executeQuery(sql);

				while (rs.next()) {
					rate = Integer.parseInt(rs.getString("rate"));
					submitTime = rs.getString("submitTime");
					feedback = rs.getString("feedback");
					courseID = rs.getString("courseID");

					String courseName = "";
					sql = "SELECT name FROM course WHERE idcourse = '" + courseID + "'";
					rs2 = con.createStatement().executeQuery(sql);

					if (rs2.next()) {
						courseName = rs2.getString(1);
					}
			%>
				<div class="history" style="height: auto;">
					<span class="data">
						<p><font color="#FFFFFF"><%=courseName%></font></p>
						<p><font color="#FFFFFF"><%=submitTime%></font></p>
					</span>
					<div class="star" style="background-color:red">
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
						<p><font color="#FFFFFF"><%=feedback%></font></p>
					</div>
				</div>
				<hr>
			<%
				}
			%>
			
	
	</section>
    <!-- section end -->



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
	<script src="js/banner.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/openCity.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/accordion.js" type="text/javascript" charset="utf-8"></script>
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
