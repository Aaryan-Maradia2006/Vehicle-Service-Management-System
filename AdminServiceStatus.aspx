<%@ Page Title="Service Status" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminServiceStatus.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminServiceStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .status-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .status-container {
            max-width: 1250px;
            margin: auto;
        }

        .status-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .status-header h2 {
            color: #122f5c;
            margin: 0 0 8px;
            font-size: 28px;
        }

        .status-header p {
            margin: 0;
        }

        .status-card {
            background: white;
            padding: 25px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

        .status-card h3 {
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

        .status-btn {
            background: #ed1233;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .status-btn:hover {
            background: #c90d29;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .status-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .status-grid th {
            background: #122f5c;
            color: white;
            padding: 13px;
            text-align: left;
            white-space: nowrap;
        }

        .status-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            white-space: nowrap;
        }

        .status-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .status-dropdown {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .update-btn {
            background: #122f5c;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .message {
            display: block;
            margin-top: 15px;
            line-height: 1.5;
        }

        .back-link {
            display: inline-block;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 650px) {
            .status-page {
                padding: 20px 10px;
            }

            .status-card {
                padding: 16px;
            }

            .status-header h2 {
                font-size: 23px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="status-page">
        <div class="status-container">

            <div class="status-header">
                <h2>Service Status Management</h2>
                <p>View service records and update their current status.</p>
            </div>

            <div class="status-card">
                <h3>Search Service Records</h3>

                <div class="search-row">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Service ID, customer name or vehicle number">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="status-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="status-btn reset-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>
            </div>

            <div class="status-card">
                <h3>Service Records</h3>

                <div class="table-wrap">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="status-grid"
                        DataKeyNames="ServiceHistoryId"
                        GridLines="None"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowUpdating="GridView1_RowUpdating"
                        OnRowDataBound="GridView1_RowDataBound"
                        EmptyDataText="No service records found.">

                        <Columns>

                            <asp:BoundField
                                DataField="ServiceHistoryId"
                                HeaderText="Service ID"
                                ReadOnly="true" />

                            <asp:BoundField
                                DataField="CustomerName"
                                HeaderText="Customer"
                                ReadOnly="true" />

                            <asp:BoundField
                                DataField="VehicleNumber"
                                HeaderText="Vehicle Number"
                                ReadOnly="true" />

                            <asp:BoundField
                                DataField="ServiceType"
                                HeaderText="Service Type"
                                ReadOnly="true" />

                            <asp:BoundField
                                DataField="BookingDate"
                                HeaderText="Booking Date"
                                DataFormatString="{0:dd-MM-yyyy}"
                                ReadOnly="true" />

                            <asp:TemplateField HeaderText="Service Status">
                                <ItemTemplate>
                                    <%# Eval("Status") %>
                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:DropDownList
                                        ID="ddlStatus"
                                        runat="server"
                                        CssClass="status-dropdown">
                                        <asp:ListItem Text="Pending" Value="Pending" />
                                        <asp:ListItem Text="In Progress" Value="In Progress" />
                                        <asp:ListItem Text="Completed" Value="Completed" />
                                        <asp:ListItem Text="Cancelled" Value="Cancelled" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="Amount"
                                HeaderText="Amount"
                                DataFormatString="₹{0:0.00}"
                                ReadOnly="true" />

                            <asp:CommandField
                                ShowEditButton="true"
                                EditText="Edit"
                                UpdateText="Update"
                                CancelText="Cancel" />

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