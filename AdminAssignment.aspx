<%@ Page Title="Service Assignment"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="AdminAssignment.aspx.cs"
    Inherits="VehicleServiceManagementSystem.AdminAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .assignment-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .assignment-container {
            max-width: 1200px;
            margin: auto;
        }

        .assignment-header {
            background: #ed1233;
            color: white;
            padding: 25px 30px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .assignment-header h2 {
            color: #122f5c;
            margin: 0 0 8px;
        }

        .assignment-card {
            background: white;
            padding: 25px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
            margin-bottom: 25px;
        }

        .assignment-card h3 {
            color: #122f5c;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .assignment-form {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .form-field label {
            display: block;
            color: #122f5c;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            background: white;
        }

        .assignment-btn {
            background: #ed1233;
            color: white;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        .assignment-btn:hover {
            background: #c90d29;
        }

        .search-row {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .search-input {
            flex: 1;
            min-width: 220px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .reset-btn {
            background: #122f5c;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .assignment-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .assignment-grid th {
            background: #122f5c;
            color: white;
            padding: 12px;
            text-align: left;
            white-space: nowrap;
        }

        .assignment-grid td {
            padding: 12px;
            border: 1px solid #e5e9ef;
            color: #263b58;
            white-space: nowrap;
        }

        .assignment-grid tr:nth-child(even) {
            background: #fff8f9;
        }

        .message {
            display: block;
            margin-top: 15px;
            line-height: 1.5;
        }

        .back-link {
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 650px) {
            .assignment-page {
                padding: 20px 10px;
            }

            .assignment-card {
                padding: 16px;
            }

            .assignment-form {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="assignment-page">
        <div class="assignment-container">

            <div class="assignment-header">
                <h2>Service Assignment</h2>
                <p>Assign service requests to mechanics.</p>
            </div>

            <div class="assignment-card">
                <h3>Assign Mechanic</h3>

                <div class="assignment-form">

                    <div class="form-field">
                        <label>Service Record</label>
                        <asp:DropDownList
                            ID="ddlService"
                            runat="server"
                            CssClass="form-input">
                        </asp:DropDownList>
                    </div>

                    <div class="form-field">
                        <label>Select Mechanic</label>
                        <asp:DropDownList
                            ID="ddlMechanic"
                            runat="server"
                            CssClass="form-input">
                        </asp:DropDownList>
                    </div>

                    <div class="form-field">
                        <label>Assignment Status</label>
                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="form-input">
                            <asp:ListItem Text="Assigned" Value="Assigned" />
                            <asp:ListItem Text="In Progress" Value="In Progress" />
                            <asp:ListItem Text="Completed" Value="Completed" />
                            <asp:ListItem Text="Cancelled" Value="Cancelled" />
                        </asp:DropDownList>
                    </div>

                </div>

                <asp:Button
                    ID="btnAssign"
                    runat="server"
                    Text="Assign Mechanic"
                    CssClass="assignment-btn"
                    OnClick="btnAssign_Click" />

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>
            </div>

            <div class="assignment-card">
                <h3>Search Assignments</h3>

                <div class="search-row">
                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Service ID, mechanic name or vehicle number">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="assignment-btn"
                        OnClick="btnSearch_Click" />

                    <asp:Button
                        ID="btnShowAll"
                        runat="server"
                        Text="Show All"
                        CssClass="assignment-btn reset-btn"
                        OnClick="btnShowAll_Click"
                        CausesValidation="false" />
                </div>
            </div>

            <div class="assignment-card">
                <h3>Assignment Records</h3>

                <div class="table-wrap">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="assignment-grid"
                        GridLines="None"
                        EmptyDataText="No assignments found.">

                        <Columns>
                            <asp:BoundField
                                DataField="AssignmentId"
                                HeaderText="Assignment ID" />

                            <asp:BoundField
                                DataField="ServiceHistoryId"
                                HeaderText="Service ID" />

                            <asp:BoundField
                                DataField="CustomerName"
                                HeaderText="Customer" />

                            <asp:BoundField
                                DataField="VehicleNumber"
                                HeaderText="Vehicle Number" />

                            <asp:BoundField
                                DataField="MechanicName"
                                HeaderText="Mechanic" />

                            <asp:BoundField
                                DataField="AssignedDate"
                                HeaderText="Assigned Date"
                                DataFormatString="{0:dd-MM-yyyy HH:mm}" />

                            <asp:BoundField
                                DataField="AssignmentStatus"
                                HeaderText="Assignment Status" />
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