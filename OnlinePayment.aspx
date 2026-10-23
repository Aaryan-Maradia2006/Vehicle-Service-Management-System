<%@ Page Title="Online Payment"
    Language="C#"
    MasterPageFile="~/Layout.Master"
    AutoEventWireup="true"
    CodeBehind="OnlinePayment.aspx.cs"
    Inherits="VehicleServiceManagementSystem.OnlinePayment" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .payment-page {
            background: #fff5f6;
            padding: 45px 20px 60px;
            min-height: 650px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .payment-container {
            max-width: 1150px;
            margin: auto;
        }

        .payment-heading {
            color: #ed1233;
            font-size: 34px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .payment-subtitle {
            color: #637995;
            margin-bottom: 28px;
            font-size: 16px;
        }

        .payment-layout {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 28px;
            align-items: start;
        }

        .payment-card,
        .summary-card {
            background: #fff;
            border: 1px solid #f4d5da;
            border-radius: 17px;
            overflow: hidden;
            box-shadow: 0 10px 28px rgba(30, 45, 65, .07);
        }

        .payment-content {
            padding: 28px;
        }

        .section-title {
            font-size: 22px;
            color: #102d55;
            font-weight: 700;
            margin: 0 0 10px;
        }

        .section-subtitle {
            color: #637995;
            margin-bottom: 24px;
        }

        .method-option {
            display: flex;
            align-items: center;
            gap: 18px;
            border: 1px solid #f3d5da;
            border-radius: 14px;
            padding: 20px;
            margin-bottom: 16px;
            cursor: pointer;
            background: #fff;
            transition: .2s;
        }

        .method-option:hover {
            border-color: #ed1233;
            background: #fffafb;
        }

        .method-option.selected {
            border: 1.5px solid #ed1233;
            background: #fff8f9;
        }

        .method-icon {
            min-width: 60px;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ffe7ec;
            border-radius: 13px;
            font-size: 28px;
        }

        .method-details {
            flex: 1;
        }

        .method-name {
            display: block;
            color: #102d55;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .method-description {
            display: block;
            color: #637995;
            font-size: 15px;
        }

        .method-radio {
            width: 21px;
            height: 21px;
            accent-color: #ed1233;
            cursor: pointer;
        }

        .payment-extra {
            display: none;
            padding: 20px;
            margin: 20px 0;
            background: #fffafb;
            border: 1px solid #f3d5da;
            border-radius: 13px;
        }

        .payment-extra.visible {
            display: block;
        }

        .extra-title {
            font-size: 19px;
            color: #ed1233;
            font-weight: bold;
            margin-bottom: 16px;
        }

        .upi-apps {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 10px;
        }

        .upi-app {
            border: 1px solid #f0d5da;
            background: #fff;
            border-radius: 10px;
            padding: 15px 8px;
            text-align: center;
            cursor: pointer;
            color: #102d55;
            font-weight: bold;
        }

        .upi-app.selected {
            border: 2px solid #ed1233;
            background: #fff0f3;
        }

        .upi-app input {
            accent-color: #ed1233;
        }

        .field-label {
            display: block;
            color: #102d55;
            font-weight: bold;
            margin: 14px 0 7px;
        }

        .payment-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #e2cbd0;
            border-radius: 9px;
            font-size: 15px;
            box-sizing: border-box;
        }

        .payment-input:focus {
            outline: none;
            border-color: #ed1233;
            box-shadow: 0 0 0 3px rgba(237, 18, 51, .09);
        }

        .cash-note {
            color: #637995;
            line-height: 1.7;
        }

        .summary-heading {
            background: #ed1233;
            color: white;
            padding: 25px;
        }

        .summary-heading h3 {
            font-size: 23px;
            font-weight: bold;
            margin: 0 0 8px;
        }

        .summary-heading p {
            margin: 0;
            color: white;
        }

        .summary-content {
            padding: 26px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            padding: 16px 0;
            border-bottom: 1px solid #f0e1e4;
        }

        .summary-label {
            color: #637995;
        }

        .summary-value {
            color: #102d55;
            font-weight: bold;
            text-align: right;
            overflow-wrap: anywhere;
        }

        .amount-label {
            color: #637995;
            margin-top: 22px;
        }

        .amount-value {
            font-size: 34px;
            font-weight: bold;
            color: #ed1233;
            margin: 12px 0 24px;
            overflow-wrap: anywhere;
        }

        .continue-btn {
            display: block;
            width: 100%;
            padding: 17px 15px;
            border: none;
            border-radius: 11px;
            background: #ed1233;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            transition: .2s;
        }

        .continue-btn:hover {
            background: #c90d29;
        }

        .continue-btn:disabled {
            background: #b8b8b8;
            cursor: not-allowed;
        }

        .back-link {
            display: block;
            text-align: center;
            margin: 22px 0;
            color: #ed1233;
            font-weight: bold;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .notice {
            background: #fff8e8;
            border: 1px solid #ffdfa0;
            color: #895900;
            padding: 15px;
            border-radius: 10px;
            font-size: 13px;
            line-height: 1.7;
            margin-top: 22px;
        }

        .message {
            display: block;
            margin-top: 15px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        @media (max-width: 800px) {
            .payment-layout {
                grid-template-columns: 1fr;
            }

            .payment-heading {
                font-size: 28px;
            }

            .payment-content,
            .summary-content {
                padding: 20px;
            }
        }

        @media (max-width: 430px) {
            .method-option {
                gap: 12px;
                padding: 14px;
            }

            .method-icon {
                min-width: 45px;
                width: 45px;
                height: 45px;
                font-size: 22px;
            }

            .upi-apps {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <script>
        function selectPaymentMethod(method) {
            document.getElementById(
                '<%= hfPaymentMethod.ClientID %>'
            ).value = method;

            var options = document.querySelectorAll('.method-option');

            options.forEach(function (option) {
                option.classList.remove('selected');
            });

            var selectedOption = document.getElementById(
                'option-' + method
            );

            if (selectedOption) {
                selectedOption.classList.add('selected');
            }

            document.getElementById('upiSection').classList.toggle(
                'visible', method === 'UPI'
            );

            document.getElementById('cardSection').classList.toggle(
                'visible', method === 'Card'
            );

            document.getElementById('cashSection').classList.toggle(
                'visible', method === 'Cash'
            );
        }

        function selectUpiApp(app) {
            document.getElementById(
                '<%= hfUpiApp.ClientID %>'
            ).value = app;

            var apps = document.querySelectorAll('.upi-app');

            apps.forEach(function (item) {
                item.classList.remove('selected');
            });

            var selected = document.getElementById('upi-' + app);

            if (selected) {
                selected.classList.add('selected');
            }
        }

        function validatePaymentForm() {
            var method = document.getElementById(
                '<%= hfPaymentMethod.ClientID %>'
            ).value;

            if (!method) {
                alert('Please select a payment method.');
                return false;
            }

            if (method === 'UPI') {
                var app = document.getElementById(
                    '<%= hfUpiApp.ClientID %>'
                ).value;

                if (!app) {
                    alert('Please select Google Pay, PhonePe or Paytm.');
                    return false;
                }
            }

            if (method === 'Card') {
                var name = document.getElementById(
                    '<%= txtCardName.ClientID %>'
                ).value.trim();

                var number = document.getElementById(
                    '<%= txtCardNumber.ClientID %>'
                ).value.replace(/\s/g, '');

                var expiry = document.getElementById(
                    '<%= txtExpiry.ClientID %>'
                ).value.trim();

                var cvv = document.getElementById(
                    '<%= txtCvv.ClientID %>'
                ).value.trim();

                if (!name || !number || !expiry || !cvv) {
                    alert('Please fill in all card fields.');
                    return false;
                }

                if (!/^\d{13,19}$/.test(number)) {
                    alert('Please enter a valid card number.');
                    return false;
                }

                if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiry)) {
                    alert('Enter expiry in MM/YY format.');
                    return false;
                }

                if (!/^\d{3,4}$/.test(cvv)) {
                    alert('Please enter a valid CVV.');
                    return false;
                }
            }

            return true;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="payment-page">
        <div class="payment-container">

            <h1 class="payment-heading">Online Payment</h1>

            <p class="payment-subtitle">
                Vehicle Service Management System / Secure Checkout
            </p>

            <asp:HiddenField ID="hfPaymentMethod" runat="server" />
            <asp:HiddenField ID="hfUpiApp" runat="server" />

            <div class="payment-layout">

                <div class="payment-card">
                    <div class="payment-content">

                        <h2 class="section-title">
                            Choose Payment Method
                        </h2>

                        <p class="section-subtitle">
                            Select your preferred payment option.
                        </p>

                        <div id="option-UPI"
                            class="method-option"
                            onclick="selectPaymentMethod('UPI')">

                            <div class="method-icon">💳</div>

                            <div class="method-details">
                                <span class="method-name">UPI Payment</span>
                                <span class="method-description">
                                    Choose Google Pay, PhonePe or Paytm.
                                </span>
                            </div>

                            <input type="radio"
                                class="method-radio"
                                name="paymentChoice"
                                aria-label="UPI Payment"
                                onclick="event.stopPropagation(); selectPaymentMethod('UPI');" />
                        </div>

                        <div id="option-Card"
                            class="method-option"
                            onclick="selectPaymentMethod('Card')">

                            <div class="method-icon">💳</div>

                            <div class="method-details">
                                <span class="method-name">
                                    Credit / Debit Card
                                </span>
                                <span class="method-description">
                                    Enter card details in the form below.
                                </span>
                            </div>

                            <input type="radio"
                                class="method-radio"
                                name="paymentChoice"
                                aria-label="Card Payment"
                                onclick="event.stopPropagation(); selectPaymentMethod('Card');" />
                        </div>

                        <div id="option-Cash"
                            class="method-option"
                            onclick="selectPaymentMethod('Cash')">

                            <div class="method-icon">💵</div>

                            <div class="method-details">
                                <span class="method-name">
                                    Cash at Service Center
                                </span>
                                <span class="method-description">
                                    Pay directly at the service center.
                                </span>
                            </div>

                            <input type="radio"
                                class="method-radio"
                                name="paymentChoice"
                                aria-label="Cash Payment"
                                onclick="event.stopPropagation(); selectPaymentMethod('Cash');" />
                        </div>

                        <div id="upiSection" class="payment-extra">

                            <div class="extra-title">Choose UPI App</div>

                            <div class="upi-apps">

                                <div id="upi-GooglePay"
                                    class="upi-app"
                                    onclick="selectUpiApp('GooglePay')">
                                    <input type="radio"
                                        name="upiChoice"
                                        aria-label="Google Pay"
                                        onclick="event.stopPropagation(); selectUpiApp('GooglePay');" />
                                    <br />
                                    📱 Google Pay
                                </div>

                                <div id="upi-PhonePe"
                                    class="upi-app"
                                    onclick="selectUpiApp('PhonePe')">
                                    <input type="radio"
                                        name="upiChoice"
                                        aria-label="PhonePe"
                                        onclick="event.stopPropagation(); selectUpiApp('PhonePe');" />
                                    <br />
                                    💜 PhonePe
                                </div>

                                <div id="upi-Paytm"
                                    class="upi-app"
                                    onclick="selectUpiApp('Paytm')">
                                    <input type="radio"
                                        name="upiChoice"
                                        aria-label="Paytm"
                                        onclick="event.stopPropagation(); selectUpiApp('Paytm');" />
                                    <br />
                                    🔵 Paytm
                                </div>

                            </div>

                            <p class="cash-note" style="margin-bottom:0; margin-top:15px;">
                                This project does not connect to a real UPI
                                gateway or generate a payable QR code.
                            </p>

                        </div>

                        <div id="cardSection" class="payment-extra">

                            <div class="extra-title">Card Details</div>

                            <label class="field-label"
                                for="<%= txtCardName.ClientID %>">
                                Cardholder Name
                            </label>

                            <asp:TextBox ID="txtCardName"
                                runat="server"
                                CssClass="payment-input"
                                MaxLength="80"
                                placeholder="Name on card" />

                            <label class="field-label"
                                for="<%= txtCardNumber.ClientID %>">
                                Card Number
                            </label>

                            <asp:TextBox ID="txtCardNumber"
                                runat="server"
                                CssClass="payment-input"
                                MaxLength="19"
                                placeholder="Card number"
                                inputmode="numeric" />

                            <label class="field-label"
                                for="<%= txtExpiry.ClientID %>">
                                Expiry (MM/YY)
                            </label>

                            <asp:TextBox ID="txtExpiry"
                                runat="server"
                                CssClass="payment-input"
                                MaxLength="5"
                                placeholder="MM/YY" />

                            <label class="field-label"
                                for="<%= txtCvv.ClientID %>">
                                CVV
                            </label>

                            <asp:TextBox ID="txtCvv"
                                runat="server"
                                CssClass="payment-input"
                                MaxLength="4"
                                TextMode="Password"
                                placeholder="CVV"
                                inputmode="numeric" />

                            <p class="cash-note">
                                Demo interface only. Do not enter real card
                                details. Card data is not processed.
                            </p>

                        </div>

                        <div id="cashSection" class="payment-extra">

                            <div class="extra-title">Cash Payment</div>

                            <p class="cash-note">
                                You can pay this amount directly at the
                                service center. Continuing will open the
                                payment status page; it will not confirm
                                that you have paid.
                            </p>

                        </div>

                    </div>
                </div>

                <div class="summary-card">

                    <div class="summary-heading">
                        <h3>Payment Summary</h3>
                        <p>Review your service payment details.</p>
                    </div>

                    <div class="summary-content">

                        <div class="summary-row">
                            <span class="summary-label">Service ID</span>

                            <asp:Label ID="lblServiceId"
                                runat="server"
                                CssClass="summary-value" />
                        </div>

                        <div class="amount-label">Total Amount</div>

                        <div class="amount-value">
                            <asp:Label ID="lblAmount"
                                runat="server"
                                Text="₹0.00" />
                        </div>

                        <asp:Button ID="btnContinue"
                            runat="server"
                            Text="CONTINUE"
                            CssClass="continue-btn"
                            OnClientClick="return validatePaymentForm();"
                            OnClick="btnContinue_Click"
                            CausesValidation="false" />

                        <asp:Label ID="lblMessage"
                            runat="server"
                            CssClass="message" />

                        <a href="ServiceHistory.aspx" class="back-link">
                            &#8592; Back to Service History
                        </a>

                        <div class="notice">
                            <strong>Important:</strong>
                            This page is a payment interface demonstration.
                            No money is transferred and no real payment is
                            confirmed.
                        </div>

                    </div>
                </div>

            </div>
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