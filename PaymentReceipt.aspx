<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PaymentReceipt.aspx.cs" Inherits="VehicleServiceManagementSystem.PaymentReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .receipt-box {
            max-width: 750px;
            margin: 35px auto;
            padding: 35px;
            background: white;
            border: 1px solid #ddd;
            box-shadow: 0 4px 15px #ddd;
        }

        .receipt-header {
            text-align: center;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 20px;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 13px 0;
            border-bottom: 1px solid #eee;
        }

        .receipt-label {
            font-weight: bold;
        }

        .receipt-total {
            font-size: 24px;
            color: #198754;
            font-weight: bold;
        }

        .receipt-btn {
            background: #0d6efd;
            color: white;
            border: none;
            padding: 12px 22px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        @media print {
            .no-print {
                display: none !important;
            }

            .receipt-box {
                box-shadow: none;
                border: none;
                margin: 0 auto;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="receipt-box">

        <div class="receipt-header">
            <h1>Vehicle Service Management</h1>
            <h2>Payment Receipt</h2>
            <p>
                Payment Status:
               
                <asp:Label ID="lblStatus" runat="server" />
            </p>
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Receipt Number</span>
            <asp:Label ID="lblReceiptId" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Transaction ID</span>
            <asp:Label ID="lblTransaction" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Payment Date</span>
            <asp:Label ID="lblDate" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Customer Name</span>
            <asp:Label ID="lblCustomer" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Mobile</span>
            <asp:Label ID="lblMobile" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Vehicle Number</span>
            <asp:Label ID="lblVehicle" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Vehicle</span>
            <asp:Label ID="lblVehicleModel" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Service Type</span>
            <asp:Label ID="lblService" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Payment Method</span>
            <asp:Label ID="lblMethod" runat="server" />
        </div>

        <div class="receipt-row">
            <span class="receipt-label">Total Amount</span>
            <asp:Label ID="lblAmount" runat="server" CssClass="receipt-total" />
        </div>

        <div class="no-print" style="text-align: center;">
            <button type="button" class="receipt-btn" onclick="window.print()">
                Print Receipt
           
            </button>

            <a href="ServiceHistory.aspx" class="receipt-btn"
                style="display: inline-block; text-decoration: none;">Back to Service History
            </a>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
