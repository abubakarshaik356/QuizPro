<%@ page import="java.util.*"%>
<%@ page import="com.quizpro.dto.Subject"%>
<%@ page import="com.quizpro.dto.UserManage"%>

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
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
:root {
    --primary-color: #0077B6;
    --accent-color: #FFB700;
    --dark-bg: #F0F2F5;
    --card-bg: #FFFFFF;
    --shadow-light: rgba(0,0,0,0.08);
}

body {
    font-family: 'Inter', sans-serif;
    background: var(--dark-bg);
    margin: 0;
    padding: 0;
}

.admin-layout {
    display: flex;
    min-height: 100vh;
}
.main-content {
    flex-grow: 1;
    padding: 20px;
    max-width: 100%	;  /* reduced width */
    margin-left: 30px;
    background-color: var(--dark-bg);
}

.card {
    background: var(--card-bg);
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px var(--shadow-light);
}

.card h3 { margin-top: 0; margin-bottom: 10px; }

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
}

/* Responsive */
@media(max-width:992px){
    .admin-layout{ flex-direction: column; }
    .sidebar{ width:100%; height:auto; }
    .main-content{ margin-left:0; padding:15px; }
}
</style>
</head>
<body>

<div class="admin-layout">
    <%@ include file="adminSideBar.jsp"%>

    <main class="main-content">
        <div class="card">
            <h3>Platform Overview</h3>
            <canvas id="barChart" ></canvas>
        </div>

        <div class="stats-grid">
            <div class="card">
                <h3>Quizzes per Subject</h3>
                <canvas id="pieChart" style="max-width:500px; max-height:300px;"></canvas>
            </div>
            <div class="card">
                <h3>Users' Quiz Participation</h3>
                <canvas id="lineChart" style="max-width:500px; max-height:300px;"></canvas>
            </div>
        </div>
    </main>
</div>

<script>
/* BAR CHART */
const barData = {
    labels: ['Users','Subjects','Quizzes'],
    datasets: [{
        label:'Total Count',
        data:[<%=totalUsers%>,<%=totalSubjects%>,<%=totalQuizzes%>],
        backgroundColor:['rgba(40,167,69,0.6)','rgba(23,162,184,0.6)','rgba(255,183,0,0.6)'],
        borderColor:['rgba(40,167,69,1)','rgba(23,162,184,1)','rgba(255,183,0,1)'],
        borderWidth:1
    }]
};
new Chart(document.getElementById('barChart'), { type:'bar', data:barData, options:{ responsive:true, scales:{ y:{ beginAtZero:true, precision:0 } } } });

/* PIE CHART */
const pieLabels = [<%for(int i=0;i<subjects.size();i++){ out.print("'"+subjects.get(i).getSubname()+"'"); if(i<subjects.size()-1) out.print(","); } %>];
const pieDataValues = [<%for(int i=0;i<subjects.size();i++){ out.print(subjects.get(i).getQuizCount()); if(i<subjects.size()-1) out.print(","); } %>];
const pieData = { labels: pieLabels, datasets:[{ label:'Quizzes per Subject', data:pieDataValues, backgroundColor:['rgba(255,99,132,0.6)','rgba(54,162,235,0.6)','rgba(255,206,86,0.6)','rgba(75,192,192,0.6)','rgba(153,102,255,0.6)','rgba(255,159,64,0.6)'] }] };
new Chart(document.getElementById('pieChart'), { type:'pie', data:pieData, options:{ responsive:true } });

/* LINE CHART */
const lineLabels = [<%for(int i=0;i<users.size();i++){ out.print("'"+users.get(i).getName()+"'"); if(i<users.size()-1) out.print(","); } %>];
const lineDataValues = [<%for(int i=0;i<users.size();i++){ out.print(users.get(i).getTotalQuizAttend()); if(i<users.size()-1) out.print(","); } %>];
const lineData = { labels: lineLabels, datasets:[{ label:'Quizzes Attended', data:lineDataValues, fill:false, borderColor:'rgba(23,162,184,1)', tension:0.2 }] };
new Chart(document.getElementById('lineChart'), { type:'line', data:lineData, options:{ responsive:true, scales:{ y:{ beginAtZero:true, precision:0 } } } });
</script>

</body>
</html>
