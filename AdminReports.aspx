
<%@ Page Title="Admin Reports" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .reports-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .reports-container {
            max-width: 1250px;
            margin: auto;
        }

        .reports-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .reports-header h2 {
            margin: 0 0 8px;
            font-size: 28px;
        }

        .reports-header p {
            margin: 0;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            border: 1px solid #f3d5da;
            box-shadow: 0 5px 18px rgba(18,47,92,.06);
        }

        .summary-card h4 {
            color: #59677b;
            font-size: 14px;
            margin: 0 0 15px;
        }

        .summary-card .number {
            color: #122f5c;
            font-size: 28px;
            font-weight: bold;
            overflow-wrap: anywhere;
        }

        .reports-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #f3d5da;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

        .reports-card h3 {
            color: #122f5c;
            margin: 0 0 20px;
        }

        .filter-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            align-items: center;
            margin-bottom: 20px;
        }

        .filter-select {
            min-width: 220px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .report-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .report-btn:hover {
            background: #c90d29;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .reports-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .reports-grid th {
            background: #122f5c;
            color: white;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .reports-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            white-space: nowrap;
        }

        .reports-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .report-message {
            display: block;
            margin: 12px 0;
            line-height: 1.5;
        }

        .back-link {
            display: inline-block;
            margin-top: 5px;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media(max-width: 900px) {
            .summary-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media(max-width: 550px) {
            .reports-page {
                padding: 20px 10px;
            }

            .reports-card {
                padding: 16px;
            }

            .summary-grid {
                grid-template-columns: 1fr;
            }

            .reports-header h2 {
                font-size: 23px;
            }
        }

        @media print {
            body {
                background: white !important;
            }

            .reports-page {
                padding: 0;
                background: white;
            }

            .no-print,
            .back-link {
                display: none !important;
            }

            .reports-card,
            .summary-card {
                box-shadow: none;
                break-inside: avoid;
            }

            .reports-header {
                background: white !important;
                color: black !important;
                border: 1px solid #ccc;
            }

            .reports-grid th {
                background: #ddd !important;
                color: black !important;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="reports-page">
        <div class="reports-container">

            <div class="reports-header">
                <h2>Admin Reports</h2>
                <p>Service statistics and vehicle service reports.</p>
            </div>

            <div class="summary-grid">

                <div class="summary-card">
                    <h4>Total Services</h4>
                    <div class="number">
                        <asp:Label ID="lblTotalServices" runat="server" Text="0" />
                    </div>
                </div>

                <div class="summary-card">
                    <h4>Completed Services</h4>
                    <div class="number">
                        <asp:Label ID="lblCompletedServices" runat="server" Text="0" />
                    </div>
                </div>

                <div class="summary-card">
                    <h4>Pending Services</h4>
                    <div class="number">
                        <asp:Label ID="lblPendingServices" runat="server" Text="0" />
                    </div>
                </div>

                <div class="summary-card">
                    <h4>Total Service Amount</h4>
                    <div class="number">
                        ₹<asp:Label ID="lblTotalAmount" runat="server" Text="0.00" />
                    </div>
                </div>

            </div>

            <div class="reports-card">
                <h3>Filter Service Report</h3>

                <div class="filter-row no-print">

                    <asp:DropDownList
                        ID="ddlStatus"
                        runat="server"
                        CssClass="filter-select">
                        <asp:ListItem Text="All Statuses" Value="" />
                        <asp:ListItem Text="Pending" Value="Pending" />
                        <asp:ListItem Text="In Progress" Value="In Progress" />
                        <asp:ListItem Text="Completed" Value="Completed" />
                        <asp:ListItem Text="Cancelled" Value="Cancelled" />
                    </asp:DropDownList>

                    <asp:Button
                        ID="btnFilter"
                        runat="server"
                        Text="Apply Filter"
                        CssClass="report-btn"
                        OnClick="btnFilter_Click" />

                    <asp:Button
                        ID="btnReset"
                        runat="server"
                        Text="Show All"
                        CssClass="report-btn reset-btn"
                        OnClick="btnReset_Click"
                        CausesValidation="false" />

                    <button type="button"
                        class="report-btn"
                        onclick="window.print();">
                        Print Report
                    </button>

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="report-message">
                </asp:Label>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="reports-grid"
                        GridLines="None"
                        EmptyDataText="No service records found.">

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
                                DataField="ServiceType"
                                HeaderText="Service Type" />

                            <asp:BoundField
                                DataField="BookingDate"
                                HeaderText="Booking Date"
                                DataFormatString="{0:dd-MM-yyyy}" />

                            <asp:BoundField
                                DataField="Status"
                                HeaderText="Service Status" />

                            <asp:BoundField
                                DataField="Amount"
                                HeaderText="Amount"
                                DataFormatString="₹{0:0.00}" />

                        </Columns>

                        <HeaderStyle BackColor="#122f5c" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#fff8f9" />

                    </asp:GridView>

                </div>
            </div>

            <a href="Admin.aspx" class="back-link">
                &#8592; Back to Admin Dashboard
            </a>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>