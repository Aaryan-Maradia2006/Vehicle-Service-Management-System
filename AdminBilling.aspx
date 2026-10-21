<%@ Page Title="Billing & Invoice" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminBilling.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminBilling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .billing-page {
            background: #fff5f6;
            min-height: 650px;
            padding: 35px 20px;
            font-family: Arial, sans-serif;
        }

        .billing-container {
            max-width: 1100px;
            margin: auto;
        }

        .billing-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

            .billing-header h2 {
                margin: 0;
                font-size: 28px;
            }

            .billing-header p {
                margin: 8px 0 0;
            }

        .billing-card {
            background: white;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 6px 22px rgba(16, 45, 85, .08);
            border: 1px solid #f3d5da;
        }

        .billing-title {
            color: #122f5c;
            margin: 0 0 20px;
            font-size: 22px;
        }

        .search-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            min-width: 200px;
            padding: 13px;
            border: 1px solid #e1cbd0;
            border-radius: 8px;
            font-size: 15px;
        }

        .billing-btn {
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            background: #ed1233;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

            .billing-btn:hover {
                background: #c90d29;
            }

        .reset-btn {
            background: #122f5c;
        }

        .invoice {
            border: 1px solid #e4e8ee;
            border-radius: 12px;
            overflow: hidden;
        }

        .invoice-header {
            background: #122f5c;
            color: white;
            padding: 25px;
            display: flex;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
        }

            .invoice-header h3 {
                margin: 0 0 8px;
                font-size: 24px;
            }

        .invoice-body {
            padding: 25px;
        }

        .invoice-section-title {
            color: #ed1233;
            font-size: 17px;
            font-weight: bold;
            margin: 5px 0 14px;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
            margin-bottom: 25px;
        }

        .detail-item {
            padding: 14px;
            border: 1px solid #edf0f4;
            border-radius: 8px;
            background: #fffafb;
            overflow-wrap: anywhere;
        }

        .detail-label {
            display: block;
            color: #708098;
            font-size: 13px;
            margin-bottom: 7px;
        }

        .detail-value {
            color: #122f5c;
            font-size: 15px;
            font-weight: bold;
        }

        .amount-box {
            background: #fff3f5;
            border: 1px solid #f4cbd2;
            border-radius: 10px;
            padding: 22px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .amount-label {
            color: #122f5c;
            font-weight: bold;
            font-size: 18px;
        }

        .amount-value {
            color: #ed1233;
            font-size: 30px;
            font-weight: bold;
        }

        .billing-message {
            display: block;
            margin: 15px 0;
            line-height: 1.6;
        }

        .invoice-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 22px;
        }

        .back-link {
            display: inline-block;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
            margin-top: 22px;
        }

            .back-link:hover {
                text-decoration: underline;
            }

        @media (max-width: 650px) {
            .billing-page {
                padding: 20px 10px;
            }

            .billing-card {
                padding: 16px;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .amount-box {
                align-items: flex-start;
                flex-direction: column;
            }

            .billing-header h2 {
                font-size: 24px;
            }
        }

        @media print {
            body * {
                visibility: hidden !important;
            }

            #invoicePrint, #invoicePrint * {
                visibility: visible !important;
            }

            #invoicePrint {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                border: none;
                box-shadow: none;
            }

            .no-print {
                display: none !important;
            }

            .billing-page {
                background: white;
                padding: 0;
            }

            .invoice-header {
                background: #122f5c !important;
                color: white !important;
                print-color-adjust: exact;
                -webkit-print-color-adjust: exact;
            }

            .amount-box {
                print-color-adjust: exact;
                -webkit-print-color-adjust: exact;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="billing-page">
        <div class="billing-container">

            <div class="billing-header">
                <h2>Billing &amp; Invoice</h2>
                <p>Search service records and print customer invoices.</p>
            </div>

            <div class="billing-card no-print">
                <h3 class="billing-title">Find Service Bill</h3>

                <div class="search-row">
                    <asp:TextBox
                        ID="txtServiceId"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter Service ID">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search Bill"
                        CssClass="billing-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnReset"
                        runat="server"
                        Text="Clear"
                        CssClass="billing-btn reset-btn"
                        OnClick="btnReset_Click"
                        CausesValidation="false" />
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="billing-message">
                </asp:Label>
            </div>

            <asp:Panel ID="pnlInvoice" runat="server" Visible="false">

                <div class="billing-card">
                    <div id="invoicePrint" class="invoice">

                        <div class="invoice-header">
                            <div>
                                <h3>VEHICLE SERVICE</h3>
                                <div>Service Billing &amp; Invoice</div>
                            </div>

                            <div>
                                <strong>INVOICE</strong>
                                <br />
                                Service ID:
                                <asp:Label ID="lblInvoiceId" runat="server" />
                            </div>
                        </div>

                        <div class="invoice-body">

                            <div class="invoice-section-title">
                                Customer Details
                            </div>

                            <div class="details-grid">

                                <div class="detail-item">
                                    <span class="detail-label">Customer Name</span>
                                    <asp:Label ID="lblCustomerName"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label">Mobile Number</span>
                                    <asp:Label ID="lblMobile"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                            </div>

                            <div class="invoice-section-title">
                                Vehicle Details
                            </div>

                            <div class="details-grid">

                                <div class="detail-item">
                                    <span class="detail-label">Vehicle Number</span>
                                    <asp:Label ID="lblVehicleNumber"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label">Vehicle</span>
                                    <asp:Label ID="lblVehicle"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label">Service Type</span>
                                    <asp:Label ID="lblServiceType"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label">Service Date</span>
                                    <asp:Label ID="lblServiceDate"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                                <div class="detail-item">
                                    <span class="detail-label">Service Status</span>
                                    <asp:Label ID="lblStatus"
                                        runat="server"
                                        CssClass="detail-value" />
                                </div>

                            </div>

                            <div class="amount-box">
                                <span class="amount-label">Total Service Amount</span>

                                <asp:Label ID="lblAmount"
                                    runat="server"
                                    CssClass="amount-value" />
                            </div>

                            <p style="color: #708098; margin-top: 25px;">
                                Thank you for choosing our vehicle service.
                            </p>

                        </div>
                    </div>

                    <div class="invoice-actions no-print">
                        <asp:Button
                            ID="btnPrint"
                            runat="server"
                            Text="Print Invoice"
                            CssClass="billing-btn"
                            OnClientClick="window.print(); return false;" />

                        <asp:Button
                            ID="btnBack"
                            runat="server"
                            Text="Back to Search"
                            CssClass="billing-btn reset-btn"
                            OnClick="btnBack_Click"
                            CausesValidation="false" />
                    </div>

                </div>

            </asp:Panel>

            <a href="Admin.aspx" class="back-link no-print">&#8592; Back to Admin Dashboard
            </a>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
