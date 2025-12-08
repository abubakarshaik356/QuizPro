<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizPro - Data Structures Quiz (Question 5/50)</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
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
        }

        /* Basic Setup */
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
        
        /* --- Test Header (Fixed Top Bar) --- */
        .test-header {
            background-color: var(--card-bg);
            padding: 15px 0;
            box-shadow: 0 2px 5px var(--shadow-light);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .test-header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .test-title-area h2 {
            font-size: 1.5em;
            margin: 0;
            font-weight: 700;
        }
        .test-title-area p {
            font-size: 0.9em;
            color: var(--subtle-gray);
            margin: 0;
        }

        .test-status-area {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        .status-box {
            text-align: center;
            font-weight: 600;
        }
        .status-box i {
            margin-right: 5px;
        }
        .timer {
            font-size: 1.2em;
            color: var(--danger-color);
        }

        .end-test-button {
            background-color: var(--danger-color);
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 700;
            transition: opacity 0.2s;
            border: none;
            cursor: pointer;
        }
        .end-test-button:hover {
            opacity: 0.8;
        }

        /* --- Main Content Layout --- */
        .test-grid {
            display: grid;
            grid-template-columns: 3fr 1fr; /* Question | Sidebar */
            gap: 30px;
            padding: 30px 0;
        }

        /* --- Question Area --- */
        .question-area {
            background-color: var(--card-bg);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px var(--shadow-light);
        }
        .question-number {
            font-size: 1.1em;
            color: var(--primary-color);
            margin-bottom: 10px;
            font-weight: 600;
        }
        .question-text {
            font-size: 1.4em;
            font-weight: 600;
            margin-bottom: 25px;
        }
        .question-code {
            background-color: #f4f4f4;
            padding: 15px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            overflow-x: auto;
        }

        /* --- Answer Options (MCQ) --- */
        .answer-option {
            display: block;
            margin-bottom: 15px;
        }
        .answer-label {
            display: flex;
            align-items: center;
            background-color: var(--dark-bg);
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s, border 0.2s;
            border: 2px solid transparent;
        }
        .answer-label:hover {
            background-color: #e5e5e5;
        }
        .answer-input[type="radio"] {
            margin-right: 15px;
            transform: scale(1.2);
        }
        .answer-input:checked + .answer-label {
            border-color: var(--primary-color);
            background-color: #e6f2f9;
        }

        /* --- Navigation Footer --- */
        .test-footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #E9ECEF;
            display: flex;
            justify-content: space-between;
        }
        .nav-button {
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
            transition: opacity 0.2s;
        }
        .prev-button {
            background-color: var(--subtle-gray);
            color: white;
        }
        .next-button {
            background-color: var(--primary-color);
            color: white;
        }
        .mark-button {
            background-color: var(--accent-color);
            color: var(--light-text);
        }

        /* --- Sidebar (Question Navigator) --- */
        .sidebar-area {
            position: sticky;
            top: 100px; /* Below the fixed header */
            align-self: flex-start;
        }
        .navigator-card {
            background-color: var(--card-bg);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px var(--shadow-light);
            margin-bottom: 20px;
        }
        .navigator-card h3 {
            font-size: 1.2em;
            margin: 0 0 15px 0;
            border-bottom: 1px solid #E9ECEF;
            padding-bottom: 10px;
        }
        .question-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
        }
        .q-button {
            padding: 8px 0;
            border: 1px solid #CED4DA;
            border-radius: 6px;
            text-align: center;
            text-decoration: none;
            color: var(--light-text);
            font-weight: 600;
            transition: all 0.2s;
            background-color: white;
            font-size: 0.9em;
        }
        .q-button.answered {
            background-color: var(--success-color);
            color: white;
            border-color: var(--success-color);
        }
        .q-button.current {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
            transform: scale(1.1);
            font-weight: 800;
        }
        .q-button.marked {
            border: 2px solid var(--accent-color);
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .test-grid {
                grid-template-columns: 1fr; /* Stack main content and sidebar */
            }
            .sidebar-area {
                position: static;
                top: auto;
            }
            .test-header .container {
                flex-direction: column;
                gap: 15px;
            }
        }
        @media (max-width: 576px) {
            .test-status-area {
                gap: 15px;
                width: 100%;
                justify-content: space-between;
            }
            .end-test-button {
                padding: 8px 10px;
            }
            .question-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }
    </style>
