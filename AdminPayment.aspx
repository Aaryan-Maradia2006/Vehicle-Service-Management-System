<%@ Page Title="Payment Management" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminPayment.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .payment-admin-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .payment-admin-container {
            max-width: 1200px;
            margin: auto;
        }

        .payment-admin-header {
            background: #ed1233;
            color: white;
            padding: 26px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

            .payment-admin-header h2 {
                margin: 0 0 8px;
                font-size: 28px;
            }

            .payment-admin-header p {
                margin: 0;
            }

        .payment-admin-card {
            background: white;
            padding: 25px;
            border-radius: 13px;
            border: 1px solid #f3d5da;
            box-shadow: 0 6px 22px rgba(16,45,85,.07);
            margin-bottom: 25px;
        }

        .payment-admin-title {
            color: #122f5c;
            font-size: 22px;
            margin: 0 0 20px;
        }

        .search-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            min-width: 220px;
            padding: 13px;
            border: 1px solid #e3cbd0;
            border-radius: 8px;
            font-size: 15px;
        }

        .admin-btn {
            background: #ed1233;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

            .admin-btn:hover {
                background: #c90d29;
            }

        .clear-btn {
            background: #122f5c;
        }

        .table-wrap {
            overflow-x: auto;
            width: 100%;
        }

        .payment-grid {
            width: 100%;
            border-collapse: collapse;
        }

            .payment-grid th {
                background: #122f5c;
                color: white;
                padding: 14px 12px;
                text-align: left;
                white-space: nowrap;
            }

            .payment-grid td {
                padding: 13px 12px;
                border: 1px solid #e9edf2;
                color: #263b58;
                white-space: nowrap;
            }

            .payment-grid tr:nth-child(even) {
                background: #fff8f9;
            }

        .message {
            display: block;
            margin-top: 15px;
            line-height: 1.6;
        }

        .info-note {
            padding: 15px;
            margin-top: 20px;
            background: #fff8e8;
            color: #805600;
            border: 1px solid #ffe0a0;
            border-radius: 9px;
            font-size: 14px;
            line-height: 1.6;
        }

        .back-link {
            display: inline-block;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
        }

            .back-link:hover {
                text-decoration: underline;
            }

        @media(max-width: 650px) {
            .payment-admin-page {
                padding: 20px 10px;
            }

            .payment-admin-card {
                padding: 16px;
            }

            .payment-admin-header h2 {
                font-size: 24px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="payment-admin-page">
        <div class="payment-admin-container">

            <div class="payment-admin-header">
                <h2>Payment Management</h2>
                <p>View service amounts and related customer records.</p>
            </div>

            <div class="payment-admin-card">

                <h3 class="payment-admin-title">Search Payment Records
                </h3>

                <div class="search-row">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Enter Service ID, customer name or vehicle number">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="admin-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="admin-btn clear-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </div>

            <div class="payment-admin-card">

                <h3 class="payment-admin-title">Service Payment Records
                </h3>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="payment-grid"
                        Width="100%"
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
                                HeaderText="Service Date"
                                DataFormatString="{0:dd-MM-yyyy}" />

                            <asp:BoundField
                                DataField="Amount"
                                HeaderText="Service Amount"
                                DataFormatString="₹{0:0.00}" />

                            <asp:BoundField
                                DataField="Status"
                                HeaderText="Service Status" />

                        </Columns>

                        <HeaderStyle BackColor="#122f5c" ForeColor="White" />
                        <RowStyle BackColor="White" />
                        <AlternatingRowStyle BackColor="#fff8f9" />

                    </asp:GridView>

                </div>

                <div class="info-note">
                    <strong>Note:</strong>
                    This page displays service amounts and service status
                    from the ServiceHistory table. It does not confirm
                    whether a payment has actually been received.
                </div>

            </div>

            <a href="Admin.aspx" class="back-link">&#8592; Back to Admin Dashboard
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
