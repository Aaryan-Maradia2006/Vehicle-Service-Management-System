<%@ Page Title="Payment Status"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="PaymentSuccess.aspx.cs"
    Inherits="VehicleServiceManagementSystem.PaymentSuccess" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .success-page {
            min-height: 550px;
            padding: 65px 20px;
            background: #fff5f5;
            font-family: Arial, Helvetica, sans-serif;
        }

        .success-card {
            max-width: 620px;
            margin: 0 auto;
            padding: 45px 35px;
            background: #ffffff;
            border: 1px solid #f5d5da;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.08);
            text-align: center;
        }

        .success-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 22px;
            border-radius: 50%;
            background: #e8f8ed;
            color: #198754;
            font-size: 48px;
            line-height: 85px;
        }

        .success-title {
            color: #ed1233;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .success-text {
            color: #667b96;
            font-size: 16px;
            line-height: 1.7;
        }

        .details-box {
            margin: 28px 0;
            padding: 20px;
            background: #fff8f9;
            border: 1px solid #f5d5da;
            border-radius: 12px;
            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 12px 0;
            border-bottom: 1px solid #f1dfe2;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            color: #667b96;
        }

        .detail-value {
            color: #102d55;
            font-weight: bold;
            text-align: right;
            overflow-wrap: anywhere;
        }

        .status {
            color: #b77900;
        }

        .success-btn {
            display: block;
            width: 100%;
            padding: 16px;
            margin-top: 15px;
            background: #ed1233;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .success-btn:hover {
            background: #c90d29;
            color: white;
        }

        .secondary-btn {
            display: block;
            margin-top: 20px;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        @media (max-width: 600px) {
            .success-card {
                padding: 30px 20px;
            }

            .success-title {
                font-size: 25px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="success-page">
        <div class="success-card">

            <div class="success-icon">&#10003;</div>

            <div class="success-title">
                Payment Status
            </div>

            <div class="success-text">
                Your service payment details are displayed below.
            </div>

            <div class="details-box">

                <div class="detail-row">
                    <span class="detail-label">Service ID</span>
                    <asp:Label ID="lblServiceId"
                        runat="server"
                        CssClass="detail-value" />
                </div>

                <div class="detail-row">
                    <span class="detail-label">Amount</span>
                    <asp:Label ID="lblAmount"
                        runat="server"
                        CssClass="detail-value" />
                </div>

                <div class="detail-row">
                    <span class="detail-label">Payment Status</span>
                    <asp:Label ID="lblStatus"
                        runat="server"
                        CssClass="detail-value status" />
                </div>

            </div>

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="success-text" />

            <a href="ServiceHistory.aspx" class="success-btn">
                Back to Service History
            </a>

            <a href="Default.aspx" class="secondary-btn">
                Go to Home
            </a>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">
</asp:Content>

<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">
</asp:Content>