</head>
<body>

    <header class="test-header">
        <div class="container">
            <div class="test-title-area">
                <h2>Data Structures Fundamentals Quiz</h2>
                <p>Category: Software Engineering | Difficulty: Beginner</p>
            </div>
            
            <div class="test-status-area">
                <div class="status-box">
                    <i class="fas fa-list-ol"></i> Question:
                    <span style="color: var(--primary-color);">5</span> / 50
                </div>
                <div class="status-box">
                    <i class="fas fa-clock"></i> Time Remaining:
                    <span class="timer">25:30</span>
                </div>
                <button class="end-test-button" onclick="confirmEndTest()">End Test</button>
            </div>
        </div>
    </header>

    <div class="container test-grid">
        
        <div class="question-column">
            <div class="question-area">
                <div class="question-number">Question 5 of 50</div>
                
                <h3 class="question-text">
                    What is the time complexity for inserting an element into a hash table in the average case?
                </h3>
                
                <pre class="question-code">
// Example Context (optional)
void insert(key, value) {
  // logic here...
}
                </pre>
                
                <form id="quizForm">
                    <label class="answer-option">
                        <input type="radio" name="answer_q5" value="A" class="answer-input">
                        <span class="answer-label">O(1)</span>
                    </label>
                    
                    <label class="answer-option">
                        <input type="radio" name="answer_q5" value="B" class="answer-input">
                        <span class="answer-label">O(n)</span>
                    </label>
                    
                    <label class="answer-option">
                        <input type="radio" name="answer_q5" value="C" class="answer-input">
                        <span class="answer-label">O(log n)</span>
                    </label>
                    
                    <label class="answer-option">
                        <input type="radio" name="answer_q5" value="D" class="answer-input">
                        <span class="answer-label">O(n²)</span>
                    </label>
                </form>

                <div class="test-footer">
                    <a href="#" class="nav-button prev-button"><i class="fas fa-chevron-left"></i> Previous</a>
                    
                    <div>
                        <a href="#" class="nav-button mark-button" style="margin-right: 15px;"><i class="fas fa-flag"></i> Mark for Review</a>
                        <a href="TestComplete.jsp" class="nav-button next-button">Next <i class="fas fa-chevron-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="sidebar-column">
            <div class="sidebar-area">
                
                <div class="navigator-card">
                    <h3>Question Navigator</h3>
                    <div class="question-grid">
                        <a href="#" class="q-button answered">1</a>
                        <a href="#" class="q-button answered marked">2</a>
                        <a href="#" class="q-button answered">3</a>
                        <a href="#" class="q-button">4</a>
                        <a href="#" class="q-button current">5</a>
                        <a href="#" class="q-button">6</a>
                        <a href="#" class="q-button">...</a>
                        <a href="#" class="q-button">50</a>
                    </div>
                </div>
                
                <div class="navigator-card">
                    <h3>Legend</h3>
                    <p style="font-size: 0.9em; margin-bottom: 5px;">
                        <span style="color: var(--primary-color);">Blue/Bold:</span> Current Question
                    </p>
                    <p style="font-size: 0.9em; margin-bottom: 5px;">
                        <span style="color: var(--success-color);">Green:</span> Answered
                    </p>
                    <p style="font-size: 0.9em; margin-bottom: 5px;">
                        <span style="color: var(--accent-color);">Yellow Border:</span> Marked for Review
                    </p>
                    <p style="font-size: 0.9em; margin-bottom: 0;">
                        <span style="color: var(--subtle-gray);">White:</span> Unanswered/Skipped
                    </p>
                </div>

            </div>
        </div>
    </div>
    
    <script>
        // Simple function to prevent accidental test submission
        function confirmEndTest() {
            if (confirm("Are you sure you want to end the test? You will not be able to resume.")) {
                // In a real application, you would submit the form/data here
                alert("Test submitted!");
                window.location.href = "results-page.html"; // Redirect to results
            }
        }
        
        // This JS is included for the sake of completeness, though a dedicated test page often hides the profile dropdown.
        function toggleDropdown() {
            document.getElementById("profileDropdown").classList.toggle("show");
        }
        window.onclick = function(event) {
            if (!event.target.matches('.profile-icon')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
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