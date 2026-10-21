<%@ Page Title="Mechanic Management" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminMechanic.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminMechanic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .mechanic-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .mechanic-container {
            max-width: 1200px;
            margin: auto;
        }

        .mechanic-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .mechanic-header h2 {
            color: #122f5c;
            margin: 0 0 8px;
        }

        .mechanic-card {
            background: white;
            padding: 25px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

        .mechanic-card h3 {
            color: #122f5c;
            margin-top: 0;
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
        }

        .mechanic-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .mechanic-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .mechanic-grid th {
            background: #122f5c;
            color: white;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .mechanic-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
        }

        .mechanic-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .message {
            display: block;
            margin-top: 15px;
        }

        .back-link {
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 650px) {
            .mechanic-page {
                padding: 20px 10px;
            }

            .mechanic-card {
                padding: 16px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mechanic-page">
        <div class="mechanic-container">

            <div class="mechanic-header">
                <h2>Mechanic Management</h2>
                <p>View and search mechanic information.</p>
            </div>

            <div class="mechanic-card">
                <h3>Search Mechanics</h3>

                <div class="search-row">
                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Name, mobile, email or specialization">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="mechanic-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="mechanic-btn reset-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>
            </div>

            <div class="mechanic-card">
                <h3>Registered Mechanics</h3>

                <div class="table-wrap">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="mechanic-grid"
                        EmptyDataText="No mechanic records found."
                        GridLines="None">

                        <Columns>
                            <asp:BoundField DataField="MechanicId"
                                HeaderText="Mechanic ID" />

                            <asp:BoundField DataField="MechanicName"
                                HeaderText="Mechanic Name" />

                            <asp:BoundField DataField="Mobile"
                                HeaderText="Mobile" />

                            <asp:BoundField DataField="Email"
                                HeaderText="Email" />

                            <asp:BoundField DataField="Specialization"
                                HeaderText="Specialization" />
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