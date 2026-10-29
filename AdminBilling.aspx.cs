
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminBilling : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlInvoice.Visible = false;
                lblMessage.Text = "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int serviceId;

            if (int.TryParse(txtServiceId.Text, out serviceId) && serviceId > 0)
            {
                LoadInvoice(serviceId);
            }
            else
            {
                pnlInvoice.Visible = false;
                ShowMessage("Please enter a valid Service ID.", false);
            }
        }

        void LoadInvoice(int serviceId)
        {
            SqlConnection con = new SqlConnection(s);

            string query = "SELECT ServiceHistoryId, CustomerName, Mobile, VehicleNumber, VehicleBrand, VehicleModel, ServiceType, BookingDate, Status, Amount FROM ServiceHistory WHERE ServiceHistoryId = @ServiceId";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ServiceId", serviceId);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblInvoiceId.Text = Server.HtmlEncode(dr["ServiceHistoryId"].ToString());
                lblCustomerName.Text = Server.HtmlEncode(dr["CustomerName"].ToString());
                lblMobile.Text = Server.HtmlEncode(dr["Mobile"].ToString());
                lblVehicleNumber.Text = Server.HtmlEncode(dr["VehicleNumber"].ToString());

                lblVehicle.Text = Server.HtmlEncode(
                    dr["VehicleBrand"].ToString() + " " +
                    dr["VehicleModel"].ToString());

                lblServiceType.Text = Server.HtmlEncode(dr["ServiceType"].ToString());
                lblStatus.Text = Server.HtmlEncode(dr["Status"].ToString());

                if (dr["BookingDate"] != DBNull.Value)
                {
                    lblServiceDate.Text = Convert.ToDateTime(dr["BookingDate"]).ToString("dd-MM-yyyy");
                }
                else
                {
                    lblServiceDate.Text = "N/A";
                }

                decimal amount = 0;

                if (dr["Amount"] != DBNull.Value)
                {
                    amount = Convert.ToDecimal(dr["Amount"]);
                }

                lblAmount.Text = "₹" + amount.ToString("0.00");

                pnlInvoice.Visible = true;
                lblMessage.Text = "";
            }
            else
            {
                pnlInvoice.Visible = false;
                ShowMessage("No service record found for this Service ID.", false);
            }

            dr.Close();
            con.Close();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtServiceId.Text = "";
            pnlInvoice.Visible = false;
            lblMessage.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            pnlInvoice.Visible = false;
            lblMessage.Text = "";
        }

        void ShowMessage(string message, bool success)
        {
            lblMessage.Text = Server.HtmlEncode(message);

            if (success)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
