
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class PaymentReceipt : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadReceipt();
            }
        }

        private void LoadReceipt()
        {
            int serviceId;

            if (!int.TryParse(Request.QueryString["ServiceId"], out serviceId)
                || serviceId <= 0)
            {
                ShowReceiptError("Invalid service ID.");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT
                        ServiceHistoryId,
                        CustomerName,
                        Mobile,
                        VehicleNumber,
                        VehicleBrand,
                        VehicleModel,
                        ServiceType,
                        BookingDate,
                        Amount,
                        PaymentStatus
                    FROM dbo.ServiceHistory
                    WHERE ServiceHistoryId = @ServiceId
                      AND CustomerId = @CustomerId
                      AND PaymentStatus = 'Paid'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                    cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (!dr.Read())
                        {
                            ShowReceiptError(
                                "Receipt is unavailable. Please check your payment status.");
                            return;
                        }

                        lblReceiptId.Text =
                            "VSMS-" + dr["ServiceHistoryId"].ToString();

                        // Demo reference, not a real payment gateway transaction ID
                        lblTransaction.Text =
                            "DEMO-" + dr["ServiceHistoryId"].ToString();

                        if (dr["BookingDate"] != DBNull.Value)
                        {
                            lblDate.Text =
                                Convert.ToDateTime(dr["BookingDate"])
                                    .ToString("dd-MM-yyyy");
                        }
                        else
                        {
                            lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                        }

                        lblCustomer.Text =
                            Server.HtmlEncode(Convert.ToString(dr["CustomerName"]));

                        lblMobile.Text =
                            Server.HtmlEncode(Convert.ToString(dr["Mobile"]));

                        lblVehicle.Text =
                            Server.HtmlEncode(Convert.ToString(dr["VehicleNumber"]));

                        lblVehicleModel.Text =
                            Server.HtmlEncode(
                                Convert.ToString(dr["VehicleBrand"]) + " " +
                                Convert.ToString(dr["VehicleModel"]));

                        lblService.Text =
                            Server.HtmlEncode(Convert.ToString(dr["ServiceType"]));

                        lblMethod.Text = "Demo Payment";

                        decimal amount = 0;

                        if (dr["Amount"] != DBNull.Value)
                        {
                            amount = Convert.ToDecimal(dr["Amount"]);
                        }

                        lblAmount.Text = "₹" + amount.ToString("0.00");

                        lblStatus.Text = "Paid";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
        }

        private void ShowReceiptError(string message)
        {
            lblStatus.Text = "Not Confirmed";
            lblStatus.ForeColor = System.Drawing.Color.Red;

            lblMessage.Text = message;
            lblMessage.Visible = true;

            lnkHistory.Visible = true;
        }
    }
}
