<%@ Page Title="Vehicle Management" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminVehicle.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminVehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .vehicle-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .vehicle-container {
            max-width: 1250px;
            margin: auto;
        }

        .vehicle-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .vehicle-header h2 {
            color: #122f5c;
            margin: 0 0 8px;
            font-size: 28px;
        }

        .vehicle-header p {
            margin: 0;
        }

        .vehicle-summary {
            background: white;
            padding: 22px 25px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
        }

        .vehicle-summary h3 {
            color: #52627a;
            font-size: 15px;
            margin: 0 0 12px;
        }

        .vehicle-count {
            color: #122f5c;
            font-size: 30px;
            font-weight: bold;
        }

        .vehicle-card {
            background: white;
            padding: 25px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
        }

        .vehicle-card h3 {
            color: #122f5c;
            margin: 0 0 20px;
        }

        .search-row {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .search-input {
            flex: 1;
            min-width: 220px;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .vehicle-btn {
            background: #ed1233;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .vehicle-btn:hover {
            background: #c90d29;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .vehicle-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .vehicle-grid th {
            background: #122f5c;
            color: white;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .vehicle-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            white-space: nowrap;
        }

        .vehicle-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .vehicle-message {
            display: block;
            margin-top: 15px;
            line-height: 1.5;
        }

        .back-link {
            display: inline-block;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
            margin-top: 5px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media(max-width: 650px) {
            .vehicle-page {
                padding: 20px 10px;
            }

            .vehicle-card {
                padding: 16px;
            }

            .vehicle-header h2 {
                font-size: 23px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="vehicle-page">
        <div class="vehicle-container">

            <div class="vehicle-header">
                <h2>Vehicle Management</h2>
                <p>Manage customer vehicles and vehicle information.</p>
            </div>

            <div class="vehicle-summary">
                <h3>Total Registered Vehicles</h3>
                <div class="vehicle-count">
                    <asp:Label
                        ID="lblTotalVehicles"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>
            </div>

            <div class="vehicle-card">
                <h3>Search Vehicles</h3>

                <div class="search-row">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Vehicle number, brand, model, customer name or ID">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="vehicle-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="vehicle-btn reset-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="vehicle-message">
                </asp:Label>
            </div>

            <div class="vehicle-card">
                <h3>Registered Vehicles</h3>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="vehicle-grid"
                        GridLines="None"
                        EmptyDataText="No vehicle records found.">

                        <Columns>

                            <asp:BoundField
                                DataField="CustomerId"
                                HeaderText="Customer ID" />

                            <asp:BoundField
                                DataField="FullName"
                                HeaderText="Customer Name" />

                            <asp:BoundField
                                DataField="Mobile"
                                HeaderText="Mobile" />

                            <asp:BoundField
                                DataField="VehicleNumber"
                                HeaderText="Vehicle Number" />

                            <asp:BoundField
                                DataField="VehicleBrand"
                                HeaderText="Vehicle Brand" />

                            <asp:BoundField
                                DataField="VehicleModel"
                                HeaderText="Vehicle Model" />

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