
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class OnlinePayment : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }

        void LoadPaymentDetails()
        {
            int serviceId;

            if (!int.TryParse(Request.QueryString["ServiceId"], out serviceId) || serviceId <= 0)
            {
                lblServiceId.Text = "Not Available";
                lblAmount.Text = "₹0.00";

                ShowMessage("Service ID missing. Please open payment from Service History.");
                btnContinue.Enabled = false;
                return;
            }

            SqlConnection con = new SqlConnection(s);

            string query = "SELECT ServiceHistoryId, Amount FROM ServiceHistory WHERE ServiceHistoryId = @ServiceId";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ServiceId", serviceId);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblServiceId.Text = dr["ServiceHistoryId"].ToString();

                decimal amount = 0;

                if (dr["Amount"] != DBNull.Value)
                {
                    amount = Convert.ToDecimal(dr["Amount"]);
                }

                lblAmount.Text = "₹" + amount.ToString("0.00");

                btnContinue.Enabled = true;
                lblMessage.Text = "";
            }
            else
            {
                lblServiceId.Text = serviceId.ToString();
                lblAmount.Text = "₹0.00";

                ShowMessage("Service record was not found.");
                btnContinue.Enabled = false;
            }

            dr.Close();
            con.Close();
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int serviceId;

            if (int.TryParse(Request.QueryString["ServiceId"], out serviceId) && serviceId > 0)
            {
                Response.Redirect("PaymentSuccess.aspx?ServiceId=" + serviceId);
            }
            else
            {
                ShowMessage("Invalid Service ID.");
            }
        }

        void ShowMessage(string message)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = Server.HtmlEncode(message);
        }
    }
}
