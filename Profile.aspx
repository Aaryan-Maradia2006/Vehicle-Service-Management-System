<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="VehicleServiceManagementSystem.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
            width: 70%;
            margin: 40px auto;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }

        .profile-header {
            background: #ed1b2f;
            color: white;
            text-align: center;
            padding: 20px;
        }

            .profile-header h2 {
                color: white;
                margin: 0;
                font-weight: bold;
            }

            .profile-header p {
                margin: 5px 0 0;
                color: white;
            }

        .profile-body {
            padding: 25px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .profile-field {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }

            .profile-field.full {
                grid-column: span 2;
            }

            .profile-field label {
                display: block;
                font-weight: bold;
                font-size: 13px;
                color: #555;
                margin-bottom: 8px;
            }

        .profile-value {
            color: #222;
        }

        .profile-input {
            width: 100%;
            padding: 9px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .section-title {
            color: #ed1b2f;
            font-size: 20px;
            font-weight: bold;
            margin: 25px 0 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid #ed1b2f;
        }

        .button-area {
            text-align: center;
            margin-top: 25px;
        }

        .btn-update {
            background: #ed1b2f;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-save {
            background: #198754;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 8px;
        }

        .btn-cancel {
            background: #6c757d;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 8px;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }

        @media (max-width: 768px) {

            .profile-container {
                width: 95%;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-field.full {
                grid-column: span 1;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="profile-container">
        <!-- HEADER -->
        <div class="profile-header">
            <h2>My Profile
            </h2>
            <p>
                Customer Account Details
            </p>
        </div>
        <div class="profile-body">

            <!-- CUSTOMER DETAILS -->

            <div class="profile-grid">

                <!-- Customer ID -->

                <div class="profile-field">
                    <label>
                        Customer ID
                    </label>
                    <asp:Label
                        ID="lblCustomerId"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>
                </div>

                <!-- Full Name -->

                <div class="profile-field">

                    <label>
                        Full Name
                    </label>

                    <asp:Label
                        ID="lblFullName"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Mobile -->

                <div class="profile-field">

                    <label>
                        Mobile Number
                    </label>

                    <asp:Label
                        ID="lblMobile"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtMobile"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Email -->

                <div class="profile-field">

                    <label>
                        Email
                    </label>

                    <asp:Label
                        ID="lblEmail"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Username -->

                <div class="profile-field">

                    <label>
                        Username
                    </label>

                    <asp:Label
                        ID="lblUsername"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtUsername"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Password -->

                <div class="profile-field">

                    <label>
                        Password
                    </label>

                    <asp:Label
                        ID="lblPassword"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Address -->

                <div class="profile-field full">

                    <label>
                        Address
                    </label>

                    <asp:Label
                        ID="lblAddress"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtAddress"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>

            </div>


            <!-- VEHICLE DETAILS -->

            <div class="section-title">
                Vehicle Details
            </div>


            <div class="profile-grid">

                <!-- Vehicle Number -->

                <div class="profile-field">

                    <label>
                        Vehicle Number
                    </label>

                    <asp:Label
                        ID="lblVehicleNumber"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtVehicleNumber"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Vehicle Brand -->

                <div class="profile-field">

                    <label>
                        Vehicle Brand
                    </label>

                    <asp:Label
                        ID="lblVehicleBrand"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtVehicleBrand"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>


                <!-- Vehicle Model -->

                <div class="profile-field">

                    <label>
                        Vehicle Model
                    </label>

                    <asp:Label
                        ID="lblVehicleModel"
                        runat="server"
                        CssClass="profile-value">
                    </asp:Label>

                    <asp:TextBox
                        ID="txtVehicleModel"
                        runat="server"
                        CssClass="profile-input"
                        Visible="false">
                    </asp:TextBox>

                </div>

            </div>


            <!-- BUTTONS -->

            <div class="button-area">

                <asp:Button
                    ID="btnUpdate"
                    runat="server"
                    Text="Update Profile"
                    CssClass="btn-update"
                    OnClick="btnUpdate_Click" />

                <asp:Button
                    ID="btnSave"
                    runat="server"
                    Text="Save Changes"
                    CssClass="btn-save"
                    Visible="false"
                    OnClick="btnSave_Click" />

                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="btn-cancel"
                    Visible="false"
                    OnClick="btnCancel_Click" />

            </div>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">
</asp:Content>


<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">
</asp:Content>
