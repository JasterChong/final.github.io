<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = "../manager.jsp";

        if (session.getAttribute("admin") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
<head>
	<title>後臺管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="Shortcut Icon" href="">
	<!-- css folder -->
	<link rel="stylesheet" type="text/css" href="../f/assets/css/product.css">
	<link rel="stylesheet" type="text/css" href="css/style-1.css">
	<link rel="stylesheet" type="text/css" href="css/checked.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/component.css">
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

    <!-- main start -->
    <main>
		<div class="sidebar"><br><br><br>
			
			
			<div class="dropdown-container">
				<a href="javascript:manager(event, 'see');" id="defaultOpen">商品管理</a>
			</div>
			<a href="javascript:manager(event, 'complete');"> 已完成訂單</a>
		</div>
		<div id="see" class="tabcontent container-fluid">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th scope="col" style="font-size: 1rem;color:red">編號</th>
						<th scope="col" style="width: 3em;color:red">商品名稱</th>
						<th scope="col" style="color:red">價錢</th>
						<th scope="col" style="color:red">上架時間</th>
						<th scope="col" style="width: 2em;color:red">庫存</th>
						<th scope="col" style="width: 3em;color:red">圖檔</th>
						<th scope="col" style="width: 5em;color:red">分類</th>
						<th scope="col" style="color:red">介紹</th>
						<th scope="col" style="color:red">內容</th>
						<th scope="col" style="font-size: 1rem;color:red">修改</th>
						<th scope="col" style="font-size: 1rem;color:red">刪除</th>
					</tr>
				</thead>
				<tbody>
				<%
					sql = "SELECT * FROM course";
					rs = smt.executeQuery(sql);

					String idcourse = "";
					String name = "";
					String price = "";
					String time = "";
					String residual = "";
					String img_file = "";
					String category = "";
					String ingredients = "";
					String lecturer = "";

					while (rs.next()) {

						idcourse = rs.getString("idcourse");
						name = rs.getString("name");
						price = rs.getString("price");
						time = rs.getString("time");
						residual = rs.getString("residual");
						img_file = rs.getString("img_file");
						category = rs.getString("category");
						ingredients = rs.getString("ingredients");
						lecturer = rs.getString("lecturer");
				%>
					<tr id="mySelect">
						<form action="actionto/SIUD.jsp">
							<th scope="row" style="color:red"><%=idcourse%></th>
							<td><input name="name" type="text" value="<%=name%>" required></td>
							<td><input name="price" type="text" value="<%=price%>" style="width: 3em;" required></td>
							<td><input name="time" type="text" value="<%=time%>" required></td>
							<td><input name="residual" type="text" value="<%=residual%>" style="width: 2em;" required></td>
							<td><input name="img_file" type="text" value="<%=img_file%>" style="width: 3em;" required></td>
							<td><input name="category" type="text" value="<%=category%>" style="width: 5em;" required></td>
							<td><input name="ingredients" type="text" value="<%=ingredients%>" required></td>
							<td><input name="lecturer" type="text" value="<%=lecturer%>" required></td>
							<td><button type="submit"><i class="fa fa-fw fa-wrench"></i></button></td>
							<td><a href="actionto/SIUD.jsp?op=del&idcourse=<%=idcourse%>&previousPage=<%=previousPage%>"><i class="fas fa-trash" onclick="myFunction()" style="color: #212529;"></i></a></td>
							<input type="text" name="op" value="upd" hidden>
							<input type="text" name="idcourse" value="<%=idcourse%>" hidden>
							<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
						</form>
					</tr>
				<%
					}
				%>
					<tr>
						<form action="actionto/SIUD.jsp">
							<th><i class="fas fa-plus"></i></th>
							<td><input type="text" name="name" required></td>
							<td><input type="text" name="price" style="width: 3em;" required></td>
							<td><input type="text" name="time" required></td>
							<td><input type="text" name="residual" style="width: 2em;" required></td>
							<td><input type="text" name="img_file" style="width: 3em;" required></td>
							<td><input type="text" name="category" style="width: 5em;" required></td>
							<td><input type="text" name="ingredients" required></td>
							<td><input type="text" name="lecturer" required></td>
							<td colspan=2><button  type="submit">新增</button></td>
							<input type="text" name="op" value="ins" hidden>
							<input type="text" name="previousPage" value="<%=previousPage%>" hidden>
						</form>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="complete" class="tabcontent">
			<table class="complete table-bordered" style="margin-top: 2%;margin-bottom: 2%;margin-left: 40%;">
			<%
				sql = "SELECT count(DISTINCT submitTime) FROM orderlist";
				rs = smt.executeQuery(sql);

				int FLAG = 0;
				if (rs.next()) {
					FLAG = Integer.parseInt(rs.getString(1));
				}

				int FlaG = 0;
				for (int i = 0; i < FLAG; i++) {
			%>
				<tbody>
					<tr>
						<td colspan=2 class="text-center" style="color:red"><b>訂單編號 #<%=i+1%></b></td>
					</tr>
			<%
					sql = "SELECT * FROM orderlist";
					rs = smt.executeQuery(sql);

					String courseID = "";
					String amount = "";
					String submitTime = "";
					String memberID = "";
					int times = 0;
					ResultSet rs2 = null;

					int flag = 0;
					while (rs.next()) {

						flag++;
						FlaG++;

						rs.absolute(FlaG);

						times = Integer.parseInt(rs.getString("count"));
						courseID = rs.getString("courseID");
						amount = rs.getString("amount");
						submitTime = rs.getString("submitTime");
						memberID = rs.getString("memberID");

						sql = "SELECT * FROM course WHERE idcourse = '" + courseID + "'";
						rs2 = con.createStatement().executeQuery(sql);

						String courseName = "";

						while (rs2.next()) {
							courseName = rs2.getString("name");
						}
			%>
				<tr>
					<td style="color:red">訂購人</td>
					<td style="color:red"><%=memberID%></td>
				</tr>
				<tr>
					<td style="color:red">商品名稱</td>
					<td colspan="4" class="td2" style="color:red"><%=courseName%></td>
				</tr>
				<tr>
					<td style="color:red">購買數量</td>
					<td colspan="4" class="td2" style="color:red"><%=amount%></td>
				</tr>
				<tr>
					<td style="color:red">購買時間：</td>
					<td colspan="4" class="td2" style="color:red"><%=submitTime%></td>
				</tr>
			<%
						if (flag == times) {
							flag = 0;
							break;
						}
					}
			%>
				</tbody>
			<%
				}
			%>
			</table>
		</div>
	</main>
    <!-- main end -->

	

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
    <script src="js/manager.js" type="text/javascript" charset="utf-8" async defer></script>
	<!-- footer subscribe js -->
	<script>
		function myfunction(){
			document.getElementById("input-1").value="";
			}
	</script>
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

