<!DOCTYPE html>
<%@page import="com.quizpro.dto.UserTestHis"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuizPro - My Tests History</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
:root {
	--primary-color: #0077B6;
	--accent-color: #FFB700;
	--dark-bg: #F0F2F5;
	--light-text: #212529;
	--card-bg: #FFFFFF;
	--subtle-gray: #6C757D;
	--shadow-light: rgba(0, 0, 0, 0.08);
	--success-color: #28a745;
	--warning-color: #ffc107;
	--danger-color: #dc3545;
}

/* Basic Setup (Reused) */
body {
	font-family: 'Inter', sans-serif;
	margin: 0;
	padding: 0;
	background-color: var(--dark-bg);
	color: var(--light-text);
	line-height: 1.6;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 15px;
}

h1 {
	font-size: 2.5em;
	font-weight: 800;
	margin-bottom: 5px;
	color: var(--light-text);
}

/* --- Navigation Bar (Reused) --- */
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

.nav-links a:hover {
	color: var(--primary-color);
	border-bottom: 3px solid var(--primary-color);
}

.nav-links .active {
	color: var(--primary-color);
	border-bottom: 3px solid var(--primary-color);
}
/* Profile Menu Styles (Reused) */
.profile-menu {
	position: relative;
	margin-left: 20px;
}

.profile-icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 2px solid var(--primary-color);
	cursor: pointer;
	object-fit: cover;
}

.dropdown-content {
	display: none;
	position: absolute;
	top: 50px;
	right: 0;
	background-color: var(--card-bg);
	box-shadow: 0 8px 16px var(--shadow-light);
	z-index: 10;
	min-width: 150px;
	border-radius: 8px;
	overflow: hidden;
	border: 1px solid #eee;
}

.dropdown-content.show {
	display: block;
}

.dropdown-content a {
	color: var(--light-text) !important;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	border-bottom: none !important;
	text-align: left;
	margin: 0;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
	color: var(--primary-color) !important;
}

/* --- Page Header & Filters --- */
.page-header {
	padding: 40px 0 30px;
}

.page-header p {
	font-size: 1.1em;
	color: var(--subtle-gray);
}

.filter-controls {
	display: flex;
	gap: 15px;
	margin-bottom: 20px;
}

.filter-controls select {
	padding: 10px 15px;
	border: 1px solid #CED4DA;
	border-radius: 8px;
	background-color: var(--card-bg);
	font-size: 1em;
	cursor: pointer;
}

/* --- Test History Table --- */
.history-table-container {
	background-color: var(--card-bg);
	border-radius: 12px;
	box-shadow: 0 4px 15px var(--shadow-light);
	overflow-x: auto; /* Ensures responsiveness on small screens */
	margin-bottom: 40px;
}

.history-table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

.history-table th, .history-table td {
	padding: 15px;
	border-bottom: 1px solid #E9ECEF;
}

.history-table th {
	background-color: #F8F9FA;
	font-weight: 700;
	color: var(--light-text);
	cursor: pointer;
}

.history-table th i {
	margin-left: 5px;
	font-size: 0.8em;
}

.history-table tbody tr:hover {
	background-color: #f5f5f5;
}

.score-success {
	color: var(--success-color);
	font-weight: 700;
}

.score-warning {
	color: var(--warning-color);
	font-weight: 700;
}

.score-danger {
	color: var(--danger-color);
	font-weight: 700;
}

/* Action Buttons */
.action-link {
	display: inline-block;
	color: var(--primary-color);
	text-decoration: none;
	font-weight: 600;
	transition: color 0.2s;
	margin-right: 15px;
}

.action-link:hover {
	color: #005691;
}

.retake-button {
	background-color: var(--accent-color);
	color: var(--light-text);
	padding: 8px 12px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: 600;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.navbar .nav-links {
		display: none;
	}
	.filter-controls {
		flex-direction: column;
	}
	.history-table th, .history-table td {
		padding: 10px 5px;
		font-size: 0.9em;
	}
}
</style>
</head>
<body>
	<%-- <%
 List<UserTestHis> uhis = (List<UserTestHis>)request.getAttribute("usertesthis");


