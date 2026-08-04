<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="service.aspx.cs" Inherits="VehicleServiceManagementSystem.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>CarServ - Car Repair HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@600;700&family=Ubuntu:wght@400;500&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Topbar Start -->
        <div class="container-fluid bg-light p-0">
            <div class="row gx-0 d-none d-lg-flex">
                <div class="col-lg-7 px-5 text-start">
                    <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                        <small class="fa fa-map-marker-alt text-primary me-2"></small>
                        <small>123 Street, New York, USA</small>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center py-3">
                        <small class="far fa-clock text-primary me-2"></small>
                        <small>Mon - Fri : 09.00 AM - 09.00 PM</small>
                    </div>
                </div>
                <div class="col-lg-5 px-5 text-end">
                    <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                        <small class="fa fa-phone-alt text-primary me-2"></small>
                        <small>+012 345 6789</small>
                    </div>
                    <div class="h-100 d-inline-flex align-items-center">
                        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-sm-square bg-white text-primary me-0" href=""><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <h2 class="m-0 text-primary"><i class="fa fa-car me-3"></i>CarServ</h2>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="Default.aspx" class="nav-item nav-link active">Home</a>
                    <a href="about.aspx" class="nav-item nav-link">About</a>
                    <a href="service.aspx" class="nav-item nav-link">Service</a>
                    <a href="team.aspx" class="nav-item nav-link">Technician</a>
                    <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                </div>

            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-2.jpg);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Services</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Services</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Service Start -->
        <div class="container-xxl service py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="text-primary text-uppercase">// Our Services //</h6>
                    <h1 class="mb-5">Explore Our Services</h1>
                </div>
                <div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="col-lg-4">
                        <div class="nav w-100 nav-pills me-4">
                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4 active" 
                                data-bs-toggle="pill" data-bs-target="#tab-pane-1" type="button">
                                <i class="fa fa-car-side fa-2x me-3"></i>
                                <h4 class="m-0">Diagnostic Test</h4>
                            </button>
                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4" 
                                data-bs-toggle="pill" data-bs-target="#tab-pane-2" type="button">
                                <i class="fa fa-car fa-2x me-3"></i>
                                <h4 class="m-0">Engine Servicing</h4>
                            </button>
                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4" 
                                data-bs-toggle="pill" data-bs-target="#tab-pane-3" type="button">
                                <i class="fa fa-cog fa-2x me-3"></i>
                                <h4 class="m-0">Tires Replacement</h4>
                            </button>
                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4" 
                                data-bs-toggle="pill" data-bs-target="#tab-pane-4" type="button">
                                <i class="fa fa-oil-can fa-2x me-3"></i>
                                <h4 class="m-0">Oil Changing</h4>
                            </button>
                            
                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
                                data-bs-toggle="pill" data-bs-target="#tab-pane-5" type="button">
                                <i class="fa fa-car-battery fa-2x me-3"></i>
                                <h4 class="m-0">Battery Replacement</h4>
                            </button>

                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
                                data-bs-toggle="pill" data-bs-target="#tab-pane-6" type="button">
                                <i class="fa fa-snowflake fa-2x me-3"></i>
                                <h4 class="m-0">AC Repair & Service</h4>
                            </button>

                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
                                data-bs-toggle="pill" data-bs-target="#tab-pane-7" type="button">
                                <i class="fa fa-stop-circle fa-2x me-3"></i>
                                <h4 class="m-0">Brake Repair</h4>
                            </button>

                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-4"
                                data-bs-toggle="pill" data-bs-target="#tab-pane-8" type="button">
                                <i class="fa fa-cogs fa-2x me-3"></i>
                                <h4 class="m-0">Wheel Alignment</h4>
                            </button>

                            <button class="nav-link w-100 d-flex align-items-center text-start p-4 mb-0"
                                data-bs-toggle="pill" data-bs-target="#tab-pane-9" type="button">
                                <i class="fa fa-soap fa-2x me-3"></i>
                                <h4 class="m-0">Car Washing</h4>
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="tab-content w-100">

                            <%-- Diagnostic Test --%>
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100" src="img/service-D.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Diagnostic Test</h3>
                                        <p class="mb-4">We perform advanced vehicle diagnostics to identify engine, electrical and performance issues quickly and accurately.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Engine Diagnostics</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Electrical System Check</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Computerized Fault Detection</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <%-- Engine Servicing --%>
                            <div class="tab-pane fade" id="tab-pane-2">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100" src="img/service-E.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Engine Servicing</h3>
                                        <p class="mb-4">Complete engine inspection and servicing to improve vehicle performance, fuel efficiency and engine life.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Engine Oil Inspection</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Engine Performance Check</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Complete Engine Maintenance</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <%-- Tires Replacement --%>
                            <div class="tab-pane fade" id="tab-pane-3">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100" src="img/service-T.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Tires Replacement</h3>
                                        <p class="mb-4">We provide quality tire replacement services with proper wheel balancing for a smooth and safe driving experience.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Premium Tire Installation</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Wheel Balancing</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Tire Pressure Check</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <%-- Oil Changing --%>
                            <div class="tab-pane fade" id="tab-pane-4">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100" src="img/service-O.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Oil Changing</h3>
                                        <p class="mb-4">Keep your engine healthy with high-quality engine oil replacement and complete lubrication service.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Premium Engine Oil</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Oil Filter Replacement</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Engine Lubrications</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <!-- Battery Replacement -->
                            <div class="tab-pane fade" id="tab-pane-5">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100"
                                                src="img/service-B.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Battery Replacement</h3>
                                        <p class="mb-4">We provide quick battery testing and replacement using high-quality batteries for all vehicle types.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Battery Testing</p>
                                        <p><i class="fa fa-check text-success me-3"></i>New Battery Installation</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Warranty Support</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <!-- AC Repair -->
                            <div class="tab-pane fade" id="tab-pane-6">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100"
                                                src="img/service-A.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional AC Repair & Service</h3>
                                        <p class="mb-4">Complete air conditioning inspection, gas refilling, cooling system repair and maintenance.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Cooling Check</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Gas Refilling</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Leak Detection</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <!-- Brake Repair -->
                            <div class="tab-pane fade" id="tab-pane-7">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100"
                                                src="img/service-BR.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Brake Repair</h3>
                                        <p class="mb-4">Inspection and replacement of brake pads, discs and brake fluid for maximum safety.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Brake Pad Replacement</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Brake Oil Check</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Disc Inspection</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <!-- Wheel Alignment -->
                            <div class="tab-pane fade" id="tab-pane-8">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100"
                                                src="img/service-W.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Wheel Alignment</h3>
                                        <p class="mb-4">Improve vehicle stability and tire life with accurate wheel alignment services.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Wheel Balancing</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Alignment Check</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Tire Inspection</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                            <!-- Car Washing -->
                            <div class="tab-pane fade" id="tab-pane-9">
                                <div class="row g-4">
                                    <div class="col-md-6" style="min-height: 350px;">
                                        <div class="position-relative h-100">
                                            <img class="position-absolute img-fluid w-100 h-100"
                                                src="img/service-CW.jpg"
                                                style="object-fit: cover;" alt="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3 class="mb-3">Professional Car Washing & Detailing</h3>
                                        <p class="mb-4">Complete interior and exterior cleaning to keep your vehicle looking brand new.</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Exterior Wash</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Interior Cleaning</p>
                                        <p><i class="fa fa-check text-success me-3"></i>Polishing</p>
                                        <a href="Booking.aspx" class="btn btn-primary py-3 px-5 mt-3">Book now<i class="fa fa-arrow-right ms-3"></i></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Address</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Opening Hours</h4>
                        <h6 class="text-light">Monday - Friday:</h6>
                        <p class="mb-4">09.00 AM - 09.00 PM</p>
                        <h6 class="text-light">Saturday - Sunday:</h6>
                        <p class="mb-0">09.00 AM - 12.00 PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Services</h4>
                        <a class="btn btn-link" href="">Diagnostic Test</a>
                        <a class="btn btn-link" href="">Engine Servicing</a>
                        <a class="btn btn-link" href="">Tires Replacement</a>
                        <a class="btn btn-link" href="">Oil Changing</a>
                        <a class="btn btn-link" href="">Vacuam Cleaning</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-light mb-4">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">CarServ</a>, All Right Reserved.

                        <!--/*** The author’s attribution link below must remain intact on your website. ***/-->
                            <!--/*** If you wish to remove this credit link, please purchase the Pro Version from https://htmlcodex.com . ***/-->
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">Aryan Maradiya & Bhavin Gadhiya</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

    </html>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
