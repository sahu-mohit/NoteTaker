<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="CSS/Style.css" rel="stylesheet">
<%@ include file="all_js_css.jsp" %>
</head>
<body>
<%@include file="navbar.jsp"%>
	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4 container">

									<div class="text-center">				
										<h4 class="mt-1 mb-5 pb-1">We are The Lotus Team</h4>
									</div>

									<form>
										<p>Please login to your account</p>

										<div class="form-outline mb-4">
											<input type="email" id="form2Example11" class="form-control"
												placeholder="Phone number or email address" /> <label
												class="form-label" for="form2Example11">Username</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example22"
												class="form-control" /> <label class="form-label"
												for="form2Example22">Password</label>
										</div>

										<div class="text-center pt-1 mb-5 pb-1">
											<button
												class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
												type="button">Log in</button>
											<a class="text-muted" href="#!">Forgot password?</a>
										</div>

										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Don't have an account?</p>
											<button type="button" class="btn btn-outline-danger">Create
												new</button>
										</div>

									</form>

								</div>
							</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>