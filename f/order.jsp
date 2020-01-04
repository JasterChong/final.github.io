<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	<%
        previousPage = "../order.jsp";
	%>
<head>
	<title>訂單資訊</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="Shortcut Icon" href="">
	<!-- css folder -->
	
	<link rel="stylesheet" type="text/css" href="css/style-1.css">
	<link rel="stylesheet" type="text/css" href="../f/assets/css/product.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/component.css">
    <link rel="stylesheet" type="text/css" href="css/cart.css">
    <link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
		integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
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

    <!-- main start -->
    <section id="">
         <div class="air" style="width: 100%; height: 120px;"></div>
    </section>
    <%

    %>
    <section id="information">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"><font color="#CD853F">編號</font></th>
                    <th scope="col"><font color="#CD853F">商品名稱</font></th>
                    <th scope="col"><font color="#CD853F">圖片</font></th>
                    <th scope="col"><font color="#CD853F">購買時間</font></th>
                    <th scope="col"><font color="#CD853F">金額</font></th>
                    <th scope="col"><font color="#CD853F">購買數量</font></th>
                    <th scope="col"><font color="#CD853F">小計</font></th>
                    <th scope="col"><font color="#CD853F">刪除</font></th>
                </tr>
            </thead>
            <tbody>
            <%
				int row = 1;

				if (session.getAttribute("member") != null) {

					sql = "SELECT * FROM cart WHERE memberID = '" + session.getAttribute("member") + "'";
					rs = smt.executeQuery(sql);

					String idcart = "";
					String courseID = "";
					int residual = 0;
					String name = "";
					String img_path = "";
					String time = "";
					int price = 0;
					int setnumber = 0;

					while (rs.next()) {

						idcart = rs.getString("idcart");
						courseID = rs.getString("courseID");
						residual = Integer.parseInt(rs.getString("courseID"));
						name = rs.getString("name");
						img_path = rs.getString("img_path");
						time = rs.getString("time").substring(0, 10);
						price = Integer.parseInt(rs.getString("price"));
						setnumber = Integer.parseInt(rs.getString("setnumber"));
            %>
                <tr id="mySelect">
                    <th scope="row"><font color="#CD853F"><%=row%></font></th>
                    <td><font color="#CD853F"><%=name%></font></td>
                    <td style="width: 25%;">
                        <img src="<%=img_path%>" style="width: 25%;">
                    </td>
                    <td><font color="#CD853F"><%=time%></font></td>
                    <td><font color="#CD853F">$<%=price%></font></td>
                    <td><font color="#CD853F"><%=setnumber%></font></td>
                    <td><font color="#CD853F">$<%=price * setnumber%></font></td>
                    <td><a href="actionto/cart.jsp?op=del&idcart=<%=idcart%>&previousPage=<%=previousPage%>"><i class="fas fa-trash" onclick="myFunction()" style="color: #212529;"></i></a></td>
                </tr>
            <%

						row++;
					}
    			}
				else {
					response.sendRedirect("index.jsp");
				}
            %>
            </tbody>
            <div class="text-right pt-0">
                <a href="actionto/cart.jsp?op=clear&previousPage=<%=previousPage%>"><button type="button" class="btn btn-info"><i class="fas fa-broom mr-2"></i>清空購物車</button></a>
            </div>
        </table>
    </section>
    <section class="information">
        <div class="row">
            <div class="col-md left">
				<%
					sql = "SELECT SUM(subtotal) FROM cart WHERE memberID = '" + session.getAttribute("member") + "'";
					rs = smt.executeQuery(sql);

					int total = 0;
					if (rs.next()) {
						if (rs.getString(1) != null) {
							total = Integer.parseInt(rs.getString(1));
						}
					}
				%>

                    <h4><font color="#CD853F">結帳資訊</font></h4><hr>
                    <p><font color="#CD853F">總計&nbsp;:&nbsp;$<%=total%></font></p>
            </div>

                    <h1><font color="#FFFFFF">信用卡付款</font></h1>&nbsp;&nbsp;
				
					<form action="actionto/balance.jsp" method="">
						<font color="red">*</font><font color="FFFFFF">&nbsp;信用卡類型&emsp;:&emsp;<select>
							<option value="Visa">Visa</option>
							<option value="Master">Master Card</option>
						</select><br><br>
						<font color="red">*</font><font color="FFFFFF">&nbsp;信用卡卡號&emsp;:&emsp;</font>
						<input type="text" name="" style="width: 40px;" minlength="4" onkeyup="value=value.replace(/[^\d]/g,'') " oninput="if(value.length>4)value=value.slice(0,4)" placeholder="" required> -
						<input type="text" name="" style="width: 40px;" minlength="4" onkeyup="value=value.replace(/[^\d]/g,'') "  oninput="if(value.length>4)value=value.slice(0,4)" placeholder="" required> -
						<input type="text" name="" style="width: 40px;" minlength="4" onkeyup="value=value.replace(/[^\d]/g,'') "  oninput="if(value.length>4)value=value.slice(0,4)" placeholder="" required> -
						<input type="text" name="" style="width: 40px;" minlength="4" onkeyup="value=value.replace(/[^\d]/g,'') "  oninput="if(value.length>4)value=value.slice(0,4)" placeholder="" required><br><br>
						<font color="red">*</font><font color="FFFFFF">&nbsp;信用卡有效年月&emsp;:&emsp;</font>
						<input type="month" name="" value="" required><br><br>
						<font color="red">*</font><font color="FFFFFF">&nbsp;信用卡背面末三碼&emsp;:&emsp;</font>
						<input type="text" name="" style="width: 30px;" minlength="3" onkeyup="value=value.replace(/[^\d]/g,'') " oninput="if(value.length>3)value=value.slice(0,3)" placeholder="" required><br><br>
						<center><input type="checkbox" name="" value="" class="checked-boing" required><font color="FFFFFF">留下交易資訊</font></center><br>
						<center><a href="menu.jsp"><button type="button" class="btn btn-info">繼續選購</button></a>&emsp;
						<input type="text" name="count" value="<%=row-1%>" hidden>
					<%
						if (total != 0) {
					%>
						<button type="submit" class="btn btn-secondary">結帳</button>
					<%
						}
						else {
					%>
                    	<button type="button" class="btn btn-secondary" disabled>沒有商品喔!</button>
					<%
						}
					%>
					</form>
                    </center><br><br>
					

            
        </div>
    </section>
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
