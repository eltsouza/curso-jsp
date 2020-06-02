<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Sistema</title>
		<!--===============================================================================================-->	
			<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
		<!--===============================================================================================-->	
			<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
		<!--===============================================================================================-->	
			<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
		<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="resources/css/util.css">
			<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<!--===============================================================================================-->
	</head>
	<body>
	
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100">
					<div class="login100-form-title" style="background-image: url(resources/images/note.jpg);">
						<span class="login100-form-title-1">
							Login
						</span>
					</div>
	
					<form action="LoginServlet" method="post" class="login100-form validate-form">
						<div class="wrap-input100 validate-input m-b-26" data-validate="Login é obrigatório">
							<span class="label-input100">Usuário</span>
							<input class="input100" type="text" id="login" name="login" placeholder="Informe o login">
							<span class="focus-input100"></span>
						</div>
	
						<div class="wrap-input100 validate-input m-b-18" data-validate = "Senha é obrigatório">
							<span class="label-input100">Senha</span>
							<input class="input100" type="password" id="senha" name="senha" placeholder="Informe a senha">
							<span class="focus-input100"></span>
						</div>
	
						<div class="flex-sb-m w-full p-b-30">
							<div class="contact100-form-checkbox">
								<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
								<label class="label-checkbox100" for="ckb1">
									Lembre-me
								</label>
							</div>
						</div>
	
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit" value="acessar">
								Login
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--===============================================================================================-->
		<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
			<script src="resources/vendor/animsition/js/animsition.min.js"></script>
		<!--===============================================================================================-->
			<script src="resources/vendor/bootstrap/js/popper.js"></script>
			<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
			<script src="resources/vendor/select2/select2.min.js"></script>
		<!--===============================================================================================-->
			<script src="resources/vendor/daterangepicker/moment.min.js"></script>
			<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
		<!--===============================================================================================-->
			<script src="resources/vendor/countdowntime/countdowntime.js"></script>
		<!--===============================================================================================-->
			<script src="resources/js/main.js"></script>
	</body>
	
</html>