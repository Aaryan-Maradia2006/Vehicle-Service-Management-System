
<%@ Page Title="Search Records" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminSearch.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .search-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .search-container {
            max-width: 1250px;
            margin: auto;
        }

        .search-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .search-header h2 {
            margin: 0 0 8px;
            font-size: 28px;
        }

        .search-header p {
            margin: 0;
        }

        .search-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #f3d5da;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

        .search-card h3 {
            color: #122f5c;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .filter-item label {
            display: block;
            color: #122f5c;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .filter-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .button-row {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 22px;
        }

        .search-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .search-btn:hover {
            background: #c90d29;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .records-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .records-grid th {
            background: #122f5c;
            color: white;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .records-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            white-space: nowrap;
        }

        .records-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .result-message {
            display: block;
            margin: 15px 0;
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
            .search-page {
                padding: 20px 10px;
            }

            .search-card {
                padding: 16px;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .search-header h2 {
                font-size: 23px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="search-page">
        <div class="search-container">

            <div class="search-header">
                <h2>Search Records</h2>
                <p>Find vehicle service records using different filters.</p>
            </div>

            <div class="search-card">
                <h3>Search Filters</h3>

                <div class="filter-grid">

                    <div class="filter-item">
                        <label>Service ID</label>
                        <asp:TextBox
                            ID="txtServiceId"
                            runat="server"
                            CssClass="filter-input"
                            placeholder="Enter Service ID">
                        </asp:TextBox>
                    </div>

                    <div class="filter-item">
                        <label>Customer Name</label>
                        <asp:TextBox
                            ID="txtCustomerName"
                            runat="server"
                            CssClass="filter-input"
                            placeholder="Enter Customer Name">
                        </asp:TextBox>
                    </div>

                    <div class="filter-item">
                        <label>Mobile Number</label>
                        <asp:TextBox
                            ID="txtMobile"
                            runat="server"
                            CssClass="filter-input"
                            placeholder="Enter Mobile Number">
                        </asp:TextBox>
                    </div>

                    <div class="filter-item">
                        <label>Vehicle Number</label>
                        <asp:TextBox
                            ID="txtVehicleNumber"
                            runat="server"
                            CssClass="filter-input"
                            placeholder="Enter Vehicle Number">
                        </asp:TextBox>
                    </div>

                    <div class="filter-item">
                        <label>Service Type</label>
                        <asp:TextBox
                            ID="txtServiceType"
                            runat="server"
                            CssClass="filter-input"
                            placeholder="Enter Service Type">
                        </asp:TextBox>
                    </div>

                </div>

                <div class="button-row">

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search Records"
                        CssClass="search-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnReset"
                        runat="server"
                        Text="Clear Filters"
                        CssClass="search-btn reset-btn"
                        OnClick="btnReset_Click"
                        CausesValidation="false" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="result-message">
                </asp:Label>

            </div>

            <div class="search-card">
                <h3>Search Results</h3>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="records-grid"
                        GridLines="None"
                        EmptyDataText="No matching records found.">

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