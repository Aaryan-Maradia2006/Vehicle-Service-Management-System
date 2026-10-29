
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        private readonly string s =
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }

        private void LoadPaymentDetails()
        {
            int serviceId;

            if (!int.TryParse(Request.QueryString["ServiceId"], out serviceId)
                || serviceId <= 0)
            {
                ShowFailure("Invalid service ID.");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT ServiceHistoryId, Amount, PaymentStatus
                    FROM dbo.ServiceHistory
                    WHERE ServiceHistoryId = @ServiceId
                      AND CustomerId = @CustomerId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                    cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (!dr.Read())
                        {
                            ShowFailure("Service record was not found.");
                            return;
                        }

                        lblServiceId.Text =
                            Convert.ToString(dr["ServiceHistoryId"]);

                        decimal amount = 0;

                        if (dr["Amount"] != DBNull.Value)
                        {
                            amount = Convert.ToDecimal(dr["Amount"]);
                        }

                        lblAmount.Text = "₹" + amount.ToString("0.00");

                        string paymentStatus =
                            Convert.ToString(dr["PaymentStatus"]);

                        if (string.Equals(
                            paymentStatus,
                            "Paid",
                            StringComparison.OrdinalIgnoreCase))
                        {
                            lblStatus.Text = "Paid";
                            lblStatus.CssClass = "detail-value status";

                            lblMessage.Text =
                                "Your demo payment status is marked as Paid.";

                            lnkReceipt.NavigateUrl = ResolveUrl(
                                "~/PaymentReceipt.aspx?ServiceId=" + serviceId);

                            lnkReceipt.Visible = true;
                        }
                        else
                        {
                            lblStatus.Text = "Not Paid";
                            lblStatus.CssClass = "detail-value";

                            lblMessage.Text =
                                "Payment is not confirmed. Please return to the payment page.";

                            lnkReceipt.Visible = false;
                        }
                    }
                }
            }
        }

        private void ShowFailure(string message)
        {
            lblServiceId.Text = "Not Available";
            lblAmount.Text = "₹0.00";
            lblStatus.Text = "Not Confirmed";
            lblStatus.CssClass = "detail-value";

            lblMessage.Text = message;
            lnkReceipt.Visible = false;
        }
    }
}
