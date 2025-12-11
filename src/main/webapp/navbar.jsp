<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* --- Navigation Bar --- */
.navbar {
	background: var(--card-bg);
	border-bottom: 1px solid #dee2e6;
	padding: 10px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.navbar .container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 1.8em;
	font-weight: 800;
	color: var(--primary-color);
	text-decoration: none;
}

.logo span {
	color: var(--accent-color);
}

.nav-links {
	display: flex;
	align-items: center;
}

.nav-links a {
	color: var(--subtle-gray);
	text-decoration: none;
	margin: 0 15px;
	padding: 5px 0;
	font-weight: 600;
	transition: color 0.3s;
	border-bottom: 3px solid transparent;
}

.nav-links a:hover, .nav-links .active {
	color: var(--primary-color);
	border-bottom: 3px solid var(--primary-color);
}
	
</style>
<body>
		<header class="navbar">
		<div class="container">
			<a href="dashboard.jsp" class="logo">Quiz<span>Pro</span></a>

			<div class="nav-links">
				<a href="dashboard.jsp" class="active"><i class="fas fa-home"></i> Home</a> 
				<a href="categories"><i class="fas fa-list-ul"></i> Categories</a><a href="ViewTestHis"><i class="fas fa-history"></i>
					My Tests</a>
			</div>

			<div class="profile-menu">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwJgi2tfPov2vnIRkuxgRw_gHSqt_uRGbrdA&s"
					alt="User Avatar" class="profile-icon" id="profileIcon"
					onclick="toggleDropdown()">
				<div class="dropdown-content" id="profileDropdown">
					<a href="ViewProfile.jsp"><i class="fas fa-user-circle"></i> Profile</a> <a
						href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
				</div>
			</div>
		</div>
	</header>
</body>
</html>