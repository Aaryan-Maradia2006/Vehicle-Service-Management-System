<%@ Page Title="My Service History" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ServiceHistory.aspx.cs" Inherits="VehicleServiceManagementSystem.ServiceHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .history-page {
            min-height: 500px;
            padding: 45px 20px;
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .history-container {
            max-width: 1450px;
            margin: auto;
        }

        .history-header {
            padding: 30px;
            color: #ffffff;
            background: linear-gradient(135deg, #ed1233, #b90828);
            border-radius: 16px;
            margin-bottom: 25px;
            box-shadow: 0 8px 25px rgba(237, 18, 51, 0.15);
        }

            .history-header h2 {
                margin: 0 0 10px;
                color: #ffffff;
                font-size: 30px;
                font-weight: 700;
            }

            .history-header p {
                margin: 0;
                color: #ffffff;
                font-size: 15px;
                line-height: 1.6;
            }

        .history-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 30px rgba(20, 40, 80, 0.07);
            border: 1px solid #e8edf5;
        }

            .history-card h3 {
                color: #122f5c;
                font-size: 22px;
                font-weight: 700;
                margin: 0 0 20px;
            }

        .history-table-wrap {
            width: 100%;
            overflow-x: auto;
            border-radius: 10px;
        }

        .history-grid {
            width: 100%;
            min-width: 1100px;
            border-collapse: collapse;
            background: #ffffff;
        }

            .history-grid th {
                background: #122f5c;
                color: #ffffff;
                padding: 16px 14px;
                text-align: left;
                white-space: nowrap;
                font-size: 14px;
                border: 1px solid #233f6d;
            }

            .history-grid td {
                padding: 15px 14px;
                color: #344563;
                border: 1px solid #e6ebf2;
                font-size: 14px;
                white-space: nowrap;
            }

            .history-grid tr:nth-child(even) {
                background: #f8faff;
            }

            .history-grid tr:hover {
                background: #fff1f3;
            }

        .pay-button {
            background: #138754;
            color: #ffffff;
            padding: 9px 18px;
            border: none;
            border-radius: 7px;
            font-weight: 700;
            cursor: pointer;
            font-size: 13px;
        }

            .pay-button:hover {
                background: #0d6c41;
            }

        .paid-label {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 7px;
            color: #087443;
            background: #e5f8ed;
            font-weight: 700;
            font-size: 13px;
        }

        .empty-message {
            color: #64748b;
            padding: 20px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .history-page {
                padding: 25px 10px;
            }

            .history-header {
                padding: 22px;
            }

                .history-header h2 {
                    font-size: 24px;
                }

            .history-card {
                padding: 15px;
            }

                .history-card h3 {
                    font-size: 19px;
                }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- Topbar Start -->
    <div class="container-fluid bg-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small>Gayatri Nagar, Bhakti Nagar, Rajkot, Gujarat 360002</small>
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
    </nav>
    <!-- Navbar End -->

    <div class="history-page">

        <div class="history-container">

            <div class="history-header">
                <h2>My Service History</h2>
                <p>
                    View your vehicle service details and manage your payments.
                </p>
            </div>

            <div class="history-card">

                <h3>My Service Records</h3>

                <div class="history-table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="history-grid"
                        GridLines="None"
                        OnRowCommand="GridView1_RowCommand"
                        EmptyDataText="No service records found."
                        EmptyDataRowStyle-CssClass="empty-message">

                        <Columns>

                            <asp:BoundField
                                DataField="ServiceHistoryId"
                                HeaderText="Service ID" />

                            <asp:BoundField
                                DataField="CustomerName"
                                HeaderText="Customer Name" />

                            <asp:BoundField
                                DataField="Mobile"
                                HeaderText="Mobile" />

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
                                DataField="ServiceType"
                                HeaderText="Service Type" />

                            <asp:BoundField
                                DataField="BookingDate"
                                HeaderText="Service Date"
                                DataFormatString="{0:dd-MM-yyyy}"
                                HtmlEncode="false" />

                            <asp:BoundField
                                DataField="Amount"
                                HeaderText="Amount"
                                DataFormatString="₹{0:0.00}"
                                HtmlEncode="false" />

                            <asp:TemplateField HeaderText="Payment">

                                <ItemTemplate>

                                    <asp:Button
                                        ID="btnPay"
                                        runat="server"
                                        Text="PAY"
                                        CssClass="pay-button"
                                        CommandName="PayService"
                                        CommandArgument='<%# Eval("ServiceHistoryId") %>'
                                        Visible='<%# !String.Equals(Convert.ToString(Eval("PaymentStatus")), "Paid", StringComparison.OrdinalIgnoreCase) %>'
                                        CausesValidation="false" />

                                    <asp:Label
                                        ID="lblPaid"
                                        runat="server"
                                        Text="Paid &#10003;"
                                        CssClass="paid-label"
                                        Visible='<%# String.Equals(Convert.ToString(Eval("PaymentStatus")), "Paid", StringComparison.OrdinalIgnoreCase) %>' />

                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </div>

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


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
