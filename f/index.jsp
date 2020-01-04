<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	<%
		previousPage = "../index.jsp";
	%>
<head>
	<title>Ivre</title>
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width , initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<!--Bootstrap CDN-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		<!--/Bootstrap CDN-->
		<script src="https://kit.fontawesome.com/c48f21d4a7.js" crossorigin="anonymous"></script> 
		<!---Custom Stylesheet-->
		<link rel="stylesheet" type="text/css" href="../f/assets/css/style.css">

		<!---Slick slider--->

		<link rel="stylesheet" type="text/css" href="../f/assets/css/slide.css">

		<script type="text/javascript" src="../f/assets/js/modernizr.custom.63321.js"></script>

		<link rel="stylesheet" type="text/css" href="../f/assets/css/swiper.min.css">
		<!------main css------>
		<link rel="stylesheet" type="text/css" href="../f/assets/css/swiper.css">

		<link rel="stylesheet" type="text/css" href="../f/assets/css/info.css">
		<link rel="stylesheet" type="text/css" href="../f/assets/css/footer.css">
		<link rel="stylesheet" type="text/css" href="../f/assets/css/snow.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="Shortcut Icon" href="">
	<!-- css folder -->
	<link rel="stylesheet" type="text/css" href="../f/assets/css/product.css">
	<link rel="stylesheet" type="text/css" href="css/style-1.css">
	<link rel="stylesheet" type="text/css" href="css/checked.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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
	<br><br><br>
	<main>
		<section id="banner">
			<div class="slideshow-container">
				<div class="mySlides fade">
					<div class="numbertext">1 / 3</div>
					<img src="photo/b1.png" style="width:100%">
				</div>
				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<img src="photo/b2.png" style="width:100%">
				</div>
				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img src="photo/b3.png" style="width:100%">
				</div>
				<div style="text-align:center">
					<span class="dot"></span>
					<span class="dot"></span>
					<span class="dot"></span>
				</div>
			</div>
		</section>
		<!--Second slider-->
				<div class="swiper-container">
					<h2><font color="#FFFFFF">產品的介紹:</font></h2>
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/09/29/9974c7066f4676b6a445283b9d8bb87c-max-576.jpg">
							</a>
							</div>
							<div class="details">
								<h3>黑色派對<br><span>NTW100</span></h3>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/10/05/9c0bbc53a15542e43cc66154f2be9e9f-max-576.jpg">
							</a>
							</div>
							<div class="details">
								<h3>皇家古典巧克力蛋糕<br><span>NTW130</span></h3>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/10/05/copy-sloftoj-1477038947-X-max-576.jpg">
							</a>
							</div>
							<div class="details">
								<h3>搖滾生巧克力蛋糕<br><span>NTW140</span></h3>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/09/28/0fb9afdef2e98c83606c84ac057173bb-max-576.jpg">
							</a>
							</div>
							<div class="details">
								<h3>比利時生巧克力65%<br><span>NTW120</span></h3>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/09/28/713bec308c8046052e8a69e1a1309d80-max-576.jpg">
							</a>
							</div>
							<div class="details">
								<h3>玫瑰包種生巧克力65%<br><span>NTW130</span></h3>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="imgBx">
								<a class="nav-link" href="menu.jsp">
								<img src="https://image-cdn-flare.qdm.cloud/q56e1252cbdcb1/image/cache/data/2016/09/13/15d826869fde28705117ebcbfb649487-max-576.png">
							</a>
							</div>
							<div class="details">
								<h3>覆盆子生巧克力<br><span>NTW120</span></h3>
							</div>
						</div>
						
					
							

			<!-----/info---->

			</main><!---/mian-->
			<!---footer--->
						<div class="footer">
			<div class="inner-footer">
				
				<div class="footer-items">
					<div class="left">
					<h5><font color="FFFFFF">本網站所有資料來源其他網路 <br>用來期末作業,別無他途</font></h5>
				
					<h5><font color="FFFFFF">
					Address:<br><br>中原大學<br> No. 200, Zhongbei Road, <br>Zhongli District, <br>Taoyuan City, 320
					</font></h5>
					</div>
				</div>
				<div class="footer-items">
					<h5><font color="FFFFFF">Quick   Links  </font></h5>
					<div class="pro">
						<div class="border"></div>
						<dl class="footer1">
							<a href="index.jsp"><li>首頁</li></a>
							<a href="menu.jsp"><li>產品介紹</li></a>
							
							<a href="aboutus.jsp"><li>關於我們</li></a>
							
						</dl>
					</div>
				</div>
				
				
				</div>
			</div>
		</div>
					</div>
		<div style="font-size: larger;"><font color="FFFFFF"><%@include file="counter.jsp"%></font></div>
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
	<!-- footer subscribe js -->
	<script>
		function myfunction(){
			document.getElementById("input-1").value="";
			}
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
				<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
				<script src="../f/assets/js/main.js"></script>
				<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
				<script type="text/javascript" src="../f/assets/js/jquery.catslider.js"></script>
				<script type="text/javascript" src="../f/assets/js/effec.js"></script>
				<script type="text/javascript" src="../f/assets/js/swiper.min.js"></script>
	<script type="text/javascript" src="../f/assets/js/swiper.js"></script>
	<script type="text/javascript" src="../f/assets/js/particles.js"></script>
	<script type="text/javascript" src="../f/assets/js/app.js"></script>
	<!--<script type="text/javascript" src="http://www.schillmania.com/projects/snowstorm/snowstorm.js"></script>  -->
	<!--<script type="text/javascript" src="../final projegt/assets/js/snow1.js"></script>-->
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
