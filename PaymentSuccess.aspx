<%@ Page Title="Payment Successful"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="PaymentSuccess.aspx.cs"
    Inherits="VehicleServiceManagementSystem.PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .success-page {
            min-height: 550px;
            padding: 65px 20px;
            background: #f5f7fb;
            font-family: Arial, Helvetica, sans-serif;
        }

        .success-card {
            max-width: 650px;
            margin: 0 auto;
            padding: 45px 35px;
            background: #ffffff;
            border: 1px solid #e2eaf3;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(16, 45, 85, 0.08);
            text-align: center;
        }

        .success-icon {
            width: 85px;
            height: 85px;
            margin: 0 auto 22px;
            border-radius: 50%;
            background: #e5f8ed;
            color: #138754;
            font-size: 48px;
            line-height: 85px;
            font-weight: bold;
        }

        .success-title {
            color: #138754;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .success-text {
            display: block;
            color: #64748b;
            font-size: 16px;
            line-height: 1.7;
        }

        .details-box {
            margin: 28px 0;
            padding: 20px;
            background: #f8faff;
            border: 1px solid #e5eaf2;
            border-radius: 12px;
            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
            padding: 14px 0;
            border-bottom: 1px solid #e5eaf2;
        }

            .detail-row:last-child {
                border-bottom: none;
            }

        .detail-label {
            color: #64748b;
        }

        .detail-value {
            color: #122f5c;
            font-weight: bold;
            text-align: right;
            overflow-wrap: anywhere;
        }

        .status {
            color: #138754;
        }

        .success-btn {
            display: block;
            width: 100%;
            box-sizing: border-box;
            padding: 16px;
            margin-top: 20px;
            background: #ed1233;
            color: #ffffff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

            .success-btn:hover {
                background: #c90d29;
                color: #ffffff;
            }

        .secondary-btn {
            display: inline-block;
            margin-top: 22px;
            color: #122f5c;
            text-decoration: none;
            font-weight: bold;
        }

            .secondary-btn:hover {
                color: #ed1233;
            }

        @media (max-width: 600px) {
            .success-page {
                padding: 30px 12px;
            }

            .success-card {
                padding: 30px 20px;
            }

            .success-title {
                font-size: 25px;
            }

            .detail-row {
                gap: 10px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="success-page">
        <div class="success-card">

            <div class="success-icon">&#10003;</div>

            <div class="success-title">
                Payment Status
            </div>

            <div class="success-text">
                Check your payment status below and continue to your receipt.
            </div>

            <div class="details-box">

                <div class="detail-row">
                    <span class="detail-label">Service ID</span>
                    <asp:Label ID="lblServiceId" runat="server" CssClass="detail-value" />
                </div>

                <div class="detail-row">
                    <span class="detail-label">Amount</span>
                    <asp:Label ID="lblAmount" runat="server" CssClass="detail-value" />
                </div>

                <div class="detail-row">
                    <span class="detail-label">Payment Status</span>
                    <asp:Label ID="lblStatus" runat="server" Text="Paid" CssClass="detail-value status" />
                </div>

            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="success-text" />

            <asp:HyperLink
                ID="lnkReceipt"
                runat="server"
                CssClass="success-btn"
                Text="View Payment Receipt" />

            <a href="Default.aspx" class="secondary-btn">Go to Home</a>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
