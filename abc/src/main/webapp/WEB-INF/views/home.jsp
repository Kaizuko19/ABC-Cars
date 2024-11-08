<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ABC CARS | HOME</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@40,600,0,0" />

<link href="/css/home.css"  rel="stylesheet">
<script src="/js/home.js"></script>

</head>
<body>

<!-- 
    - #HEADER
  -->
  <div class="container">
    <header class="header">
      <a href="#" class="logo">
        <img src="/images/home/ABC.png" width="128" height="200"  style="height: 200px; width: auto;">
      </a>

      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li>
            <a href="#" class="navbar-link">Home</a>
          </li>

          <li>
            <a href="/register_user" class="navbar-link">Register</a>
          </li>

          <li>
            <a href="login" class="navbar-link">Login</a>
          </li>
        </ul>
      </nav>
    </header>
  </div>
  


  <main>
    <article>
    <div class="intro-content">
      <div class="container"></div>
        <section class="has-bg-image" aria-label="home" style="background-image: url('/images/home/homebg.png')">
        
            <h1 class="h1 section-title" style="color: #e5e5e5;">Explore Our Inventory of Used Cars</h1>

            <p class="section-text">
              Welcome to ABC Cars Pte Ltd, your premier destination for finding quality used cars. Whether you're in search of a reliable sedan, a spacious SUV, or a sporty coupe, we've got you covered. Register now to start browsing our extensive inventory.
            </p>

            <a href="register_user" class="btn">
              <span class="span">Join Now!</span>

              <span class="material-symbols-rounded">arrow_forward</span>
            </a>

        </section>
      </div>
    </div>




      <!-- 
        - #SERVICE
      -->

      <section class="service">
          <h2 class="h2 section-title">Discover Our Wide Range of Services for Your Vehicle</h2>

          <ul class="service-list">

            <li>
              <div class="service-card">

                <h3 class="h3 card-title">Car Listings</h3>

                <p class="card-text">
                  Browse our extensive collection of quality used cars from various makes and models.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <h3 class="h3 card-title">Search Filters</h3>

                <p class="card-text">
                  Refine your search based on make, model, registration, and price range to find your ideal car.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <h3 class="h3 card-title">User Registration</h3>

                <p class="card-text">
            	  Register on our portal to access exclusive features such as saving favorite listings and receiving notifications.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <h3 class="h3 card-title">User Authentication</h3>

                <p class="card-text">
                  Securely log in to your account to manage your car listings and preferences.
                </p>

              </div>
            </li>

            <li>
              <div class="service-card">

                <h3 class="h3 card-title">Sell Your Car</h3>

                <p class="card-text">
                  Ready to sell your car? List it on our portal and reach potential buyers quickly.
                </p>

              </div>
            </li>

          </ul>

      </section>





      <!-- 
        - #ABOUT
      -->

      <section class="about">
        <div class="container">

          <div class="about-content">

            <p class="section-subtitle :dark">About ABC Cars Pte Ltd</p>

            <h2 class="h2 section-title">Your Trusted Destination for Used Car Sales</h2>

            <p class="section-text">
              ABC Cars Pte Ltd is committed to providing you with the best platform for buying and selling used cars. Our
		      portal offers a seamless experience, allowing users to register, search for cars by make, model, registration,
		      and price range, and connect with potential buyers or sellers.
            </p>

            <p class="section-text">
        We prioritize quality and customer satisfaction in every transaction. With over 
            </p>

            <ul class="about-list">

              <li class="about-item">
                <p>
                  <strong class="display-1 strong">8K+</strong> Happy Clients
                </p>
              </li>

              <li class="about-item">
                <p>
                  <strong class="display-1 strong">22K+</strong> Cars Sold
                </p>
              </li>

              <li class="about-item">
                <p>
                  <strong class="display-1 strong">50+</strong> Years in market
                </p>
              </li>

              <li class="about-item">
                <p>
                  <strong class="display-1 strong">99%</strong> Project Completion Rate
                </p>
              </li>

            </ul>

          </div>

        </div>
      </section>

  <!-- 
    - #FOOTER
  -->

  <footer class="footer">


      <div class="container-footer">

        <div class="footer-brand">

          <p class="footer-text">
             Welcome to ABC Cars Pte Ltd, your trusted portal for buying and selling used cars. We are committed to providing quality services to our customers.
          </p>

          <ul class="social-list">

            <li>
              <a href="#" class="social-link">
                <img src="/images/home/facebook.svg" alt="facebook">
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <img src="/images/home/instagram.svg" alt="instagram">
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <img src="/images/home/twitter.svg" alt="twitter">
              </a>
            </li>

          </ul>

        </div>

        <ul class="footer-list">

          <li>
            <p class="h3">Opening Hours</p>
          </li>

          <li>
            <p class="p">Monday &ndash; Saturday</p>

            <span class="span">9:00 AM &ndash; 6:00 PM</span>
          </li>

          <li>
            <p class="p">Sunday</p>

            <span class="span">Closed</span>
          </li>

          

        </ul>

        <ul class="footer-list">

          <li>
            <p class="h3">Contact Info</p>
          </li>

          <li>
            <a href="tel:+01234567890" class="footer-link">
              <span class="material-symbols-rounded">call</span>

              <span class="span">+01 2 3456 7890</span>
            </a>
          </li>

          <li>
            <a href="mailto:info@autofix.com" class="footer-link">
              <span class="material-symbols-rounded">mail</span>

              <span class="span">info@abccars.com</span>
            </a>
          </li>

          <li>
            <address class="footer-link address">
              <span class="material-symbols-rounded">location_on</span>

              <span class="span">21 King Street Melbourne, 3000, Australia</span>
            </address>
          </li>

        </ul>

      </div>




  </footer>

















</body>
</html>