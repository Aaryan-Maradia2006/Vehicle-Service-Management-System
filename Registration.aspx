<%@ Page Title="Customer Registration" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="VehicleServiceManagementSystem.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="container py-5">

        <div class="card shadow-lg border-0">

            <div class="card-header bg-primary text-center py-3">
                <h2 class="text-white mb-0">Customer Registration
                </h2>
            </div>

            <div class="card-body">

                <table class="table table-borderless">

                    <!-- Full Name / Mobile -->
                    <tr>
                        <td>
                            <b>Full Name</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtName"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>

                        <td>
                            <b>Mobile Number</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtMobile"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>
                    </tr>


                    <!-- Email / Vehicle Number -->
                    <tr>
                        <td>
                            <b>Email</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtEmail"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>

                        <td>
                            <b>Vehicle Number</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtVehicleNo"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>
                    </tr>


                    <!-- Vehicle Brand / Model -->
                    <tr>
                        <td>
                            <b>Vehicle Brand</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtVehicleBrand"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>

                        <td>
                            <b>Vehicle Model</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtVehicleModel"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>
                    </tr>


                    <!-- Username / Password -->
                    <tr>
                        <td>
                            <b>Username</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtUsername"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>

                        <td>
                            <b>Password</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>
                    </tr>


                    <!-- Confirm Password -->
                    <tr>
                        <td>
                            <b>Confirm Password</b>
                        </td>

                        <td>
                            <asp:TextBox ID="txtConfirmPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>

                        <td></td>
                        <td></td>
                    </tr>


                    <!-- Address -->
                    <tr>
                        <td>
                            <b>Address</b>
                        </td>

                        <td colspan="3">
                            <asp:TextBox ID="txtAddress"
                                runat="server"
                                TextMode="MultiLine"
                                Rows="3"
                                CssClass="form-control">
                            </asp:TextBox>
                        </td>
                    </tr>


                    <!-- Buttons -->
                    <tr>
                        <td colspan="4" class="text-center">

                            <asp:Button ID="btnRegister"
                                runat="server"
                                Text="REGISTER"
                                CssClass="btn btn-primary px-5"
                                OnClick="btnRegister_Click" />

                            &nbsp;&nbsp;

                            <asp:Button ID="btnReset"
                                runat="server"
                                Text="RESET"
                                CssClass="btn btn-secondary px-5"
                                OnClick="btnReset_Click" />

                            &nbsp;&nbsp;

                            <asp:Button ID="btnUpdate"
                                runat="server"
                                Text="UPDATE"
                                CssClass="btn btn-success px-5"
                                OnClick="btnUpdate_Click" />

                            &nbsp;&nbsp;

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="DELETE YOUR DATA"
                                CssClass="btn btn-danger px-5"
                                OnClick="btnDelete_Click"
                                OnClientClick="return confirm('Are you sure you want to delete your data?');" />

                            &nbsp;&nbsp;

                            <asp:Button ID="BtnLogin"
                                runat="server"
                                Text="GO TO LOGIN PAGE"
                                CssClass="btn btn-primary px-5"
                                PostBackUrl="~/Login.aspx" />

                        </td>
                    </tr>


                    <!-- GridView -->
                    <tr>
                        <td colspan="4">

                            <hr />

                            <h4>Registered Details</h4>

                            <asp:GridView ID="GridView1"
                                runat="server"
                                AutoGenerateColumns="False"
                                Width="100%"
                                CssClass="table table-bordered"
                                OnRowCommand="GridView1_RowCommand">

                                <Columns>

                                    <asp:BoundField
                                        DataField="CustomerId"
                                        HeaderText="ID" />

                                    <asp:BoundField
                                        DataField="FullName"
                                        HeaderText="Full Name" />

                                    <asp:BoundField
                                        DataField="Mobile"
                                        HeaderText="Mobile" />

                                    <asp:BoundField
                                        DataField="Email"
                                        HeaderText="Email" />

                                    <asp:BoundField
                                        DataField="VehicleNumber"
                                        HeaderText="Vehicle Number" />

                                    <asp:BoundField
                                        DataField="VehicleBrand"
                                        HeaderText="Vehicle Brand" />

                                    <asp:BoundField
                                        DataField="VehicleModel"
                                        HeaderText="Vehicle Model" />

                                    <asp:BoundField
                                        DataField="Username"
                                        HeaderText="Username" />

                                    <asp:BoundField
                                        DataField="Address"
                                        HeaderText="Address" />

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>

                                            <asp:LinkButton
                                                ID="btnEdit"
                                                runat="server"
                                                Text="Edit"
                                                CommandName="cmd_edt"
                                                CommandArgument='<%# Eval("CustomerId") %>'>
                                            </asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>

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
</asp:Content>
