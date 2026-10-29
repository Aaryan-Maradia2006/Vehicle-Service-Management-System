<%@ Page Title="My Services" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MyService.aspx.cs" Inherits="VehicleServiceManagementSystem.MyService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .service-page {
            min-height: 550px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .service-container {
            max-width: 1250px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,.08);
        }

        .service-title {
            background: #ed1233;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

            .service-title h2 {
                margin: 0 0 8px;
            }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .service-grid {
            width: 100%;
            border-collapse: collapse;
        }

            .service-grid th {
                background: #122f5c;
                color: white;
                padding: 12px;
                text-align: left;
                white-space: nowrap;
            }

            .service-grid td {
                padding: 12px;
                border: 1px solid #e5e9ef;
                white-space: nowrap;
            }

            .service-grid tr:nth-child(even) {
                background: #fff8f9;
            }

        .message {
            display: block;
            margin-top: 15px;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background: #122f5c;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

            <%
                if (Session["CustomerName"] != null)
                {
            %>

            <!-- Logged In User -->
            <div class="d-flex align-items-center">

                <div class="dropdown d-none d-lg-block">

                    <a class="btn btn-primary py-4 px-lg-4 dropdown-toggle"
                        href="#"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <i class="fa fa-user me-2"></i>
                        Account
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>
                            <a class="dropdown-item"
                                href="Profile.aspx">
                                <i class="fa fa-user me-2"></i>
                                Profile
                            </a>
                        </li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li>
                            <a class="dropdown-item"
                                href="ServiceHistory.aspx">
                                <i class="fa fa-history me-2"></i>
                                Service History
                            </a>
                        </li>

                        <li>
                            <hr class="dropdown-divider" />
                        </li>

                        <li>
                            <a class="dropdown-item"
                                href="Logout.aspx">
                                <i class="fa fa-sign-out-alt me-2"></i>
                                Logout
                            </a>
                        </li>

                    </ul>

                </div>

            </div>

            <%
                }
                else
                {
            %>

            <!-- Not Logged In -->
            <div class="dropdown d-none d-lg-block">

                <a class="btn btn-primary py-4 px-lg-5 dropdown-toggle"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false">Register & Login
                </a>

                <ul class="dropdown-menu dropdown-menu-end">

                    <li>
                        <a class="dropdown-item"
                            href="Registration.aspx">Register
                        </a>
                    </li>

                    <li>
                        <a class="dropdown-item"
                            href="Login.aspx">Login
                        </a>
                    </li>

                </ul>

            </div>

            <%
                }
            %>
        </div>
    </nav>
    <!-- Navbar End -->
    <div class="service-page">
        <div class="service-container">

            <div class="service-title">
                <h2>View My Service</h2>
                <p>View your service bookings and current status.</p>
            </div>

            <div class="table-wrap">
                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="service-grid"
                    EmptyDataText="You have no service bookings yet.">

                    <Columns>
                        <asp:BoundField DataField="ServiceHistoryId" HeaderText="Service ID" />
                        <asp:BoundField DataField="VehicleNumber" HeaderText="Vehicle Number" />
                        <asp:BoundField DataField="VehicleBrand" HeaderText="Vehicle Brand" />
                        <asp:BoundField DataField="VehicleModel" HeaderText="Vehicle Model" />
                        <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                        <asp:BoundField DataField="BookingDate" HeaderText="Service Date" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="₹{0:0.00}" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

            <a href="Profile.aspx" class="back-button">Back to My Profile</a>

        </div>
    </div>
                    <!-- Footer Start -->
                <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="container py-5">
                        <div class="row g-5">
                            <div class="col-lg-3 col-md-6">
                                <h4 class="text-light mb-4">Address</h4>
                                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Gayatri Nagar, Bhakti Nagar, Rajkot, Gujarat 360002</p>
                                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                                <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                                <div class="d-flex pt-2">
                                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
