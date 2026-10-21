<%@ Page Title="Admin Dashboard"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="Admin.aspx.cs"
    Inherits="VehicleServiceManagementSystem.Admin" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* ===== VEHICLE SERVICE ADMIN DASHBOARD ===== */

        :root {
            --primary-red: #ed1233;
            --navy-blue: #122f5c;
            --white: #ffffff;
            --light-pink: #fff5f6;
            --text-dark: #18243b;
            --text-muted: #6b7280;
            --border-color: #f0dfe3;
            --shadow: 0 8px 28px rgba(18, 47, 92, 0.08);
        }

        .admin-container {
            padding: 30px;
            background: var(--light-pink);
            min-height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            color: var(--text-dark);
        }

        /* Dashboard Header */

        .admin-header {
            position: relative;
            overflow: hidden;
            background: linear-gradient(120deg, #122f5c, #203f76);
            color: var(--white);
            padding: 32px 35px;
            border-radius: 18px;
            margin-bottom: 28px;
            box-shadow: 0 10px 30px rgba(18, 47, 92, 0.18);
            border-left: 6px solid var(--primary-red);
        }

            .admin-header::after {
                content: "";
                position: absolute;
                width: 220px;
                height: 220px;
                right: -65px;
                top: -110px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.07);
            }

            .admin-header h1 {
                color: #ffffff;
                margin: 0;
                font-size: 30px;
                font-weight: 750;
                letter-spacing: 0.3px;
            }

            .admin-header p {
                color: #ffffff;
                margin: 9px 0 0;
                font-size: 14px;
            }

        /* Dashboard Cards Grid */

        .admin-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        /* Individual Cards */

        .admin-card {
            position: relative;
            background: var(--white);
            padding: 25px;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            box-shadow: var(--shadow);
            transition: transform 0.25s ease, box-shadow 0.25s ease, border-color 0.25s ease;
            overflow: hidden;
        }

            .admin-card:hover {
                transform: translateY(-6px);
                border-color: rgba(237, 18, 51, 0.35);
                box-shadow: 0 15px 35px rgba(18, 47, 92, 0.13);
            }

            .admin-card::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 3px;
                background: linear-gradient( 90deg, var(--primary-red), var(--navy-blue) );
                transform: scaleX(0);
                transform-origin: left;
                transition: transform 0.25s ease;
            }

            .admin-card:hover::before {
                transform: scaleX(1);
            }

        /* Card Icons */

        .admin-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 55px;
            height: 55px;
            margin-bottom: 20px;
            border-radius: 15px;
            background: var(--light-pink);
            color: var(--primary-red);
            font-size: 24px;
            transition: all 0.25s ease;
        }

        .admin-card:hover .admin-icon {
            background: var(--primary-red);
            color: var(--white);
            transform: scale(1.06);
        }

        /* Card Text */

        .admin-card h3 {
            margin: 0 0 10px;
            color: var(--navy-blue);
            font-size: 18px;
            font-weight: 700;
        }

        .admin-card p {
            color: var(--text-muted);
            font-size: 13px;
            line-height: 1.7;
            min-height: 44px;
            margin: 0 0 16px;
        }

        /* Card Buttons */

        .admin-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            background: var(--primary-red);
            color: var(--white);
            padding: 11px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 650;
            border: 1px solid var(--primary-red);
            transition: all 0.25s ease;
        }

            .admin-btn:hover {
                background: var(--navy-blue);
                border-color: var(--navy-blue);
                color: var(--white);
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(18, 47, 92, 0.18);
            }

        /* Logout / Account Card */

        .logout-card {
            margin-top: 24px;
            text-align: center;
            padding: 24px;
            background: var(--white);
            border-top: 3px solid var(--navy-blue);
        }

            .logout-card h3 {
                font-size: 18px;
                color: var(--navy-blue);
            }

            .logout-card p {
                min-height: auto;
            }

        .logout-btn {
            background: var(--navy-blue);
            border-color: var(--navy-blue);
        }

            .logout-btn:hover {
                background: var(--primary-red);
                border-color: var(--primary-red);
            }

        /* Responsive Tablet */

        @media (max-width: 1000px) {
            .admin-container {
                padding: 22px;
            }

            .admin-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 18px;
            }
        }

        /* Responsive Mobile */

        @media (max-width: 600px) {
            .admin-container {
                padding: 14px;
            }

            .admin-header {
                padding: 25px 20px;
                border-radius: 13px;
            }

                .admin-header h1 {
                    font-size: 24px;
                }

            .admin-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }

            .admin-card {
                padding: 21px;
            }

                .admin-card p {
                    min-height: auto;
                }

            .admin-btn {
                padding: 10px 14px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="admin-container">

        <!-- ADMIN HEADER -->

        <div class="admin-header">

            <h1>Admin Dashboard
            </h1>

            <p>
                Vehicle Service Management System
            </p>

        </div>


        <!-- ADMIN MODULES -->

        <div class="admin-grid">


            <!-- CUSTOMER -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-users"></i>
                </div>

                <h3>Customer Management
                </h3>

                <p>
                    Manage registered customers and their details.
                </p>

                <a href="AdminCustomer.aspx"
                    class="admin-btn">Manage Customers
                </a>

            </div>


            <!-- VEHICLE -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-car"></i>
                </div>

                <h3>Vehicle Management
                </h3>

                <p>
                    Manage customer vehicles and vehicle information.
                </p>

                <a href="AdminVehicle.aspx"
                    class="admin-btn">Manage Vehicles
                </a>

            </div>


            <!-- MECHANIC -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-user-cog"></i>
                </div>

                <h3>Mechanic Management
                </h3>

                <p>
                    Manage mechanics and their service assignments.
                </p>

                <a href="AdminMechanic.aspx"
                    class="admin-btn">Manage Mechanics
                </a>

            </div>


            <!-- SERVICE BOOKING -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-calendar-check"></i>
                </div>

                <h3>Service Booking
                </h3>

                <p>
                    View and manage customer service bookings.
                </p>

                <a href="AdminBooking.aspx"
                    class="admin-btn">View Bookings
                </a>

            </div>


            <!-- SERVICE ASSIGNMENT -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-tasks"></i>
                </div>

                <h3>Service Assignment
                </h3>

                <p>
                    Assign service jobs to mechanics.
                </p>

                <a href="AdminAssignment.aspx"
                    class="admin-btn">Assign Service
                </a>

            </div>


            <!-- SERVICE STATUS -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-spinner"></i>
                </div>

                <h3>Service Status
                </h3>

                <p>
                    Check and update vehicle service status.
                </p>

                <a href="AdminServiceStatus.aspx"
                    class="admin-btn">Service Status
                </a>

            </div>


            <!-- BILLING -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-file-invoice"></i>
                </div>

                <h3>Billing & Invoice
                </h3>

                <p>
                    Manage service bills and invoices.
                </p>

                <a href="AdminBilling.aspx"
                    class="admin-btn">Manage Billing
                </a>

            </div>


            <!-- PAYMENT -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-credit-card"></i>
                </div>

                <h3>Payment Management
                </h3>

                <p>
                    View and manage customer payments.
                </p>

                <a href="AdminPayment.aspx"
                    class="admin-btn">Manage Payments
                </a>

            </div>


            <!-- SERVICE HISTORY -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-history"></i>
                </div>

                <h3>Service History
                </h3>

                <p>
                    View completed and previous service records.
                </p>

                <a href="AdminServiceHistory.aspx"
                    class="admin-btn">View History
                </a>

            </div>


            <!-- SEARCH -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-search"></i>
                </div>

                <h3>Search Records
                </h3>

                <p>
                    Search customer, vehicle and service records.
                </p>

                <a href="AdminSearch.aspx"
                    class="admin-btn">Search Records
                </a>

            </div>


            <!-- REPORTS -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-chart-bar"></i>
                </div>

                <h3>Reports
                </h3>

                <p>
                    View service, customer and payment reports.
                </p>

                <a href="AdminReports.aspx"
                    class="admin-btn">View Reports
                </a>

            </div>


            <!-- PROFILE -->

            <div class="admin-card">

                <div class="admin-icon">
                    <i class="fa fa-user"></i>
                </div>

                <h3>Admin Profile
                </h3>

                <p>
                    View admin account information.
                </p>

                <a href="AdminProfile.aspx"
                    class="admin-btn">My Profile
                </a>

            </div>

        </div>


        <!-- LOGOUT -->

        <div class="admin-card logout-card">

            <h3>Account
            </h3>

            <p>
                Logout from Admin Dashboard
            </p>

            <a href="Logout.aspx"
                class="admin-btn logout-btn">
                <i class="fa fa-sign-out-alt"></i>
                Logout
            </a>

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