%> --%>
	<header class="navbar">
		<div class="container">
			<a href="dashboard.html" class="logo">Quiz<span>Pro</span></a>

			<div class="nav-links">
				<a href="#"><i class="fas fa-home"></i> Home</a> <a
					href="learning-paths.html"><i class="fas fa-map-marked-alt"></i>
					Learning Paths</a> <a href="categories.html"><i
					class="fas fa-list-ul"></i> Categories</a> <a href="#" class="active"><i
					class="fas fa-history"></i> My Tests</a>
			</div>

			<div class="profile-menu">
				<img src="https://via.placeholder.com/40/0077B6/FFFFFF?text=J"
					alt="User Avatar" class="profile-icon" id="profileIcon"
					onclick="toggleDropdown()">

				<div class="dropdown-content" id="profileDropdown">
					<a href="#"><i class="fas fa-user-circle"></i> Profile</a> <a
						href="login.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
				</div>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="page-header">
			<h1>Test History & Performance</h1>
			<p>Review all your completed and in-progress quizzes. Track your
				progress across all categories.</p>
		</div>

		<div class="filter-controls">
			<select>
				<option>Filter by Category (All)</option>
				<option>Software Engineering</option>
				<option>Data Science & AI</option>
				<option>Financial Analysis</option>
			</select> <select>
				<option>Filter by Status (All)</option>
				<option>Completed</option>
				<option>In Progress</option>
				<option>Failed</option>
			</select> <select>
				<option>Show Last 30 Days</option>
				<option>Show Last 90 Days</option>
				<option>Show All Time</option>
			</select>
		</div>

		<div class="history-table-container">
			<table class="history-table">
				<thead>
					<tr>
						<th>Quiz Name</th>
						<th>Category</th>
						<th>Date Taken <i class="fas fa-sort-down"></i></th>
						<th>Score (%)</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%-- <%
                		for(UserTestHis uHis:uhis) {
                	%>
                	<tr>
                		<td><%=uHis.getQuizName() %></td>
                		<td><%=uHis.getCategory() %></td>
                		<td><%=uHis.getDateTaken() %></td>
                		<td><%=uHis.getScorePer() %></td>
                		<td><%=uHis.getStatus() %></td>
                		 <td> <a href="quiz-page.html" class="retake-button">Retake</a>
                        </td>
                       </tr>
                       <%
                		}
                       %> --%>

					<%
					List<UserTestHis> uhis = (List<UserTestHis>) request.getAttribute("usertesthis");
					%>

					<%
					for (UserTestHis uHis : uhis) {
					%>
					<tr>
						<td><%=uHis.getQuizName()%></td>
						<td><%=uHis.getCategory()%></td>
						<td><%=uHis.getDateTaken()%></td>
						<td><%=uHis.getScorePer()%></td>
						<td><%=uHis.getStatus()%></td>
						<td><a href="quiz-page.html" class="retake-button">Retake</a></td>
					</tr>
					<%
					}
					%>

					<!-- <tr>
                        <td>Advanced Algorithm Design</td>
                        <td>Software Engineering</td>
                        <td>2025-11-20</td>
                        <td class="score-success">92%</td>
                        <td>Pass</td>
                            <a href="results-page.html" class="action-link"><i class="fas fa-search"></i> Review</a>
                           <td> <a href="quiz-page.html" class="retake-button">Retake</a>
                        </td>
                    </tr>
                    <tr>
                        <td>System Design Fundamentals</td>
                        <td>Software Engineering</td>
                        <td>2025-11-15</td>
                        <td class="score-danger">45%</td>
                        <td>Fail</td>
                            <a href="results-page.html" class="action-link"><i class="fas fa-search"></i> Review</a>
                           <td> <a href="quiz-page.html" class="retake-button">Retake</a>
                        </td> 
                    </tr>
                    <tr>
                        <td>Python Fundamentals Module 1</td>
                        <td>Data Science & AI</td>
                        <td>2025-11-10</td>
                        <td class="score-warning">In Progress</td>
                        <td>Pass</td>
                            <a href="quiz-page.html" class="action-link" style="color: var(--accent-color);"><i class="fas fa-play"></i> Resume</a>
                            <td><a href="#" class="retake-button" style="background-color: var(--subtle-gray);">Finish Later</a>
                        </td> 
                    </tr>
                    <tr>
                        <td>Financial Modeling Basics</td>
                        <td>Financial Analysis</td>
                        <td>2025-10-28</td>
                        <td class="score-warning">71%</td>
                        <td>Pass</td>
                            <a href="results-page.html" class="action-link"><i class="fas fa-search"></i> Review</a>
                            <td><a href="quiz-page.html" class="retake-button">Retake</a>
                        </td> 
                    </tr> -->
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function toggleDropdown() {
			document.getElementById("profileDropdown").classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.profile-icon')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-content");
				for (var i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>

</body>
</html>