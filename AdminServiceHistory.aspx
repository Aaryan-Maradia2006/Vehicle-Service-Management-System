
<%@ Page Title="Admin Service History" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminServiceHistory.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminServiceHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .history-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .history-container {
            max-width: 1250px;
            margin: auto;
        }

        .history-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

            .history-header h2 {
                margin: 0 0 8px;
                font-size: 28px;
            }

            .history-header p {
                margin: 0;
            }

        .history-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #f3d5da;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

            .history-card h3 {
                color: #122f5c;
                margin-top: 0;
                margin-bottom: 20px;
            }

        .search-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .search-box {
            flex: 1;
            min-width: 220px;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .history-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

            .history-btn:hover {
                background: #c90d29;
            }

        .show-all-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .history-grid {
            width: 100%;
            border-collapse: collapse;
        }

            .history-grid th {
                background: #122f5c;
                color: white;
                padding: 13px;
                text-align: left;
                white-space: nowrap;
            }

            .history-grid td {
                padding: 12px;
                border: 1px solid #e5e9ef;
                color: #263b58;
                white-space: nowrap;
            }

            .history-grid tr:nth-child(even) {
                background: #fff8f9;
            }

        .history-message {
            display: block;
            margin-top: 15px;
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

        @media(max-width: 650px) {
            .history-page {
                padding: 20px 10px;
            }

            .history-card {
                padding: 16px;
            }

            .history-header h2 {
                font-size: 23px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="history-page">
        <div class="history-container">

            <div class="history-header">
                <h2>Service History</h2>
                <p>View and search all vehicle service records.</p>
            </div>

            <div class="history-card">
                <h3>Search Service Records</h3>

                <div class="search-row">
                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-box"
                        placeholder="Service ID, customer name or vehicle number">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="history-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="history-btn show-all-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="history-message">
                </asp:Label>
            </div>

            <div class="history-card">
                <h3>All Service Records</h3>

                <div class="table-wrap">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="history-grid"
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
                                DataField="VehicleBrand"
                                HeaderText="Brand" />

                            <asp:BoundField
                                DataField="VehicleModel"
                                HeaderText="Model" />

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

            <a href="Admin.aspx" class="back-link">&#8592; Back to Admin Dashboard
            </a>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
