<%@page import="java.util.ArrayList"%>
<%@page import="com.quizpro.dto.UserManage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuizPro - User Management</title>
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
	--danger-color: #dc3545;
	--warning-color: #ffc107;
}

body {
	font-family: 'Inter', sans-serif;
	margin: 0;
	padding: 0;
	background-color: var(--dark-bg);
	color: var(--light-text);
	line-height: 1.6;
}

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

.page-header {
	margin-bottom: 30px;
	border-bottom: 1px solid #dee2e6;
	padding-bottom: 20px;
}

.page-header h1 {
	font-size: 2.2em;
	margin: 0;
	font-weight: 800;
}

.page-header p {
	color: var(--subtle-gray);
}

.control-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
	padding: 15px;
	background-color: var(--card-bg);
	border-radius: 10px;
	box-shadow: 0 2px 5px var(--shadow-light);
}

.search-input {
	padding: 10px 15px;
	border: 1px solid #CED4DA;
	border-radius: 6px;
	width: 300px;
	font-size: 1em;
}

.filter-select {
	padding: 10px 15px;
	border: 1px solid #CED4DA;
	border-radius: 6px;
	font-size: 1em;
	cursor: pointer;
}

.add-user-btn {
	background-color: var(--success-color);
	color: white;
	padding: 10px 15px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: 700;
	transition: opacity 0.2s;
}

.add-user-btn:hover {
	opacity: 0.9;
}

.user-table-container {
	background-color: var(--card-bg);
	border-radius: 10px;
	box-shadow: 0 4px 10px var(--shadow-light);
	overflow-x: auto;
}

.user-table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

.user-table th, .user-table td {
	padding: 15px;
	border-bottom: 1px solid #E9ECEF;
	overflow: hidden;
}

.user-table th {
	background-color: #F8F9FA;
	font-weight: 700;
	color: var(--light-text);
	cursor: pointer;
}

.user-table tbody tr:hover {
	background-color: #f5f5f5;
}

.action-button {
	background: none;
	border: none;
	color: var(--primary-color);
	cursor: pointer;
	margin-right: 10px;
	font-size: 1em;
}

.action-button.delete {
	color: var(--danger-color);
}

/* ⭐ PAGINATION STYLE ADDED */
.pagination {
	margin-top: 25px;
	text-align: center;
}

.page-btn {
	padding: 8px 14px;
	margin: 0 4px;
	background-color: var(--primary-color);
	color: white;
	text-decoration: none;
	border-radius: 6px;
	font-weight: 600;
}

.active-page {
	background-color: var(--accent-color) !important;
	color: black !important;
}

.page-btn:hover {
	opacity: 0.85;
}

.notification-fail {
        background-color: #dc3545 !important; /* Red color for error */
    }
</style>
</head>

<body>
	<%
	List<UserManage> users = (List<UserManage>) request.getAttribute("Users");
	int currentPage = (Integer) request.getAttribute("currentPage");
	int totalPages = (Integer) request.getAttribute("totalPages");
	%>

	<div class="admin-layout">

		<%@include file="adminSideBar.jsp" %>

		<main class="main-content">
			<div class="page-header">
				<h1>User Management</h1>
				<p>View, search, and manage all registered user accounts on the
					platform.</p>
			</div>

			<div class="control-bar">
				<input type="text" placeholder="Search by Name, Email, or ID..."
					class="search-input">

				<div>
					<select class="filter-select">
						<option>Filter by Role (All)</option>
						<option>Admin</option>
						<option>Standard User</option>
						<option>Editor</option>
						
					</select> <select class="filter-select">
						<option>Filter by Status (All)</option>
						<option>Active</option>
						<option>Inactive/Banned</option>
					</select>
				</div>

				<a href="AddNewUser.jsp" class="add-user-btn"><i class="fas fa-plus"></i> Add
					New User</a>
			</div>

			<div class="user-table-container">
				<table class="user-table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name <i class="fas fa-sort"></i></th>
							<th>Email</th>
							<th>Total Quiz Attended</th>
							<th>Certificate Achieved</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>

						<%
						for (UserManage uHis : users) {
						%>
						<tr>
							<td><%=uHis.getId()%></td>
							<td><%=uHis.getName()%></td>
							<td><%=uHis.getEmail()%></td>
							<td><%=uHis.getTotalQuizAttend()%></td>
							<td><%=uHis.getCertificateAchieve()%></td>
							<td>
								<a class="action-button" href="EditUser.jsp?id=<%= uHis.getId() %>">
									<i class="fas fa-edit"></i> Edit
								</a>
								<button class="action-button delete">
									<i class="fas fa-trash-alt"></i> Delete
								</button>
							</td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>

			<!-- ⭐ PAGINATION ADDED BELOW TABLE -->
			<div class="pagination">
				<%
				if (currentPage > 1) {
				%>
				<a class="page-btn" href="UserManagement?page=<%=currentPage - 1%>">Previous</a>
				<%
				}
				%>

				<%
				for (int i = 1; i <= totalPages; i++) {
				%>
				<a class="page-btn <%=(i == currentPage ? "active-page" : "")%>"
					href="UserManagement?page=<%=i%>"><%=i%></a>
				<%
				}
				%>

				<%
				if (currentPage < totalPages) {
				%>
				<a class="page-btn" href="UserManagement?page=<%=currentPage + 1%>">Next</a>
				<%
				}
				%>
			</div>

		</main>

	</div>

<div class="main-content">
    <div id="popup-notification" style="display: none; position: fixed; top: 20px; right: 20px; background-color: #28a745; color: white; padding: 15px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0,0,0,0.2); z-index: 1000;">
        <i class="fas fa-check-circle" id="popup-icon"></i> <span id="popup-message"></span>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const params = new URLSearchParams(window.location.search);
        const status = params.get('status');
        const message = params.get('message');
        
        const notification = document.getElementById('popup-notification');
        const messageElement = document.getElementById('popup-message');
        const iconElement = document.getElementById('popup-icon');

        if ((status === 'success' || status === 'failed') && message) {
            
            const decodedMessage = decodeURIComponent(message);
            messageElement.textContent = decodedMessage;

            // --- CONDITION 1: STATUS IS SUCCESS ---
            if (status === 'success') {
                notification.style.backgroundColor = '#28a745'; // Green
                iconElement.className = 'fas fa-check-circle'; // Success icon
                notification.classList.remove('notification-fail');
            } 
            
            // --- CONDITION 2: STATUS IS FAILED ---
            else if (status === 'failed') {
                notification.style.backgroundColor = '#dc3545'; // Red (You can use the CSS class too)
                iconElement.className = 'fas fa-times-circle'; // Failure icon
                // Or: notification.classList.add('notification-fail');
            }

            // Display the message (common for both success and fail)
            notification.style.display = 'block';

            // (Optional) Remove parameters from URL for cleanliness
            if (history.replaceState) {
                const cleanUrl = window.location.pathname;
                history.replaceState(null, '', cleanUrl);
            }

            // (Optional) Hide the popup after a few seconds
            setTimeout(() => {
                notification.style.display = 'none';
            }, 5000); // Popup disappears after 5 seconds
        }
    });
</script>

</body>
</html>
