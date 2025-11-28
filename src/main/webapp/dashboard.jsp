<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuizPro - Member Home (Dashboard)</title>
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

h2 {
	font-size: 1.8em;
	font-weight: 800;
	margin-bottom: 20px;
	color: var(--light-text);
	text-align: left;
}

h3 {
	font-size: 1.2em;
	font-weight: 700;
	margin-top: 0;
}

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

/* --- Profile Dropdown CSS FIX --- */
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
	/* Initially hidden - JS will toggle 'show' class */
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

/* CSS to display the dropdown when JS adds the 'show' class */
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

/* --- END FIX --- */

/* --- Dashboard Layout --- */
.dashboard-grid {
	display: grid;
	grid-template-columns: 1fr;
	gap: 30px;
	padding: 40px 0;
}

.section {
	margin-bottom: 30px;
}

/* --- Banner --- */
.action-banner {
	background: linear-gradient(90deg, var(--primary-color) 0%, #0099D4 100%);
	color: white;
	padding: 35px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.action-banner h1 {
	font-size: 2.2em;
	margin: 0;
	font-weight: 800;
}

.action-banner p {
	font-size: 1.1em;
	opacity: 0.9;
	margin: 5px 0 0 0;
}

.cta-button {
	display: inline-block;
	background-color: var(--accent-color);
	color: #1A1A1A;
	padding: 12px 25px;
	border-radius: 8px;
	text-decoration: none;
	font-weight: 700;
	font-size: 1em;
	transition: opacity 0.2s, transform 0.2s;
}

.cta-button:hover {
	opacity: 0.9;
	transform: translateY(-1px);
}

/* --- Categories --- */
.category-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	gap: 20px;
	margin-top: 20px;
}

.category-card {
	background-color: var(--card-bg);
	padding: 25px 15px;
	border-radius: 8px;
	text-align: center;
	cursor: pointer;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	transition: background-color 0.3s, transform 0.3s;
	border: 1px solid #E0E0E0;
}

.category-card:hover {
	background-color: var(--primary-color);
	color: var(--card-bg);
	transform: translateY(-5px);
}

.category-card:hover h3 {
	color: var(--card-bg);
}

.category-card:hover .icon {
	color: var(--accent-color);
}

.category-card .icon {
	font-size: 2.5em;
	margin-bottom: 10px;
	color: var(--primary-color);
}

/* --- My Tests/Recents --- */
.test-list {
	list-style: none;
	padding: 0;
}

.test-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: var(--card-bg);
	padding: 15px 20px;
	margin-bottom: 10px;
	border-radius: 8px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.test-item span {
	font-weight: 600;
	color: var(--primary-color);
}

.test-item small {
	color: var(--subtle-gray);
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.navbar .nav-links {
		display: none;
	}
	.action-banner {
		flex-direction: column;
		align-items: flex-start;
		text-align: left;
	}
	.action-banner .cta-button {
		margin-top: 20px;
		width: 100%;
		text-align: center;
	}
	.category-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

.path-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
}

.path-card {
	background-color: var(--card-bg);
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	text-align: left;
	border-top: 5px solid var(--primary-color);
}

.path-card p {
	color: var(--subtle-gray);
	min-height: 40px;
	/* Ensures card height uniformity */
}

.progress-bar-container {
	margin-top: 10px;
	background-color: #e9ecef;
	border-radius: 5px;
	height: 10px;
	overflow: hidden;
}

.progress-bar {
	height: 100%;
	background-color: var(--primary-color);
	border-radius: 5px;
	transition: width 0.5s;
}

/* FAQ Styling */
.faq-list {
	max-width: 900px;
	margin: 0 auto;
	text-align: left;
}

.faq-item {
	background: var(--card-bg);
	margin-bottom: 10px;
	border-radius: 8px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.05);
}

.faq-item summary {
	padding: 18px;
	font-weight: 600;
	color: var(--primary-color);
	cursor: pointer;
	border-bottom: 1px solid #eee;
}

.faq-item p {
	padding: 15px 18px;
	color: var(--subtle-gray);
}

/* Blog Styling */
#blog {
	margin-top: 0;
	padding: 40px 0;
}

.blog-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
	margin-top: 30px;
	padding: auto;
}

.blog-post-card {
	background-color: var(--dark-bg);
	border-radius: 10px;
	overflow: hidden;
	text-align: left;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	transition: transform 0.2s;
}

.blog-post-card:hover {
	transform: translateY(-5px);
}

.blog-post-card img {
	width: 100%;
	height: 200px;
	display: block;
}

.blog-post-card h3, .blog-post-card small, .blog-post-card .read-more {
	padding: 0 15px;
	display: block;
}

