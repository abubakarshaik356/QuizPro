<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Elite Certificate</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Poppins:wght@400;500&display=swap"
        rel="stylesheet">
    <style>
        :root {
            --navy: #0b1c2d;
            --gold: #d4af37;
            --gold-dark: #b8962e;
            --text-light: #f5f5f5;
            --muted-gold: rgba(212, 175, 55, 0.5);
            --primary-color: #0077B6;
            --accent-color: #FFB700;
        }

        body {
            background: #111;
            font-family: 'Poppins', sans-serif;
        }

        .elite-wrapper {
            display: flex;
            justify-content: center;
            padding: 50px;
        }

        .elite-certificate {
            width: 297mm;
            height: 210mm;

            background: linear-gradient(135deg, #0b1c2d, #020b14);
            border: 3mm solid var(--gold);

            padding: 18mm 22mm;
            box-sizing: border-box;

            position: relative;
            color: var(--text-light);

            /* Screen preview */
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.7);
        }


        /* Ribbon */
        .top-ribbon {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            background: var(--gold);
            color: #000;
            padding: 10px 40px;
            font-weight: 600;
            letter-spacing: 2px;
        }

        /* Header */
        .elite-header {
            text-align: center;
            margin-top: 20px;
        }

        /* Title */
        .elite-title {
            text-align: center;
            font-family: 'Cinzel', serif;
            font-size: 42px;
            margin: 35px 0 10px;
            color: var(--gold);
        }

        .subtitle {
            text-align: center;
            color: var(--muted-gold);
            font-size: 15px;
        }

        /* Name */
        .elite-name {
            text-align: center;
            font-size: 38px;
            margin: 25px 0;
            font-weight: 600;
            color: #fff;
            border-bottom: 3px solid var(--gold);
            display: inline-block;
            padding-bottom: 8px;
        }

        /* Course */
        .elite-course {
            text-align: center;
            font-size: 22px;
            color: var(--gold);
            margin: 15px 0;
        }

        /* Info */
        .elite-info {
            display: flex;
            justify-content: space-between;
            margin: 60px 120px;
        }

        .label {
            display: block;
            font-size: 13px;
            color: var(--muted-gold);
        }

        /* Footer */
        .elite-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            padding: 0 120px;
        }

        .elite-sign span {
            border-top: 2px solid var(--gold);
            padding-top: 6px;
        }

        /* Embossed Gold Seal */
        .elite-seal {
            width: 100px;
            height: 100px;
            background: radial-gradient(circle at top, #fff3b0, var(--gold-dark));
            border-radius: 50%;
            border: 6px solid var(--gold);
            box-shadow:
                inset 0 4px 8px rgba(255, 255, 255, 0.4),
                inset 0 -4px 8px rgba(0, 0, 0, 0.4),
                0 12px 30px rgba(0, 0, 0, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #3a2a00;
            font-weight: 700;
            text-align: center;
            font-size: 14px;
            position: relative;
            top: -25px;
        }

        .name-wrapper {
            text-align: center;
        }

        .logo {
            font-size: 2.5em;
            font-weight: 800;
            color: var(--primary-color);
            text-decoration: none;
        }

        .logo span {
            color: var(--accent-color);
        }

        @page {
            size: A4 landscape;
            margin: 0;
        }

        @media print {

            /* Hide everything */
            body * {
                visibility: hidden;
            }

            /* Show only certificate */
            .elite-certificate,
            .elite-certificate * {
                visibility: visible;
            }

            /* Position certificate perfectly */
            .elite-certificate {
                position: absolute;
                left: 0;
                top: 0;
                width: 297mm;
                height: 210mm;
                margin: 0;
                box-shadow: none;
            }
        }

        .btn-center {
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }

        .download-btn {
            background: linear-gradient(135deg, #f5d76e, #d4af37);
            color: #2b1b00;
            padding: 14px 32px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            letter-spacing: 0.5px;
            box-shadow:
                0 6px 18px rgba(212, 175, 55, 0.45),
                inset 0 1px 0 rgba(255, 255, 255, 0.5);
            transition: all 0.3s ease;
        }

        .download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 26px rgba(212, 175, 55, 0.6);
        }

        .download-btn:active {
            transform: scale(0.96);
        }
    </style>
</head>

<body>

    <div class="elite-wrapper">
        <div class="elite-certificate" id="eliteCertificate">

            <!-- Top Ribbon -->
            <div class="top-ribbon">ELITE CERTIFICATION</div>

            <!-- Logo -->
            <div class="elite-header">
                <a class="logo">Quiz<span>Pro</span></a>
            </div>

            <!-- Title -->
            <h1 class="elite-title">Certificate of Distinction</h1>

            <p class="subtitle">This prestigious certificate is awarded to</p>

            <!-- Name -->
            <div class="name-wrapper">
                <h2 class="elite-name">Shaik Abubakar Siddiq</h2>
            </div>


            <p class="subtitle">
                in recognition of exceptional performance and successful completion of
            </p>

            <h3 class="elite-course">Advanced Java Professional Assessment</h3>

            <!-- Details -->
            <div class="elite-info">
                <div>
                    <span class="label">Certificate ID</span>
                    <span>QP-ELITE-2025-8891</span>
                </div>
                <div>
                    <span class="label">Issued On</span>
                    <span>12 December 2025</span>
                </div>
            </div>

            <!-- Footer -->
            <div class="elite-footer">
                <div class="elite-sign">
                    <span>Director</span>
                </div>

                <!-- Embossed Seal -->
                <div class="elite-seal">
                    <span>Verified by QuizPro</span>
                </div>
            </div>

        </div>
    </div>
    <div class="btn-center">
        <button onclick="printCertificate()" class="download-btn">
            Download Certificate
        </button>
    </div>

    <script>
        function printCertificate() {
            window.print();
        }
    </script>

</body>

</html> --%>


<%@page import="com.quizpro.dto.Quizzes"%>
<%@page import="com.quizpro.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User user = (User) request.getAttribute("User");
	Quizzes quiz = (Quizzes) request.getAttribute("Quiz");
	String date = (String) request.getAttribute("Date");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Certificate of Mastery</title>

    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>

        /* ================= GLOBAL ================= */

        * {
            box-sizing: border-box;
            -webkit-print-color-adjust: exact !important;
            print-color-adjust: exact !important;
        }

        body {
            margin: 0;
            padding: 40px;
            background: #d0d0d0;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* ================= CERTIFICATE ================= */

        .certificate-container {
            width: 100%;
            max-width: 900px;
            background: #f7f4e4;
            border: 12px solid #c8a853;
            padding: 55px 65px;
            text-align: center;
        }

        /* LOGO */
        .logo {
            font-size: 50px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .logo-quiz { color: #2b6b7f; }
        .logo-pro { color: #d4a429; }

        /* TITLE */
        .certificate-title {
            font-family: 'Great Vibes', cursive;
            font-size: 70px;
            margin-bottom: 25px;
            font-weight: 400;
        }

        .certifies-text {
            font-size: 19px;
            margin-bottom: 2px;
        }

        /* NAME */
        .recipient-banner {
            display: inline-block;
            font-size: 35.8px;
            padding: 17px 70px;
            font-weight: 700;
            letter-spacing: 3px;
            margin-bottom: 8px;
        }

        .completion-text {
            font-size: 17px;
            margin-bottom: 10px;
        }

        .course-name {
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 4px;
            margin-bottom: 50px;
        }

        /* FOOTER */
        .certificate-footer {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        /* SEAL */
        .gold-seal {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: radial-gradient(circle, #f4d03f, #d4a429, #b8941f);
            display: flex;
            justify-content: center;
            align-items: center;
            border: 4px solid #c8a853;
        }

        .seal-text {
            color: white;
            font-weight: 700;
            font-size: 13px;
            text-align: center;
        }

        .award-details {
            text-align: left;
            font-size: 18px;
            flex: 1;
            padding-left: 35px;
        }

        .signature-section {
            text-align: right;
        }

        .signature {
            font-family: 'Great Vibes', cursive;
            font-size: 40px;
            color: #2b6b7f;
        }

        .signature-title {
            font-size: 16px;
        }

        /* ================= BUTTON ================= */

        .btn-center {
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }

        .download-btn {
            background: linear-gradient(135deg, #f5d76e, #d4af37);
            color: #2b1b00;
            padding: 14px 32px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 40px;
            cursor: pointer;
        }

        /* ================= PRINT SETTINGS ================= */

        /* @page {
            size: A4 landscape;
            margin: 0;
        }

        @media print {

            html {
                zoom: 1;
            }

            html, body {
                width: 257mm;
                height: 180mm;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background: none;
            }

            body {
                display: block !important;
                min-height: auto !important;
            }

            body * {
                visibility: hidden;
            }

            #elite-certificate,
            #elite-certificate * {
                visibility: visible;
            }

            #elite-certificate {
                position: absolute;
                left: 0;
                top: 0;

                width: 267mm;
                min-height: 170mm;
                max-height: 170mm;

                padding: 55px 65px;
                border: 12px solid #c8a853;
                background: #f7f4e4;

                page-break-inside: avoid;
                break-inside: avoid;

                box-shadow: none;
            }

            .btn-center {
                display: none !important;
            }
        } */
        @page {
    size: A4 landscape;
    margin: 0;
}

@media print {

    /* Reset page */
    html, body {
        width: 297mm;
        height: 210mm;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background: none;
    }

    /* Hide everything */
    body * {
        visibility: hidden;
    }

    /* Show ONLY certificate */
    #elite-certificate,
    #elite-certificate * {
        visibility: visible;
    }

    /* Lock certificate to one page */
    #elite-certificate {
       /*  position: absolute;
        left: 0;
        top: 0;

        width: 297mm;
        height: 210mm;
        box-sizing: border-box;

        padding: 55px 65px;
        border: 12px solid #c8a853;
        background: #f7f4e4; 

        page-break-inside: avoid;
        break-inside: avoid;

        box-shadow: none; */

        /* -webkit-print-color-adjust: exact;
        print-color-adjust: exact; */
    }

    /* Hide button */
    .btn-center {
        display: none !important;
    }
}
        
    </style>
</head>

<body>

    <!-- CERTIFICATE -->
    <div class="certificate-container" id="elite-certificate">

        <div class="logo">
            <span class="logo-quiz">Quiz</span><span class="logo-pro">Pro</span>
        </div>

        <div class="certificate-title">Certificate of Mastery</div>

        <div class="certifies-text">This certifies that</div>

        <div class="recipient-banner"><%= user.getName() %></div>

        <div class="completion-text">
            has successfully completed and mastered the specialized learning path in
        </div>

        <div class="course-name"><%= quiz.getTitle() %></div>

        <div class="certificate-footer">

            <div class="gold-seal">
                <div class="seal-text">QuizPro<br>Certified</div>
            </div>

            <div class="award-details">
                <p><strong>Awarded on:</strong> <%= date %></p>
                <p><strong>Unique Verification ID:</strong> QPM-DSML-2025-<%= user.getUserid() %></p>
            </div>

            <div class="signature-section">
                <div class="signature">Sandesh</div>
                <div class="signature-title">CEO, QuizPro</div>
            </div>

        </div>
    </div>

    <!-- BUTTON BELOW CERTIFICATE -->
    <div class="btn-center">
        <button onclick="window.print()" class="download-btn">
            Download Certificate
        </button>
    </div>

</body>
</html>


