using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        void LoadPaymentDetails()
        {
            int serviceId;

            if (!int.TryParse(
                Request.QueryString["ServiceId"],
                out serviceId) || serviceId <= 0)
            {
                lblServiceId.Text = "Not Available";
                lblAmount.Text = "₹0.00";
                lblStatus.Text = "Not Confirmed";
                lblMessage.Text =
                    "Please open this page from Online Payment.";

                return;
            }

            SqlConnection con = new SqlConnection(s);

            string query = @"
                SELECT ServiceHistoryId, Amount
                FROM ServiceHistory
                WHERE ServiceHistoryId = " + serviceId;

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblServiceId.Text =
                    dr["ServiceHistoryId"].ToString();

                decimal amount = 0;

                if (dr["Amount"] != DBNull.Value)
                {
                    amount = Convert.ToDecimal(dr["Amount"]);
                }
                else if (dr["Amount"] == DBNull.Value)
                {
                    amount = 0;
                }

                lblAmount.Text =
                    "₹" + amount.ToString("0.00");

                lblStatus.Text = "Not Confirmed";

                lblMessage.Text =
                    "This is a payment status page. " +
                    "No real payment has been processed.";
            }
            else if (!dr.Read())
            {
                lblServiceId.Text = serviceId.ToString();
                lblAmount.Text = "₹0.00";
                lblStatus.Text = "Not Found";

                lblMessage.Text =
                    "Service record was not found.";
            }

            dr.Close();
            con.Close();

            cmd.Dispose();
            con.Dispose();
        }
    }
}