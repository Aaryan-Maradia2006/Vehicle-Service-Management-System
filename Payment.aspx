<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="VehicleServiceManagementSystem.Payment" %>

<%-- Header --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%-- Contain --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .payment-container {
            max-width: 700px;
            margin: 50px auto;
        }

        .payment-card {
            background: #ffffff;
            box-shadow: 0 10px 35px rgba(0,0,0,0.12);
        }

        .payment-title {
            background: #e91529;
            color: white;
            text-align: center;
            padding: 18px;
            font-size: 30px;
            font-weight: 700;
        }

        .payment-body {
            padding: 35px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 14px 0;
            border-bottom: 1px solid #eeeeee;
            font-size: 17px;
        }

        .detail-label {
            font-weight: 700;
            color: #0b2c5f;
        }

        .detail-value {
            color: #555555;
            text-align: right;
        }

        .amount {
            font-size: 24px;
            font-weight: 700;
            color: #e91529;
        }

        .payment-buttons {
            text-align: center;
            margin-top: 30px;
        }

        .pay-btn {
            background: #e91529;
            color: white;
            border: none;
            padding: 14px 45px;
            font-size: 17px;
            font-weight: 700;
            margin-right: 10px;
            cursor: pointer;
        }

        .back-btn {
            background: #0b2c5f;
            color: white;
            border: none;
            padding: 14px 45px;
            font-size: 17px;
            font-weight: 700;
            cursor: pointer;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 17px;
            font-weight: 700;
        }
    </style>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">

        <a href="Default.aspx"
            class="navbar-brand d-flex align-items-center px-4 px-lg-5">

            <h2 class="m-0 text-primary">
                <i class="fa fa-car me-3"></i>CarServ
            </h2>

        </a>

        <button type="button"
            class="navbar-toggler me-4"
            data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">

            <div class="navbar-nav ms-auto p-4 p-lg-0">

                <a href="Default.aspx"
                    class="nav-item nav-link">Home
                </a>

                <a href="about.aspx"
                    class="nav-item nav-link">About
                </a>

                <a href="service.aspx"
                    class="nav-item nav-link">Service
                </a>

                <a href="team.aspx"
                    class="nav-item nav-link">Technician
                </a>

                <a href="contact.aspx"
                    class="nav-item nav-link">Contact
                </a>

            </div>

        </div>

    </nav>

    <div class="container">

        <div class="payment-container">

            <div class="payment-card">

                <div class="payment-title">
                    Payment
               
                </div>

                <div class="payment-body">

                    <div class="detail-row">
                        <span class="detail-label">Service ID
                        </span>

                        <asp:Label ID="lblServiceId"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Customer Name
                        </span>

                        <asp:Label ID="lblCustomerName"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Mobile
                        </span>

                        <asp:Label ID="lblMobile"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Vehicle Number
                        </span>

                        <asp:Label ID="lblVehicleNumber"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Vehicle
                        </span>

                        <asp:Label ID="lblVehicle"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Service Type
                        </span>

                        <asp:Label ID="lblServiceType"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">
                        <span class="detail-label">Service Date
                        </span>

                        <asp:Label ID="lblServiceDate"
                            runat="server"
                            CssClass="detail-value">
                        </asp:Label>
                    </div>


                    <div class="detail-row">

                        <span class="detail-label">Amount
                        </span>

                        <asp:Label ID="lblAmount"
                            runat="server"
                            CssClass="detail-value amount">
                        </asp:Label>

                    </div>


                    <div class="payment-buttons">

                        <asp:Button ID="btnPay"
                            runat="server"
                            Text="PAY NOW"
                            CssClass="pay-btn"
                            OnClick="btnPay_Click" />

                        <asp:Button ID="btnBack"
                            runat="server"
                            Text="BACK"
                            CssClass="back-btn"
                            OnClick="btnBack_Click" />

                    </div>


                    <asp:Label ID="lblMessage"
                        runat="server"
                        CssClass="message">
                    </asp:Label>

                </div>

            </div>

        </div>

    </div>

    <div class="container-fluid bg-dark text-light footer pt-5 mt-5">

        <div class="container py-5">

            <div class="row g-5">

                <div class="col-lg-3 col-md-6">

                    <h4 class="text-light mb-4">Address
                    </h4>

                    <p class="mb-2">
                        <i class="fa fa-map-marker-alt me-3"></i>
                        Gayatri Nagar, Bhakti Nagar, Rajkot,
                        Gujarat 360002
                   
                    </p>

                    <p class="mb-2">
                        <i class="fa fa-phone-alt me-3"></i>
                        +012 345 67890
                   
                    </p>

                    <p class="mb-2">
                        <i class="fa fa-envelope me-3"></i>
                        info@example.com
                   
                    </p>

                </div>


                <div class="col-lg-3 col-md-6">

                    <h4 class="text-light mb-4">Opening Hours
                    </h4>

                    <h6 class="text-light">Monday - Friday:
                    </h6>

                    <p class="mb-4">
                        09.00 AM - 09.00 PM
                   
                    </p>

                    <h6 class="text-light">Saturday - Sunday:
                    </h6>

                    <p class="mb-0">
                        09.00 AM - 12.00 PM
                   
                    </p>

                </div>


                <div class="col-lg-3 col-md-6">

                    <h4 class="text-light mb-4">Services
                    </h4>

                    <a class="btn btn-link" href="#">Diagnostic Test
                    </a>

                    <a class="btn btn-link" href="#">Engine Servicing
                    </a>

                    <a class="btn btn-link" href="#">Tires Replacement
                    </a>

                    <a class="btn btn-link" href="#">Oil Changing
                    </a>

                </div>


                <div class="col-lg-3 col-md-6">

                    <h4 class="text-light mb-4">Newsletter
                    </h4>

                    <p>
                        Dolor amet sit justo amet elitr
                        clita ipsum elitr est.
                   
                    </p>

                </div>

            </div>

        </div>

    </div>
</asp:Content>

<%-- Contain 2 --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<%-- Footer --%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
