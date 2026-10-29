<%@ Page Title="Vehicle Service Booking"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="Booking.aspx.cs"
    Inherits="VehicleServiceManagementSystem.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .booking-container {
            padding: 50px 0;
            background: #f8f9fa;
        }

        .booking-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 25px rgba(0,0,0,0.12);
        }

        .booking-header {
            background: #d90429;
            color: white;
            padding: 22px;
            text-align: center;
        }

            .booking-header h2 {
                margin: 0;
                font-weight: 700;
            }

        .booking-body {
            padding: 35px;
        }

        .booking-label {
            color: #0b1f4d;
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
        }

        .booking-control {
            width: 100%;
            height: 44px;
            padding: 8px 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            background: #fff;
            color: #495057;
        }

        textarea.booking-control {
            height: 100px;
            resize: vertical;
        }

        .booking-field {
            margin-bottom: 22px;
        }

        .booking-buttons {
            text-align: center;
            margin-top: 15px;
        }

        .btn-booking {
            background: #d90429;
            color: white;
            border: none;
            padding: 12px 35px;
            margin: 5px;
            font-weight: 600;
            cursor: pointer;
        }

            .btn-booking:hover {
                background: #b80321;
                color: white;
            }

        .btn-reset {
            background: #0b1f4d;
            color: white;
            border: none;
            padding: 12px 35px;
            margin: 5px;
            font-weight: 600;
            cursor: pointer;
        }

            .btn-reset:hover {
                background: #17366f;
                color: white;
            }

        .booking-details {
            border-left: 4px solid #d90429;
            background: #f8f9fa;
            padding: 20px;
            margin-top: 20px;
            line-height: 2;
            overflow-wrap: anywhere;
        }

        .pickup-options {
            color: #495057;
        }

        @media (max-width: 767px) {
            .booking-body {
                padding: 20px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">

        <a href="Default.aspx" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-danger">
                <i class="fa fa-car me-3"></i>CarServ
            </h2>
        </a>

        <button type="button" class="navbar-toggler me-4"
            data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="Default.aspx" class="nav-item nav-link">HOME</a>
                <a href="about.aspx" class="nav-item nav-link">ABOUT</a>
                <a href="service.aspx" class="nav-item nav-link">SERVICE</a>
                <a href="team.aspx" class="nav-item nav-link">TECHNICIAN</a>
                <a href="contact.aspx" class="nav-item nav-link">CONTACT</a>
            </div>
        </div>

    </nav>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="booking-container">

        <div class="container">

            <div class="booking-card">

                <div class="booking-header">
                    <h2>Vehicle Service Booking</h2>
                    <p class="mb-0 mt-2">Book your vehicle service easily</p>
                </div>

                <div class="booking-body">

                    <div class="row">

                        <div class="col-md-6">

                            <div class="booking-field">
                                <label class="booking-label">Customer Name</label>
                                <asp:TextBox ID="txtCustomerName" runat="server"
                                    CssClass="booking-control"
                                    placeholder="Enter customer name"></asp:TextBox>
                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server"
                                    TextMode="Email"
                                    CssClass="booking-control"
                                    placeholder="Enter email address"></asp:TextBox>
                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Vehicle Brand</label>


                                <asp:DropDownList ID="ddlBrand" runat="server"
                                    CssClass="form-control"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged">
                                    <asp:ListItem Text="Select Brand" Value="" />
                                    <asp:ListItem Text="Maruti Suzuki" Value="Maruti Suzuki" />
                                    <asp:ListItem Text="Hyundai" Value="Hyundai" />
                                    <asp:ListItem Text="Honda" Value="Honda" />
                                    <asp:ListItem Text="Tata" Value="Tata" />
                                    <asp:ListItem Text="Mahindra" Value="Mahindra" />
                                    <asp:ListItem Text="Toyota" Value="Toyota" />
                                    <asp:ListItem Text="Kia" Value="Kia" />
                                    <asp:ListItem Text="MG" Value="MG" />
                                </asp:DropDownList>

                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Service Type</label>

                                <asp:DropDownList ID="ddlService" runat="server"
                                    CssClass="booking-control"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlService_SelectedIndexChanged">

                                    <asp:ListItem Value="">Select Service</asp:ListItem>
                                    <asp:ListItem>General Service</asp:ListItem>
                                    <asp:ListItem>Oil Change</asp:ListItem>
                                    <asp:ListItem>Engine Repair</asp:ListItem>
                                    <asp:ListItem>Brake Service</asp:ListItem>
                                    <asp:ListItem>Battery Replacement</asp:ListItem>
                                    <asp:ListItem>Wheel Alignment</asp:ListItem>
                                    <asp:ListItem>Car Wash</asp:ListItem>

                                </asp:DropDownList>
                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Pickup Required</label>

                                <asp:RadioButtonList ID="rblPickup" runat="server"
                                    RepeatDirection="Horizontal"
                                    CssClass="pickup-options">

                                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                                    <asp:ListItem Value="No" Selected="True">No</asp:ListItem>

                                </asp:RadioButtonList>
                            </div>

                        </div>


                        <div class="col-md-6">

                            <div class="booking-field">
                                <label class="booking-label">Mobile Number</label>
                                <asp:TextBox ID="txtMobile" runat="server"
                                    TextMode="Phone"
                                    CssClass="booking-control"
                                    placeholder="Enter mobile number"></asp:TextBox>
                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Vehicle Number</label>
                                <asp:TextBox ID="txtVehicleNumber" runat="server"
                                    CssClass="booking-control"
                                    placeholder="e.g. GJ03AB1234"></asp:TextBox>
                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Vehicle Model</label>

                                <asp:DropDownList ID="ddlModel" runat="server"
                                    CssClass="booking-control">

                                    <asp:ListItem Value="">Select Model</asp:ListItem>

                                </asp:DropDownList>
                            </div>

                            <div id="trServiceBrand" runat="server"
                                visible="false" class="booking-field">

                                <asp:Label ID="lblServiceBrand" runat="server"
                                    CssClass="booking-label"></asp:Label>

                                <asp:DropDownList ID="ddlServiceBrand" runat="server"
                                    CssClass="booking-control">
                                </asp:DropDownList>

                            </div>

                            <div class="booking-field">
                                <label class="booking-label">Booking Date</label>

                                <asp:TextBox ID="txtDate" runat="server"
                                    TextMode="Date"
                                    CssClass="booking-control"></asp:TextBox>
                            </div>

                        </div>

                    </div>


                    <div class="row">

                        <div class="col-12">
                            <div class="booking-field">
                                <label class="booking-label">Problem Description</label>

                                <asp:TextBox ID="txtProblem" runat="server"
                                    TextMode="MultiLine"
                                    Rows="4"
                                    CssClass="booking-control"
                                    placeholder="Describe your vehicle problem"></asp:TextBox>
                            </div>
                        </div>

                    </div>


                    <div class="booking-buttons">

                        <asp:Button ID="btnBook" runat="server"
                            Text="BOOK SERVICE"
                            CssClass="btn-booking"
                            OnClick="btnBook_Click" />

                        <asp:Button ID="btnReset" runat="server"
                            Text="RESET"
                            CssClass="btn-reset"
                            CausesValidation="false"
                            OnClick="btnReset_Click" />

                    </div>


                    <hr class="my-4" />

                    <h4 class="text-dark">Booking Details</h4>

                    <div class="booking-details">
                        <asp:Label ID="lblBooking" runat="server"></asp:Label>
                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <div class="container-fluid bg-dark text-light footer pt-5 mt-0">

        <div class="container py-5">

            <div class="row g-5">

                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Address</h4>
                    <p><i class="fa fa-map-marker-alt me-3"></i>Rajkot, Gujarat, India</p>
                    <p><i class="fa fa-phone-alt me-3"></i>Contact CarServ</p>
                    <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                </div>

                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Opening Hours</h4>
                    <h6 class="text-light">Monday - Friday:</h6>
                    <p>09:00 AM - 09:00 PM</p>
                    <h6 class="text-light">Saturday - Sunday:</h6>
                    <p>09:00 AM - 12:00 PM</p>
                </div>

                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Services</h4>
                    <a class="btn btn-link text-light" href="Booking.aspx">Service Booking</a>
                    <a class="btn btn-link text-light" href="ServiceHistory.aspx">Service History</a>
                    <a class="btn btn-link text-light" href="service.aspx">Our Services</a>
                </div>

                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">CarServ</h4>
                    <p>Professional vehicle service booking system.</p>
                    <a href="Booking.aspx" class="btn btn-danger">Book Now</a>
                </div>

            </div>

        </div>

        <div class="container">
            <div class="copyright py-3">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start">
                        &copy; CarServ. All Rights Reserved.
                    </div>

                    <div class="col-md-6 text-center text-md-end">
                        Designed By Aryan Maradiya &amp; Bhavin Gadhiya
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
