<%@ Page Title="Mechanic Management" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdminMechanic.aspx.cs" Inherits="VehicleServiceManagementSystem.AdminMechanic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .mechanic-page {
            background: #fff5f6;
            min-height: 650px;
            padding: 30px 20px;
            font-family: Arial, sans-serif;
            color: #16325c;
        }

        .mechanic-container {
            max-width: 1250px;
            margin: auto;
        }



        .mechanic-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 10px;
            margin-bottom: 22px;
        }

        .mechanic-header h2 {
            margin: 0 0 8px;
            font-size: 28px;
            color: #122f5c;
        }

        .mechanic-header p {
            margin: 0;
            color: white;
        }

        .mechanic-cards {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 22px;
        }

        .mechanic-stat {
            background: white;
            border: 1px solid #f3d5da;
            border-radius: 10px;
            padding: 22px;
            box-shadow: 0 4px 15px rgba(18,47,92,.05);
        }

        .mechanic-stat span {
            display: block;
            color: #5d6e85;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .mechanic-stat strong {
            font-size: 28px;
            color: #122f5c;
        }

        .mechanic-card {
            background: white;
            border: 1px solid #f3d5da;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 22px;
            box-shadow: 0 4px 15px rgba(18,47,92,.05);
        }

        .mechanic-card h3 {
            margin: 0 0 20px;
            font-size: 22px;
            color: #122f5c;
        }

        .mechanic-form {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
        }

        .mechanic-field label {
            display: block;
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 8px;
            color: #16325c;
        }

        .mechanic-input,
        .mechanic-select {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border: 1px solid #d5dce6;
            border-radius: 7px;
            font-size: 15px;
            background: white;
            color: #16325c;
        }

        .mechanic-input:focus,
        .mechanic-select:focus {
            outline: none;
            border-color: #ed1233;
            box-shadow: 0 0 0 3px rgba(237,18,51,.08);
        }

        .mechanic-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 22px;
        }

        .mechanic-btn {
            display: inline-block;
            padding: 11px 20px;
            border: none;
            border-radius: 7px;
            color: white;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .mechanic-btn-red {
            background: #ed1233;
        }

        .mechanic-btn-red:hover {
            background: #c90e2a;
            color: white;
        }

        .mechanic-btn-navy {
            background: #122f5c;
        }

        .mechanic-btn-navy:hover {
            background: #0b2143;
            color: white;
        }

        .mechanic-btn-green {
            background: #198754;
        }

        .mechanic-btn-green:hover {
            background: #146c43;
            color: white;
        }

        .mechanic-btn-small {
            padding: 8px 12px;
            font-size: 13px;
            white-space: nowrap;
        }

        .mechanic-search {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr auto auto;
            gap: 12px;
            align-items: center;
        }

        .mechanic-message {
            display: block;
            margin-top: 16px;
            font-weight: bold;
            line-height: 1.6;
        }

        .mechanic-table-wrap {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e1e7ef;
            border-radius: 8px;
        }

        .mechanic-grid {
            width: 100%;
            min-width: 1050px;
            border-collapse: collapse;
            background: white;
        }

        .mechanic-grid th {
            background: #122f5c;
            color: white;
            padding: 15px 13px;
            text-align: left;
            font-size: 14px;
            white-space: nowrap;
            border: 1px solid #29466f;
        }

        .mechanic-grid td {
            padding: 15px 13px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            font-size: 14px;
            vertical-align: middle;
        }

        .mechanic-grid tr:nth-child(even) {
            background: #f7f9fc;
        }

        .mechanic-grid tr:hover {
            background: #fff0f2;
        }

        .mechanic-grid a {
            color: white;
        }

        .mechanic-status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #d9f7e8;
            color: #137344;
            font-weight: bold;
            font-size: 12px;
        }

        .mechanic-back {
            display: inline-block;
            margin-top: 2px;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        .mechanic-back:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .mechanic-cards {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .mechanic-form {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .mechanic-search {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 600px) {
            .mechanic-page {
                padding: 18px 10px;
            }

            .mechanic-header,
            .mechanic-card {
                padding: 18px;
            }

            .mechanic-header h2 {
                font-size: 23px;
            }

            .mechanic-cards,
            .mechanic-form,
            .mechanic-search {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mechanic-page">
        <div class="mechanic-container">

            <div class="mechanic-header">
                <h2>Mechanic Management</h2>
                <p>Manage mechanics, account status and service workload from one place.</p>
            </div>

            <!-- Dashboard Cards -->
            <div class="mechanic-cards">

                <div class="mechanic-stat">
                    <span>Total Mechanics</span>
                    <strong><asp:Label ID="lblTotalMechanics" runat="server" Text="0" /></strong>
                </div>

                <div class="mechanic-stat">
                    <span>Active Mechanics</span>
                    <strong><asp:Label ID="lblActiveMechanics" runat="server" Text="0" /></strong>
                </div>

                <div class="mechanic-stat">
                    <span>Inactive Mechanics</span>
                    <strong><asp:Label ID="lblInactiveMechanics" runat="server" Text="0" /></strong>
                </div>

                <div class="mechanic-stat">
                    <span>Total Assignments</span>
                    <strong><asp:Label ID="lblTotalAssignments" runat="server" Text="0" /></strong>
                </div>

            </div>

            <!-- Add Mechanic -->
            <div class="mechanic-card">
                <h3>Add New Mechanic</h3>

                <div class="mechanic-form">

                    <div class="mechanic-field">
                        <label>Mechanic Name *</label>
                        <asp:TextBox ID="txtMechanicName" runat="server"
                            CssClass="mechanic-input"
                            MaxLength="100"
                            placeholder="Enter mechanic name" />
                    </div>

                    <div class="mechanic-field">
                        <label>Mobile</label>
                        <asp:TextBox ID="txtMobile" runat="server"
                            CssClass="mechanic-input"
                            MaxLength="15"
                            placeholder="Enter mobile number" />
                    </div>

                    <div class="mechanic-field">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="mechanic-input"
                            MaxLength="100"
                            TextMode="Email"
                            placeholder="Enter email address" />
                    </div>

                    <div class="mechanic-field">
                        <label>Specialization</label>
                        <asp:TextBox ID="txtSpecialization" runat="server"
                            CssClass="mechanic-input"
                            MaxLength="100"
                            placeholder="e.g. Engine, Electrical, General Service" />
                    </div>

                    <div class="mechanic-field">
                        <label>Address</label>
                        <asp:TextBox ID="txtAddress" runat="server"
                            CssClass="mechanic-input"
                            MaxLength="250"
                            placeholder="Enter address" />
                    </div>

                    <div class="mechanic-field">
                        <label>Account Status</label>
                        <asp:DropDownList ID="ddlStatus" runat="server"
                            CssClass="mechanic-select">
                            <asp:ListItem Text="Active" Value="1" />
                            <asp:ListItem Text="Inactive" Value="0" />
                        </asp:DropDownList>
                    </div>

                </div>

                <div class="mechanic-actions">
                    <asp:Button ID="btnAddMechanic" runat="server"
                        Text="Add Mechanic"
                        CssClass="mechanic-btn mechanic-btn-red"
                        OnClick="btnAddMechanic_Click" />

                    <asp:Button ID="btnClear" runat="server"
                        Text="Clear Form"
                        CssClass="mechanic-btn mechanic-btn-navy"
                        OnClick="btnClear_Click"
                        CausesValidation="false" />
                </div>

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="mechanic-message" />
            </div>

            <!-- Search and Filter -->
            <div class="mechanic-card">
                <h3>Search &amp; Filter Mechanics</h3>

                <div class="mechanic-search">

                    <asp:TextBox ID="txtSearch" runat="server"
                        CssClass="mechanic-input"
                        placeholder="Search name, mobile, email or specialization" />

                    <asp:DropDownList ID="ddlFilterStatus" runat="server"
                        CssClass="mechanic-select">
                        <asp:ListItem Text="All Statuses" Value="All" />
                        <asp:ListItem Text="Active" Value="1" />
                        <asp:ListItem Text="Inactive" Value="0" />
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlSort" runat="server"
                        CssClass="mechanic-select">
                        <asp:ListItem Text="ID: Low to High" Value="ASC" />
                        <asp:ListItem Text="ID: High to Low" Value="DESC" />
                        <asp:ListItem Text="Name: A to Z" Value="NAME" />
                    </asp:DropDownList>

                    <asp:Button ID="btnSearch" runat="server"
                        Text="Search"
                        CssClass="mechanic-btn mechanic-btn-red"
                        OnClick="btnSearch_Click" />

                    <asp:Button ID="btnShowAll" runat="server"
                        Text="Show All"
                        CssClass="mechanic-btn mechanic-btn-navy"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />

                </div>
            </div>

            <!-- Mechanics Grid -->
            <div class="mechanic-card">
                <h3>Registered Mechanics &amp; Service Workload</h3>

                <div class="mechanic-table-wrap">

                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="mechanic-grid"
                        GridLines="None"
                        DataKeyNames="MechanicId"
                        OnRowCommand="GridView1_RowCommand"
                        EmptyDataText="No mechanic records found.">

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

                            <asp:BoundField DataField="Address"
                                HeaderText="Address" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class="mechanic-status">
                                        <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="TotalAssignments"
                                HeaderText="Total Assignments" />

                            <asp:BoundField DataField="InProgress"
                                HeaderText="In Progress" />

                            <asp:BoundField DataField="Completed"
                                HeaderText="Completed" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDeactivate" runat="server"
                                        Text="Deactivate"
                                        CssClass="mechanic-btn mechanic-btn-green mechanic-btn-small"
                                        CommandName="ToggleStatus"
                                        CommandArgument='<%# Eval("MechanicId") %>'
                                        CausesValidation="false"
                                        Visible='<%# Convert.ToBoolean(Eval("IsActive")) %>'
                                        OnClientClick="return confirm('Are you sure you want to deactivate this mechanic?');" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </div>
            </div>

            <a href="Admin.aspx" class="mechanic-back">
                &#8592; Back to Admin Dashboard
            </a>

        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>