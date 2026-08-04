<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="VehicleServiceManagementSystem.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        </div>
    </nav>
    <!-- Navbar End -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container py-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white text-center">
                <h2>Vehicle Service Booking</h2>
            </div>
            <div class="card-body">
                <table class="table table-borderless">
                    <tr>
                        <td><b>Customer Name</b></td>
                        <td>
                            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td><b>Mobile Number</b></td>
                        <td>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Email</b></td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td><b>Vehicle Number</b></td>
                        <td>
                            <asp:TextBox ID="txtVehicleNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Vehicle Brand</b></td>
                        <td>
                            <asp:DropDownList ID="ddlBrand"
                                runat="server"
                                CssClass="form-control"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged">
                                <asp:ListItem>Select Brand</asp:ListItem>
                                <asp:ListItem>Maruti Suzuki</asp:ListItem>
                                <asp:ListItem>Hyundai</asp:ListItem>
                                <asp:ListItem>Honda</asp:ListItem>
                                <asp:ListItem>Tata</asp:ListItem>
                                <asp:ListItem>Mahindra</asp:ListItem>
                                <asp:ListItem>Toyota</asp:ListItem>
                                <asp:ListItem>Kia</asp:ListItem>
                                <asp:ListItem>MG</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td><b>Vehicle Model</b></td>
                        <td>
                            <asp:DropDownList ID="ddlModel"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Service Type</b></td>
                        <td>
                            <asp:DropDownList ID="ddlService"
                                runat="server"
                                CssClass="form-control">
                                <asp:ListItem>Select Service</asp:ListItem>
                                <asp:ListItem>General Service</asp:ListItem>
                                <asp:ListItem>Oil Change</asp:ListItem>
                                <asp:ListItem>Engine Repair</asp:ListItem>
                                <asp:ListItem>Brake Service</asp:ListItem>
                                <asp:ListItem>Battery Replacement</asp:ListItem>
                                <asp:ListItem>Wheel Alignment</asp:ListItem>
                                <asp:ListItem>Car Wash</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td><b>Booking Date</b></td>
                        <td>
                            <asp:TextBox ID="txtDate"
                                runat="server"
                                TextMode="Date"
                                CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Pickup Required</b></td>
                        <td>
                            <asp:RadioButtonList ID="rblPickup"
                                runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem Selected="True">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td><b>Problem Description</b></td>
                        <td>
                            <asp:TextBox ID="txtProblem"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="3"
                                CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnBook"
                                runat="server"
                                Text="Book Service"
                                CssClass="btn btn-primary px-5"
                                OnClick="btnBook_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnReset"
                                runat="server"
                                Text="Reset"
                                CssClass="btn btn-secondary px-5"
                                OnClick="btnReset_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <hr />
                            <h4>Booking Details</h4>
                            <asp:Label ID="lblBooking"
                                runat="server"
                                ForeColor="Green"
                                Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
</asp:Content>
