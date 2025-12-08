<%@ page import="java.util.*" %>
<%@ page import="com.quizpro.dto.Subject" %>
<%@ page import="com.quizpro.dto.UserManage" %>

<%
Integer totalUsers = (Integer) request.getAttribute("totalUsers");
Integer totalQuizzes = (Integer) request.getAttribute("totalQuizzes");
Integer totalSubjects = (Integer) request.getAttribute("totalSubjects");
ArrayList<Subject> subjects = (ArrayList<Subject>) request.getAttribute("subjects");
ArrayList<UserManage> users = (ArrayList<UserManage>) request.getAttribute("users");

if (totalUsers == null) totalUsers = 0;
if (totalQuizzes == null) totalQuizzes = 0;
if (totalSubjects == null) totalSubjects = 0;
if (subjects == null) subjects = new ArrayList<>();
if (users == null) users = new ArrayList<>();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuizPro - Analytics Reports</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
:root {
	--primary-color: #0077B6; /* Blue */
	--accent-color: #FFB700; /* Yellow/Orange */
	--dark-bg: #F0F2F5;
	--light-text: #212529;
	--card-bg: #FFFFFF;
	--subtle-gray: #6C757D;
	--shadow-light: rgba(0, 0, 0, 0.08);
	--success-color: #28a745;
	--danger-color: #dc3545;
	--info-color: #17a2b8;
	--warning-color: #ffc107;
}


/* Layout */
body { font-family: 'Inter', sans-serif; background: var(--dark-bg); margin:0; padding:0; }
.admin-layout { display: flex; min-height: 100vh; }
.main-content { flex-grow:1; padding: 30px; }
.card { background: var(--card-bg); padding:20px; margin-bottom:25px; border-radius:10px; box-shadow:0 4px 10px var(--shadow-light); }
.card h3 { margin-top:0; margin-bottom:15px; }
.stats-grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap:20px; }
@media(max-width:992px){ .admin-layout{ flex-direction:column; } .sidebar{ width:100%; height:auto; } }
</style>
</head>
<body>

<div class="admin-layout">
    <%@ include file="adminSideBar.jsp" %>

    <main class="main-content">
        <div class="card">
            <h3>Platform Overview</h3>
            <canvas id="barChart"></canvas>
        </div>

        <div class="stats-grid">
            <div class="card">
                <h3>Quizzes per Subject</h3>
                <canvas id="pieChart"></canvas>
            </div>
            <div class="card">
                <h3>Users' Quiz Participation</h3>
                <canvas id="lineChart"></canvas>
            </div>
        </div>
    </main>
</div>

<script>
/* -------- BAR CHART: Total Users / Subjects / Quizzes -------- */
const barData = {
    labels: ['Users', 'Subjects', 'Quizzes'],
    datasets: [{
        label: 'Total Count',
        data: [<%= totalUsers %>, <%= totalSubjects %>, <%= totalQuizzes %>],
        backgroundColor: ['rgba(40, 167, 69, 0.6)','rgba(23, 162, 184, 0.6)','rgba(255, 183, 0, 0.6)'],
        borderColor: ['rgba(40, 167, 69, 1)','rgba(23, 162, 184, 1)','rgba(255, 183, 0, 1)'],
        borderWidth: 1
    }]
};
new Chart(document.getElementById('barChart'), { type: 'bar', data: barData, options: { responsive:true, scales:{y:{beginAtZero:true, precision:0}} } });

/* -------- PIE CHART: Quizzes per Subject -------- */
const pieLabels = [<%
    for(int i=0; i<subjects.size(); i++){
        out.print("'" + subjects.get(i).getSubname() + "'");
        if(i < subjects.size()-1) out.print(",");
    }
%>];

const pieDataValues = [<%
    for(int i=0; i<subjects.size(); i++){
        out.print(subjects.get(i).getQuizCount());
        if(i < subjects.size()-1) out.print(",");
    }
%>];

const pieData = { labels: pieLabels, datasets: [{ label: 'Quizzes per Subject', data: pieDataValues, backgroundColor: [
    'rgba(255, 99, 132, 0.6)','rgba(54, 162, 235, 0.6)','rgba(255, 206, 86, 0.6)',
    'rgba(75, 192, 192, 0.6)','rgba(153, 102, 255, 0.6)','rgba(255, 159, 64, 0.6)'] }] };
new Chart(document.getElementById('pieChart'), { type: 'pie', data: pieData, options: { responsive:true } });

/* -------- LINE CHART: Users' Quiz Participation -------- */
const lineLabels = [<%
    for(int i=0; i<users.size(); i++){
        out.print("'" + users.get(i).getName() + "'");
        if(i < users.size()-1) out.print(",");
    }
%>];

const lineDataValues = [<%
    for(int i=0; i<users.size(); i++){
        out.print(users.get(i).getTotalQuizAttend());
        if(i < users.size()-1) out.print(",");
    }
%>];

const lineData = { labels: lineLabels, datasets: [{ label: 'Quizzes Attended', data: lineDataValues, fill: false, borderColor: 'rgba(23, 162, 184, 1)', tension: 0.2 }] };
new Chart(document.getElementById('lineChart'), { type: 'line', data: lineData, options: { responsive:true, scales:{y:{beginAtZero:true, precision:0}} } });
</script>

</body>
</html>
