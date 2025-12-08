<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.admin-layout {
	display: flex;
	min-height: 100vh;
}

.sidebar {
	width: 250px;
	background-color: var(--primary-color);
	color: white;
	padding: 20px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	height: 100vh;
	overflow-y: auto;
}

.sidebar .logo {
	font-size: 2em;
	font-weight: 800;
	display: block;
	text-align: center;
	margin-bottom: 30px;
	color: white;
	text-decoration: none;
}

.sidebar .logo span {
	color: var(--accent-color);
}

.sidebar nav a {
	display: block;
	color: rgba(255, 255, 255, 0.85);
	text-decoration: none;
	padding: 15px 10px;
	margin-bottom: 5px;
	border-radius: 8px;
	transition: background-color 0.2s;
	font-weight: 600;
}

.sidebar nav a:hover, .sidebar nav a.active {
	background-color: rgba(255, 255, 255, 0.15);
	color: white;
}

.sidebar nav a i {
	margin-right: 10px;
	font-size: 1.1em;
}

.main-content {
	flex-grow: 1;
	padding: 30px;
	background-color: var(--dark-bg);
}


/* Responsive adjustments */
@media ( max-width : 992px) {
	.admin-layout {
		flex-direction: column;
	}
	.sidebar {
		width: 100%;
		height: auto;
		position: static;
		overflow-x: auto;
		display: flex;
		flex-direction: row;
		padding: 15px 0;
	}
	.sidebar .logo {
		display: none;
	}
	.sidebar nav {
		display: flex;
		white-space: nowrap;
		padding: 0 15px;
	}
	.sidebar nav a {
		padding: 10px 15px;
		margin: 0 5px;
	}
	.main-content {
		padding: 20px;
	}
	.stats-grid {
		grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	}
	.management-grid {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<aside class="sidebar">
			<a href="#" class="logo">Admin<span>Pro</span></a>
			<nav>
				<a href="adminDashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i>Dashboard</a> 
				<a href="UserManagement"><i class="fas fa-users"></i> User Management</a> 
				<a href="ContentManagement"><i class="fas fa-puzzle-piece"></i>Content Management</a> 
				<a href="AnalyticsReports"><i class="fas fa-chart-line"></i>Analytics & Reports</a> 
				<a href="index.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a>
			</nav>
		</aside>
</body>
</html>