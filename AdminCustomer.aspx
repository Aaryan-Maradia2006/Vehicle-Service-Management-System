<%@ Page Title="Customer Management" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminCustomer.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .customer-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .customer-container {
            max-width: 1250px;
            margin: auto;
        }

        .customer-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

            .customer-header h2 {
                color: #122f5c;
                margin: 0 0 8px;
                font-size: 28px;
            }

            .customer-header p {
                color: white;
                margin: 0;
            }

        .customer-card {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #f3d5da;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

            .customer-card h3 {
                color: #122f5c;
                margin-top: 0;
                margin-bottom: 20px;
            }

        .search-input {
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .customer-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

            .customer-btn:hover {
                background: #c90d29;
            }

        .reset-btn {
            background: #122f5c;
        }

        .customer-grid {
            width: 100%;
            border-collapse: collapse;
        }

            .customer-grid th {
                background: #122f5c;
                color: white;
                padding: 13px;
                text-align: left;
                white-space: nowrap;
            }

            .customer-grid td {
                padding: 12px;
                border: 1px solid #e5e9ef;
                color: #263b58;
                white-space: nowrap;
            }

            .customer-grid tr:nth-child(even) {
                background: #fff8f9;
            }

        .customer-message {
            display: block;
            margin-top: 15px;
            line-height: 1.5;
        }

        .back-link {
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

            .back-link:hover {
                text-decoration: underline;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="customer-page">
        <div class="customer-container">

            <div class="customer-header">
                <h2>Customer Management</h2>
                <p>Manage registered customers and their details.</p>
            </div>

            <div class="customer-card">
                <h3>Search Customers</h3>

                <div class="search-row">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Search by name, mobile, email or vehicle number">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="customer-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="customer-btn reset-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="customer-message">
                </asp:Label>
            </div>

            <div class="customer-card">
                <h3>Registered Customers</h3>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="customer-grid"
                        GridLines="None"
                        EmptyDataText="No customers found.">

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
                                DataField="Email"
                                HeaderText="Email" />

                            <asp:BoundField
                                DataField="VehicleNumber"
                                HeaderText="Vehicle Number" />

                            <asp:BoundField
                                DataField="VehicleBrand"
                                HeaderText="Vehicle Brand" />

                            <asp:BoundField
                                DataField="VehicleModel"
                                HeaderText="Vehicle Model" />

                            <asp:BoundField
                                DataField="Address"
                                HeaderText="Address" />

                        </Columns>

                        <HeaderStyle BackColor="#126bff" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#f5f8ff" />

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
