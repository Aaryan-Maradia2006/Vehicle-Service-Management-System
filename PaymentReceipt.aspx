
<%@ Page Title="Payment Receipt" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PaymentReceipt.aspx.cs" Inherits="VehicleServiceManagementSystem.PaymentReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .receipt-page {
            min-height: 600px;
            padding: 45px 20px;
            background: #f4f7fb;
            font-family: Arial, Helvetica, sans-serif;
        }

        .receipt-box {
            max-width: 780px;
            margin: 0 auto;
            padding: 35px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            box-shadow: 0 10px 35px rgba(15, 40, 75, 0.08);
        }

        .receipt-header {
            text-align: center;
            border-bottom: 2px dashed #cbd5e1;
            padding-bottom: 25px;
            margin-bottom: 15px;
        }

        .receipt-icon {
            width: 65px;
            height: 65px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #e5f8ed;
            color: #138754;
            font-size: 36px;
            line-height: 65px;
            font-weight: bold;
        }

        .receipt-header h1 {
            margin: 0 0 8px;
            color: #122f5c;
            font-size: 27px;
        }

        .receipt-header h2 {
            margin: 0 0 12px;
            color: #ed1233;
            font-size: 23px;
        }

        .receipt-header p {
            margin: 0;
            color: #64748b;
        }

        .receipt-status {
            display: inline-block;
            margin-top: 10px;
            padding: 7px 15px;
            border-radius: 20px;
            background: #e5f8ed;
            color: #087443;
            font-weight: bold;
        }

        .receipt-message {
            display: block;
            margin: 15px 0;
            text-align: center;
            color: #dc2626;
            font-weight: bold;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            padding: 15px 5px;
            border-bottom: 1px solid #edf0f5;
        }

        .receipt-label {
            color: #64748b;
            font-size: 14px;
        }

        .receipt-value {
            color: #122f5c;
            font-weight: bold;
            text-align: right;
            overflow-wrap: anywhere;
        }

        .receipt-total-row {
            margin-top: 15px;
            padding: 20px;
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            border-radius: 10px;
        }

        .receipt-total {
            color: #138754;
            font-size: 25px;
            font-weight: bold;
            text-align: right;
        }

        .receipt-actions {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 30px;
        }

        .receipt-btn {
            display: inline-block;
            padding: 13px 22px;
            border: none;
            border-radius: 8px;
            background: #ed1233;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .receipt-btn:hover {
            background: #c90d29;
            color: #ffffff;
        }

        .history-btn {
            background: #122f5c;
        }

        .history-btn:hover {
            background: #1c477f;
        }

        @media (max-width: 600px) {
            .receipt-page {
                padding: 25px 10px;
            }

            .receipt-box {
                padding: 22px 16px;
            }

            .receipt-header h1 {
                font-size: 23px;
            }

            .receipt-header h2 {
                font-size: 20px;
            }

            .receipt-row {
                gap: 12px;
            }

            .receipt-actions {
                flex-direction: column;
            }

            .receipt-btn {
                box-sizing: border-box;
                width: 100%;
                text-align: center;
            }
        }

        @media print {
            .no-print {
                display: none !important;
            }

            .receipt-page {
                padding: 0;
                background: #ffffff;
            }

            .receipt-box {
                max-width: 100%;
                padding: 15px;
                border: none;
                border-radius: 0;
                box-shadow: none;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="receipt-page">
        <div class="receipt-box">

            <div class="receipt-header">
                <div class="receipt-icon">&#10003;</div>

                <h1>Vehicle Service Management</h1>
                <h2>Payment Receipt</h2>

                <p>Thank you for using our vehicle service.</p>

                <div>
                    Payment Status:
                    <asp:Label
                        ID="lblStatus"
                        runat="server"
                        CssClass="receipt-status" />
                </div>
            </div>

            <asp:Label
                ID="lblMessage"
                runat="server"
                Visible="false"
                CssClass="receipt-message" />

            <div class="receipt-row">
                <span class="receipt-label">Receipt Number</span>
                <asp:Label ID="lblReceiptId" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Transaction ID</span>
                <asp:Label ID="lblTransaction" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Payment Date</span>
                <asp:Label ID="lblDate" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Customer Name</span>
                <asp:Label ID="lblCustomer" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Mobile</span>
                <asp:Label ID="lblMobile" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Vehicle Number</span>
                <asp:Label ID="lblVehicle" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Vehicle</span>
                <asp:Label ID="lblVehicleModel" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Service Type</span>
                <asp:Label ID="lblService" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row">
                <span class="receipt-label">Payment Method</span>
                <asp:Label ID="lblMethod" runat="server" CssClass="receipt-value" />
            </div>

            <div class="receipt-row receipt-total-row">
                <span class="receipt-label">Total Amount</span>
                <asp:Label ID="lblAmount" runat="server" CssClass="receipt-total" />
            </div>

            <div class="receipt-actions no-print">

                <button type="button"
                    class="receipt-btn"
                    onclick="window.print();">
                    Print Receipt
                </button>

                <asp:HyperLink
                    ID="lnkHistory"
                    runat="server"
                    NavigateUrl="~/ServiceHistory.aspx"
                    CssClass="receipt-btn history-btn"
                    Text="Go to History" />

            </div>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