.blog-post-card h3 {
	margin-top: 15px;
	margin-bottom: 5px;
	font-size: 1.3em;
}

.blog-post-card .read-more {
	padding-bottom: 15px;
	font-weight: 600;
	color: var(--accent-color);
	text-decoration: none;
}

/* --- Support Banner Styling (Merged Contact Section) --- */
.support-banner {
	background-color: #1A1A1A;
	/* Very dark background for high contrast */
	color: white;
	padding: 10px 0;
	text-align: center;
	margin-bottom: 0;
}

.support-title {
	color: white;
	margin-bottom: 10px;
}

.support-subtitle {
	color: #A9A9A9;
	margin-bottom: 30px;
}

.support-form-container {
	max-width: 600px;
	margin: 0 auto;
	display: flex;
	gap: 20px;
	align-items: center;
	justify-content: center;
}

.support-input {
	padding: 14px 15px;
	border: none;
	border-radius: 8px;
	flex-grow: 1;
	font-size: 1em;
	min-width: 250px;
}

.support-button {
	/* Uses existing cta-button styles */
	background-color: var(--accent-color) !important;
	color: var(--light-text) !important;
	padding: 14px 25px !important;
	font-weight: 700;
	border-radius: 8px;
	text-decoration: none;
	transition: opacity 0.2s;
}

.support-button:hover {
	opacity: 0.9;
}

.support-links {
	margin-top: 25px;
	font-size: 0.95em;
}

.knowledge-base-link {
	color: var(--accent-color);
	text-decoration: none;
	font-weight: 600;
	transition: color 0.2s;
}

.knowledge-base-link:hover {
	color: #FFCF40;
	/* Lighter gold on hover */
}

.phone-number {
	color: #A9A9A9;
}

