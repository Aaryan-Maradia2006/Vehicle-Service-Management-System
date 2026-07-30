<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="VehicleServiceManagementSystem.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       <div class="container py-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
            <h2>Customer Registration</h2>
        </div>

        <div class="card-body">

            <table class="table table-borderless">

                <tr>
                    <td><b>Full Name</b></td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>

                    <td><b>Mobile Number</b></td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><b>Email</b></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>

                    <td><b>Vehicle Number</b></td>
                    <td>
                        <asp:TextBox ID="txtVehicleNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><b>Vehicle Model</b></td>
                    <td>
                        <asp:TextBox ID="txtVehicleModel" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>

                    <td><b>Username</b></td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><b>Password</b></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </td>

                    <td><b>Confirm Password</b></td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><b>Address</b></td>
                    <td colspan="3">
                        <asp:TextBox ID="txtAddress" runat="server"
                            TextMode="MultiLine"
                            Rows="3"
                            CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center">
                        <asp:Button ID="btnRegister"
                            runat="server"
                            Text="Register"
                            CssClass="btn btn-primary px-5"
                            OnClick="btnRegister_Click" />

                        &nbsp;&nbsp;

                        <asp:Button ID="btnReset"
                            runat="server"
                            Text="Reset"
                            CssClass="btn btn-secondary px-5" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <hr />
                        <h4>Registered Details</h4>
                        <asp:Label ID="lblOutput" runat="server"></asp:Label>
                    </td>
                </tr>

            </table>

        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
