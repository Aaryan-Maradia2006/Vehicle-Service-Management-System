<%@ Page Title="Admin Profile"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="VehicleServiceManagementSystem.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-page {
            min-height: 600px;
            padding: 35px 20px;
            background: #fff5f6;
            font-family: Arial, sans-serif;
        }

        .profile-container {
            max-width: 900px;
            margin: auto;
        }

        .profile-header {
            background: #ed1233;
            color: white;
            padding: 28px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .profile-header h2 {
            margin: 0 0 8px;
        }

        .profile-card {
            background: white;
            padding: 28px;
            border: 1px solid #f3d5da;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(18,47,92,.07);
        }

        .profile-avatar {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            background: #122f5c;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .profile-field label {
            display: block;
            color: #122f5c;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .profile-input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
        }

        .profile-input[readonly] {
            background: #f5f6f8;
            color: #555;
        }

        .profile-btn {
            background: #ed1233;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 22px;
        }

        .profile-btn:hover {
            background: #c90d29;
        }

        .profile-message {
            display: block;
            margin-top: 15px;
            line-height: 1.5;
        }

        .profile-note {
            margin-top: 20px;
            padding: 15px;
            background: #fff8e8;
            border: 1px solid #ffe0a0;
            border-radius: 8px;
            color: #805600;
            line-height: 1.6;
        }

        .back-link {
            display: inline-block;
            margin-top: 22px;
            color: #ed1233;
            text-decoration: none;
            font-weight: bold;
        }

        @media(max-width: 600px) {
            .profile-page {
                padding: 20px 10px;
            }

            .profile-card {
                padding: 18px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-page">
        <div class="profile-container">

            <div class="profile-header">
                <h2>Admin Profile</h2>
                <p>View your administrator account information.</p>
            </div>

            <div class="profile-card">

                <div class="profile-avatar">A</div>

                <h3 style="color:#122f5c;">Profile Information</h3>

                <div class="profile-grid">

                    <div class="profile-field">
                        <label>Admin Name</label>
                        <asp:TextBox
                            ID="txtAdminName"
                            runat="server"
                            CssClass="profile-input"
                            MaxLength="100">
                        </asp:TextBox>
                    </div>

                    <div class="profile-field">
                        <label>Username</label>
                        <asp:TextBox
                            ID="txtUsername"
                            runat="server"
                            CssClass="profile-input"
                            MaxLength="100">
                        </asp:TextBox>
                    </div>

                    <div class="profile-field">
                        <label>Email Address</label>
                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="profile-input"
                            TextMode="Email"
                            MaxLength="150">
                        </asp:TextBox>
                    </div>

                    <div class="profile-field">
                        <label>Account Role</label>
                        <asp:TextBox
                            ID="txtRole"
                            runat="server"
                            CssClass="profile-input"
                            Text="Administrator"
                            ReadOnly="true">
                        </asp:TextBox>
                    </div>

                </div>

                <asp:Button
                    ID="btnUpdate"
                    runat="server"
                    Text="Update Profile"
                    CssClass="profile-btn"
                    OnClick="btnUpdate_Click" />

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="profile-message">
                </asp:Label>

                <div class="profile-note">
                    <strong>Note:</strong>
                    Profile changes are not saved to the database in this version.
                    Database saving must be connected to your actual Admin table.
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