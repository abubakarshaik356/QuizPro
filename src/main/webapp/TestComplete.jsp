<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #0077B6; 
            --accent-color: #FFB700; 
            --dark-bg: #F0F2F5; 
            --light-text: #212529; 
            --card-bg: #FFFFFF; 
            --success-color: #28a745;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
            --shadow-strong: rgba(0, 0, 0, 0.15);
        }

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--dark-bg);
            color: var(--light-text);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .result-container {
            width: 90%;
            max-width: 700px;
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px var(--shadow-strong);
            text-align: center;
        }

        /* Result Status Box */
        .status-box {
            padding: 25px;
            border-radius: 8px;
            margin-bottom: 30px;
            color: white;
        }

        .status-box h1 {
            font-weight: 800;
            margin-top: 0;
            font-size: 2.5em;
        }
        
        /* Pass Styles */
        .status-pass {
            background-color: var(--success-color);
        }
        
        /* Fail Styles */
        .status-fail {
            background-color: var(--danger-color);
        }

        /* Score Details */
        .score-details {
            display: flex;
            justify-content: space-around;
            margin: 20px 0 40px;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
            padding: 20px 0;
        }

        .metric {
            text-align: center;
        }

        .metric strong {
            display: block;
            font-size: 2.5em;
            font-weight: 800;
            color: var(--primary-color);
            margin-bottom: 5px;
        }

        .metric span {
            color: var(--subtle-gray);
            font-weight: 600;
            font-size: 0.9em;
        }

        /* Certificate Button */
        .certificate-btn {
            display: inline-block;
            background-color: var(--accent-color);
            color: var(--light-text); 
            padding: 15px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 700;
            margin-top: 20px;
            transition: background-color 0.3s, transform 0.1s;
        }
        .certificate-btn:hover {
            background-color: #ffc830;
            transform: translateY(-2px);
        }
        .certificate-btn i {
            margin-right: 10px;
        }
        
        /* Action Buttons */
        .action-links {
            margin-top: 30px;
        }
        .action-links a {
            color: var(--info-color);
            text-decoration: none;
            margin: 0 15px;
            font-weight: 600;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="result-container">
        
        <div class="status-box" id="statusBox">
            </div>

        <h2 style="color: var(--primary-color); margin-bottom: 30px;"><i class="fas fa-clipboard-list"></i> Quiz: <span id="quizName">Loading Quiz...</span></h2>
        
        <div class="score-details">
            <div class="metric">
                <strong><span id="finalScore">--</span>%</strong>
                <span>Final Score</span>
            </div>
            <div class="metric">
                <strong><span id="questionsCorrect">--</span>/<span id="questionsTotal">--</span></strong>
                <span>Questions Correct</span>
            </div>
            <div class="metric">
                <strong><span id="timeTaken">--</span> min</strong>
                <span>Time Taken</span>
            </div>
        </div>
        
        <div id="certificateArea">
            </div>

        <div class="action-links">
            <a href="quiz-dashboard.html"><i class="fas fa-home"></i> Back to Dashboard</a>
            <a href="#"><i class="fas fa-share-alt"></i> Share Result</a>
        </div>
        
    </div>

    <script>
        // --- Data Extraction and Processing ---
        document.addEventListener('DOMContentLoaded', function() {
            const params = new URLSearchParams(window.location.search);
            
            // --- Simulated/Passed Data from Submission ---
            const score = parseInt(params.get('score')) || 0; 
            const total = parseInt(params.get('total')) || 10; 
            // 'status' should be 'pass' or anything else (which defaults to fail)
            const passStatus = params.get('status') === 'pass'; 
            const quizId = params.get('quizId') || 'QZ001'; 
            const time = params.get('time') || '15'; 

            // --- Elements ---
            const statusBox = document.getElementById('statusBox');
            const finalScoreElement = document.getElementById('finalScore');
            const questionsCorrectElement = document.getElementById('questionsCorrect');
            const questionsTotalElement = document.getElementById('questionsTotal');
            const timeTakenElement = document.getElementById('timeTaken');
            const quizNameElement = document.getElementById('quizName');
            const certificateArea = document.getElementById('certificateArea');

            // --- Calculation & Display ---
            const scorePercentage = total > 0 ? Math.round((score / total) * 100) : 0;
            // Simulated lookup for quiz title
            const quizName = quizId === 'QZ001' ? 'Python Fundamentals Assessment' : 'Quiz Result'; 

            quizNameElement.textContent = quizName;
            questionsCorrectElement.textContent = score;
            questionsTotalElement.textContent = total;
            finalScoreElement.textContent = scorePercentage;
            timeTakenElement.textContent = time;

            if (passStatus) {
                // Passed State 🏆
                statusBox.classList.add('status-pass');
                statusBox.innerHTML = `
                    <i class="fas fa-trophy fa-2x"></i>
                    <h1>Congratulations!</h1>
                    <p>You successfully passed the ${quizName} assessment.</p>
                `;
                
                // Add Certificate Button linking to the generator page
                certificateArea.innerHTML = `
                    <a href="generateCertificate.jsp?quizId=${quizId}&userId=current_user" class="certificate-btn">
                        <i class="fas fa-download"></i> Download Your Certificate
                    </a>
                `;

            } else {
                // Failed State ❌
                statusBox.classList.add('status-fail');
                statusBox.innerHTML = `
                    <i class="fas fa-times-circle fa-2x"></i>
                    <h1>Try Again!</h1>
                    <p>You did not meet the minimum passing requirement. Don't give up!</p>
                `;
                
                // Add Retry Button
                certificateArea.innerHTML = `
                    <a href="quiz-start.html?quizId=${quizId}" class="certificate-btn" style="background-color: var(--info-color); color: white;">
                        <i class="fas fa-redo"></i> Review and Retake Quiz
                    </a>
                `;
            }
        });

        // --- Example of how to call this page after a submission (for testing) ---
        // To simulate a PASS, navigate to this URL:
        // quiz-result.html?quizId=QZ001&score=9&total=10&status=pass&time=12
        //
        // To simulate a FAIL, navigate to this URL:
        // quiz-result.html?quizId=QZ001&score=5&total=10&status=fail&time=18
    </script>

</body>
</html>