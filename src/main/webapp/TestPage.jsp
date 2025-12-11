<%-- <%@ page import="java.util.ArrayList" %>
<%@ page import="com.quizpro.dto.Questions" %>
<%@ page import="com.quizpro.dto.UserAnswer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Questions> questions = (ArrayList<Questions>) session.getAttribute("Questions");
    ArrayList<UserAnswer> answers = (ArrayList<UserAnswer>) session.getAttribute("UserAnswers");

    if (questions == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Integer currentIndex = (Integer) session.getAttribute("currentIndex");
    if (currentIndex == null) currentIndex = 0;

    Questions q = questions.get(currentIndex);

    // load previously saved answer if exists
    String savedAnswer = "";
    if (answers != null) {
        for (UserAnswer ua : answers) {
            if (ua.getQuestionId() == q.getId()) {
                savedAnswer = ua.getChosenAnswer();
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Test Page</title>
    <meta charset="UTF-8">
    <title>Quiz - Question <%= currentIndex + 1 %></title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <style>
      /* Minimal styling so it's usable right away */
      body { font-family: Arial, Helvetica, sans-serif; background:#f4f6f8; color:#222; padding:20px;}
      .card { background:white; padding:20px; border-radius:8px; box-shadow:0 2px 6px rgba(0,0,0,0.08); max-width:900px; margin:0 auto;}
      .options label { display:block; margin:10px 0; padding:10px; border-radius:6px; border:1px solid #ddd; cursor:pointer;}
      .nav { display:flex; justify-content:space-between; margin-top:20px;}
      .btn{ padding:10px 16px; border:none; border-radius:6px; cursor:pointer; font-weight:700;}
      .btn-primary{ background:#0077b6; color:white; }
      .btn-ghost{ background:#e9ecef; color:#333; }
    </style>
</head>
<body>

<h2>Question <%= currentIndex + 1 %> of <%= questions.size() %></h2>
<h3><%= q.getQuestion() %></h3>

<form action="QuestionNavigation" method="post">

    <input type="hidden" name="questionId" value="<%= q.getId() %>">

    <%
        String type = q.getOptionType(); // MCQ / Dropdown / TrueFalse

        if ("MCQ".equalsIgnoreCase(type)) {
    %>
            <label>
                <input type="radio" name="answer" value="<%= q.getOption1() %>"
                    <%= savedAnswer.equals(q.getOption1()) ? "checked" : "" %> >
                <%= q.getOption1() %>
            </label><br>

            <label>
                <input type="radio" name="answer" value="<%= q.getOption2() %>"
                    <%= savedAnswer.equals(q.getOption2()) ? "checked" : "" %> >
                <%= q.getOption2() %>
            </label><br>

            <label>
                <input type="radio" name="answer" value="<%= q.getOption3() %>"
                    <%= savedAnswer.equals(q.getOption3()) ? "checked" : "" %> >
                <%= q.getOption3() %>
            </label><br>

            <label>
                <input type="radio" name="answer" value="<%= q.getOption4() %>"
                    <%= savedAnswer.equals(q.getOption4()) ? "checked" : "" %> >
                <%= q.getOption4() %>
            </label><br>

    <%
        } else if ("Dropdown".equalsIgnoreCase(type)) {
    %>

        <select name="answer">
            <option value="">-- select --</option>

            <option value="<%= q.getOption1() %>" <%= savedAnswer.equals(q.getOption1()) ? "selected" : "" %>>
                <%= q.getOption1() %>
            </option>

            <option value="<%= q.getOption2() %>" <%= savedAnswer.equals(q.getOption2()) ? "selected" : "" %>>
                <%= q.getOption2() %>
            </option>

            <option value="<%= q.getOption3() %>" <%= savedAnswer.equals(q.getOption3()) ? "selected" : "" %>>
                <%= q.getOption3() %>
            </option>

            <option value="<%= q.getOption4() %>" <%= savedAnswer.equals(q.getOption4()) ? "selected" : "" %>>
                <%= q.getOption4() %>
            </option>
        </select>

    <%
        } else if ("TrueFalse".equalsIgnoreCase(type)) {
    %>

        <label>
            <input type="radio" name="answer" value="True"
                <%= savedAnswer.equals("True") ? "checked" : "" %> >
            True
        </label><br>

        <label>
            <input type="radio" name="answer" value="False"
                <%= savedAnswer.equals("False") ? "checked" : "" %> >
            False
        </label><br>

    <%
        } else {
    %>
        <p>Unknown question type.</p>
    <% } %>

    <br><br>

    <!-- Navigation buttons -->
    <% if (currentIndex > 0) { %>
        <button type="submit" name="action" value="prev">Previous</button>
    <% } %>

    <% if (currentIndex < questions.size() - 1) { %>
        <button type="submit" name="action" value="next">Next</button>
    <% } else { %>
        <button type="submit" name="action" value="finish">Finish</button>
    <% } %>

</form>

</body>
</html>
 --%>
 
 <%@page import="java.util.ArrayList"%>
<%@page import="com.quizpro.dto.Questions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    ArrayList<Questions> questions = (ArrayList<Questions>) session.getAttribute("Questions");
if (questions == null) {
    out.println("<p style='color:red'>No questions found. Servlet did NOT send data.</p>");
    return;
}

    int qIndex = (request.getAttribute("qIndex") != null) ? (int) request.getAttribute("qIndex") : 0;
    Questions q = (questions != null && qIndex < questions.size()) ? questions.get(qIndex) : null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizPro - Question</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            --primary: #0077B6;
            --accent: #FFB700;
            --bg: #F0F2F5;
            --text: #212529;
            --card: #FFFFFF;
            --gray: #6C757D;
            --success: #28a745;
            --danger: #dc3545;
            --shadow: rgba(0, 0, 0, 0.08);
        }

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            background: var(--bg);
            color: var(--text);
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 0 15px;
        }

        /* Header */
        .test-header {
            background: var(--card);
            padding: 15px 0;
            box-shadow: 0 2px 5px var(--shadow);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .test-title h2 {
            margin: 0;
            font-size: 1.5em;
            font-weight: 700;
        }

        .test-title p {
            margin: 0;
            font-size: 0.9em;
            color: var(--gray);
        }

        .status-box {
            font-weight: 600;
        }

        .timer {
            color: var(--danger);
            font-size: 1.2em;
        }

        .end-btn {
            background: var(--danger);
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        /* Layout */
        .test-grid {
            display: grid;
            grid-template-columns: 3fr 1fr;
            gap: 30px;
            padding: 25px 0;
        }

        /* Question Card */
        .question-card {
            background: var(--card);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px var(--shadow);
        }

        .question-number {
            color: var(--primary);
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        .question-text {
            font-size: 1.4em;
            font-weight: 600;
            margin-bottom: 20px;
        }

        /* Options */
        .option {
            margin-bottom: 15px;
        }

        .option label {
            display: flex;
            padding: 15px;
            background: var(--bg);
            border-radius: 8px;
            cursor: pointer;
            border: 2px solid transparent;
            transition: 0.2s;
        }

        input[type="radio"]:checked + label {
            border-color: var(--primary);
            background: #e6f2f9;
        }

        /* Footer Navigation */
        .test-footer {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #ccc;
            padding-top: 15px;
        }

        .nav-btn {
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            color: white;
        }

        .prev-btn { background: var(--gray); }
        .next-btn { background: var(--primary); }
        .mark-btn { background: var(--accent); color: black; }

        /* Sidebar */
        .sidebar {
            position: sticky;
            top: 110px;
        }

        .nav-card {
            background: var(--card);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px var(--shadow);
            margin-bottom: 20px;
        }

        .q-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 8px;
        }

        .q-btn {
            padding: 8px 0;
            text-align: center;
            font-weight: 600;
            border-radius: 6px;
            text-decoration: none;
            border: 1px solid #ddd;
            color: var(--text);
            background: white;
        }

        .q-btn.current {
            background: var(--primary);
            color: white;
            font-weight: 700;
        }

        .q-btn.answered {
            background: var(--success);
            color: white;
        }

        .q-btn.marked {
            border: 2px solid var(--accent);
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <header class="test-header">
        <div class="container header-flex">
            <div class="test-title">
                <h2>Data Structures Quiz</h2>
                <p>Category: Software Engineering | Difficulty: Beginner</p>
            </div>

            <div class="status-flex">
                <span class="status-box">Question: <%= qIndex + 1 %> / <%= questions.size() %></span> &nbsp; | &nbsp;
                <span class="status-box"><i class="fas fa-clock"></i> <span class="timer">25:30</span></span>
                &nbsp;&nbsp;
                <button class="end-btn" onclick="endTest()">End Test</button>
            </div>
        </div>
    </header>

    <!-- MAIN QUIZ LAYOUT -->
    <div class="container test-grid">

        <!-- Left: Question -->
        <div class="question-card">

            <div class="question-number">Question <%= qIndex + 1 %></div>

            <div class="question-text">
                <%= (q != null) ? q.getQuestion() : "Question not found" %>
            </div>

            <form action="StoreAnswer" method="post">

                <div class="option">
                    <input type="radio" id="optA" name="answer" value="A">
                    <label for="optA"><%= q.getOption1() %></label>
                </div>

                <div class="option">
                    <input type="radio" id="optB" name="answer" value="B">
                    <label for="optB"><%= q.getOption2() %></label>
                </div>

                <div class="option">
                    <input type="radio" id="optC" name="answer" value="C">
                    <label for="optC"><%= q.getOption3() %></label>
                </div>

                <div class="option">
                    <input type="radio" id="optD" name="answer" value="D">
                    <label for="optD"><%= q.getOption4() %></label>
                </div>

                <div class="test-footer">
                    <a href="QuestionNavigation?q=<%= qIndex - 1 %>" class="nav-btn prev-btn">Previous</a>

                    <div>
                        <a href="#" class="nav-btn mark-btn">Mark</a>
                        <a href="QuestionNavigation?q=<%= qIndex + 1 %>" class="nav-btn next-btn">Next</a>
                    </div>
                </div>

            </form>
        </div>

        <!-- Right: Sidebar -->
        <div class="sidebar">

            <div class="nav-card">
                <h3>Question Navigator</h3>

                <div class="q-grid">
                    <% for(int i=0; i<questions.size(); i++) { %>
                        <a href="Question?q=<%= i %>"
                           class="q-btn <%= (i == qIndex ? "current" : "") %>">
                           <%= i+1 %>
                        </a>
                    <% } %>
                </div>
            </div>

            <div class="nav-card">
                <h3>Legend</h3>
                <p><b style="color: var(--primary)">Blue:</b> Current Question</p>
                <p><b style="color: var(--success)">Green:</b> Answered</p>
                <p><b style="color: var(--accent)">Yellow Border:</b> Marked</p>
            </div>

        </div>

    </div>

    <script>
        function endTest() {
            if (confirm("End the test?")) {
                window.location.href = "TestComplete.jsp";
            }
        }
    </script>

</body>
</html>