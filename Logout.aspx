<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="VehicleServiceManagementSystem.Logout" %>

<%-- Header --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%-- Contain --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5 text-center">
        <div class="card shadow p-5">
            <h2 class="text-primary mb-3">Logout Successful</h2>
            <p class="mb-4">You have been logged out successfully.</p>

            <a href="Login.aspx" class="btn btn-primary px-5 py-3">
                Login Again
            </a>
        </div>
    </div>
</asp:Content>

<%-- Footer --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