/* --- Footer Styling --- */
.footer {
	background-color: #0d0d1a;
	/* Slightly lighter dark color for distinction */
	color: #A9A9A9;
	margin-top: 0;
	padding: 20px 0;
	font-size: 0.9em;
	text-align: center;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.footer-copyright a {
	color: #A9A9A9;
	margin: 0 10px;
	text-decoration: none;
	transition: color 0.2s;
}

.footer-copyright a:hover {
	color: var(--accent-color);
}
</style>
</head>

<body>
	<%
	String name = (String) session.getAttribute("name");
	%>
	<header class="navbar">
		<div class="container">
			<a href="dashboard.html" class="logo">Quiz<span>Pro</span></a>

			<div class="nav-links">
				<a href="#" class="active"><i class="fas fa-home"></i> Home</a> <a
					href="#categories"><i class="fas fa-list-ul"></i> Categories</a> <a href="#my-tests"><i class="fas fa-history"></i>
					My Tests</a>
			</div>

			<div class="profile-menu">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwJgi2tfPov2vnIRkuxgRw_gHSqt_uRGbrdA&s"
					alt="User Avatar" class="profile-icon" id="profileIcon"
					onclick="toggleDropdown()">
				<div class="dropdown-content" id="profileDropdown">
					<a href="#"><i class="fas fa-user-circle"></i> Profile</a> <a
						href="login.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
				</div>
			</div>
		</div>
	</header>

	<div class="container dashboard-grid">

		<div class="section">
			<div class="action-banner">
				<div>
					<h1>
						Welcome back,
						<%=name%>! 👋
					</h1>
					<p>Continue your progress and explore new expert challenges
						today.</p>
				</div>
				<a href="#" class="cta-button">View My Profile</a>
			</div>
		</div>

		<div class="section" id="my-tests">
			<h2>
				<i class="fas fa-history"></i> My Recent Activity
			</h2>
			<ul class="test-list">
				<li class="test-item">
					<div>
						<p>
							<strong>Cloud Security Compliance - AWS</strong>
						</p>
						<small>Status: Completed</small>
					</div> <span>85% Accuracy</span>
				</li>
				<li class="test-item">
					<div>
						<p>
							<strong>Financial Modeling in Python</strong>
						</p>
						<small>Status: In Progress</small>
					</div> <span><a href="#"
						style="color: var(--accent-color); text-decoration: none;">Resume
							Test</a></span>
				</li>
				<li class="test-item">
					<div>
						<p>
							<strong>Advanced JavaScript Frameworks</strong>
						</p>
						<small>Status: Completed</small>
					</div> <span>92% Accuracy</span>
				</li>
			</ul>
		</div>

		<div class="section" id="categories">
			<h2>
				<i class="fas fa-list-alt"></i> Explore Top Categories
			</h2>
			<div class="category-grid">
				<div class="category-card">
					<i class="fas fa-code icon"></i>
					<h3>Software Engineering</h3>
				</div>
				<div class="category-card">
					<i class="fas fa-flask icon"></i>
					<h3>Data Science & AI</h3>
				</div>
				<div class="category-card">
					<i class="fas fa-building icon"></i>
					<h3>Financial Analysis</h3>
				</div>
				<div class="category-card">
					<i class="fas fa-shield-alt icon"></i>
					<h3>Cybersecurity</h3>
				</div>
				<div class="category-card">
					<i class="fas fa-globe icon"></i>
					<h3>Global Economics</h3>
				</div>
				<div class="category-card">
					<i class="fas fa-database icon"></i>
					<h3>Cloud Infrastructure</h3>
				</div>
			</div>
		</div>
				<section class="section" id="faq"
			style="background-color: var(--dark-bg);">
			<div class="container">
				<h2 style="text-align: center;">
					<i class="fas fa-question-circle"></i> Frequently Asked Questions
				</h2>
				<div class="faq-list">
					<details class="faq-item">
						<summary>How often is the quiz content updated?</summary>
						<p>Our quizzes are reviewed and updated weekly by subject
							matter experts to ensure alignment with the latest industry
							standards and certification requirements.</p>
					</details>
					<details class="faq-item">
						<summary>Can I earn verifiable certificates?</summary>
						<p>Yes. Upon achieving a mastery score of 80% or higher in
							certain specialized learning paths, you will receive a digital
							certificate for your professional profile.</p>
					</details>
					<details class="faq-item">
						<summary>Is there a cost to use QuizPro?</summary>
						<p>We offer a generous free trial with access to introductory
							quizzes. Full access to specialized paths and analytics requires
							a paid subscription.</p>
					</details>
				</div>
			</div>
		</section>

		<section class="section" id="blog"
			style="background-color: var(--card-bg);">
			<div class="container">
				<h2 style="text-align: center;">
					<i class="fas fa-lightbulb"></i> Latest Industry Insights
				</h2>
				<div class="blog-grid">
					<div class="blog-post-card">
						<img
							src="https://www.brainvire.com/blog/wp-content/uploads/2024/09/AI-In-Cloud-Computing-Is-Bringing-Efficiency-And-Scalability.webp"
							alt="Article Thumbnail">
						<h3 style="color: var(--primary-color);">The Future of AI in
							Cloud Computing</h3>
						<small style="color: var(--subtle-gray);">May 15, 2025 | 7
							min read</small> <a href="#" class="read-more">Read More →</a>
					</div>
					<div class="blog-post-card">
						<img
							src="https://www.rogersoft.com/storage/attachments/1694676692.jpg"
							alt="Article Thumbnail">
						<h3 style="color: var(--primary-color);">5 Essential SQL
							Tricks for Data Analysts</h3>
						<small style="color: var(--subtle-gray);">May 8, 2025 | 5
							min read</small> <a href="#" class="read-more">Read More →</a>
					</div>
					<div class="blog-post-card">
						<img
							src="https://www.cfoselections.com/hs-fs/hubfs/Images-CFOS/Building-a-3-Year-Financial-Model.jpeg?width=563&height=375&name=Building-a-3-Year-Financial-Model.jpeg"
							alt="Article Thumbnail">
						<h3 style="color: var(--primary-color);">Mastering Financial
							Modeling in Q3 2025</h3>
						<small style="color: var(--subtle-gray);">May 1, 2025 | 10
							min read</small> <a href="#" class="read-more">Read More →</a>
					</div>
				</div>
			</div>
		</section>

	</div>
	<section class="support-banner section">
		<div class="container">
			<h2 class="support-title">
				<i class="fas fa-headset"></i> Need Help?
			</h2>
			<p class="support-subtitle">Reach out to our professional support
				team for assistance.</p>

			<div class="support-form-container">
				<input type="email" placeholder="Enter your email"
					class="support-input"> <a href="#"
					class="cta-button support-button">Get Support</a>
			</div>

			<p class="support-links">
				<a href="#" class="knowledge-base-link">Visit our Knowledge Base</a>
				| <span class="phone-number">Call us at: (555) 123-4567</span>
			</p>
		</div>
	</section>

	<footer class="footer">
		<div class="container">
			<p class="footer-copyright">
				&copy; 2025 QuizPro. All Rights Reserved. | <a href="#">Legal</a> |
				<a href="#">Privacy</a> | <a href="#">Careers</a>
			</p>
		</div>
	</footer>

	<script>
		function toggleDropdown() {
			// Toggles the 'show' class on the dropdown content
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