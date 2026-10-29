
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class Payment : System.Web.UI.Page
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
                LoadPaymentDetails();
            }
        }

        private void LoadPaymentDetails()
        {
            int serviceId;

            if (!int.TryParse(Request.QueryString["ServiceId"], out serviceId))
            {
                Response.Redirect("ServiceHistory.aspx");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT ServiceHistoryId, CustomerName, Mobile,
                           VehicleNumber, VehicleBrand, VehicleModel,
                           ServiceType, BookingDate, Amount, PaymentStatus
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
                        if (dr.Read())
                        {
                            lblServiceId.Text = dr["ServiceHistoryId"].ToString();
                            lblCustomerName.Text = Server.HtmlEncode(dr["CustomerName"].ToString());
                            lblMobile.Text = Server.HtmlEncode(dr["Mobile"].ToString());
                            lblVehicleNumber.Text = Server.HtmlEncode(dr["VehicleNumber"].ToString());

                            lblVehicle.Text = Server.HtmlEncode(
                                dr["VehicleBrand"].ToString() + " " +
                                dr["VehicleModel"].ToString());

                            lblServiceType.Text = Server.HtmlEncode(dr["ServiceType"].ToString());

                            lblServiceDate.Text = dr["BookingDate"] != DBNull.Value
                                ? Convert.ToDateTime(dr["BookingDate"]).ToString("dd-MM-yyyy")
                                : "-";

                            decimal amount = 0;

                            if (dr["Amount"] != DBNull.Value)
                            {
                                amount = Convert.ToDecimal(dr["Amount"]);
                            }

                            lblAmount.Text = "₹" + amount.ToString("0.00");

                            if (string.Equals(
                                Convert.ToString(dr["PaymentStatus"]),
                                "Paid",
                                StringComparison.OrdinalIgnoreCase))
                            {
                                btnPay.Visible = false;
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                lblMessage.Text = "This service has already been paid.";
                            }
                            else
                            {
                                btnPay.Visible = true;
                                lblMessage.Text = "";
                            }
                        }
                        else
                        {
                            Response.Redirect("ServiceHistory.aspx");
                        }
                    }
                }
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int serviceId;

            if (!int.TryParse(Request.QueryString["ServiceId"], out serviceId))
            {
                Response.Redirect("ServiceHistory.aspx");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    UPDATE dbo.ServiceHistory
                    SET PaymentStatus = 'Paid'
                    WHERE ServiceHistoryId = @ServiceId
                      AND CustomerId = @CustomerId
                      AND (PaymentStatus IS NULL OR PaymentStatus <> 'Paid')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                    cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                    con.Open();

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        // Save the service ID for the next pages
                        Session["PaidServiceId"] = serviceId;

                        // Open Payment Success page
                        Response.Redirect("PaymentSuccess.aspx?ServiceId=" + serviceId);
                        return;
                    }

                    string checkQuery = @"
                        SELECT PaymentStatus
                        FROM dbo.ServiceHistory
                        WHERE ServiceHistoryId = @ServiceId
                          AND CustomerId = @CustomerId";

                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                        checkCmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                        object status = checkCmd.ExecuteScalar();

                        if (status != null &&
                            status != DBNull.Value &&
                            string.Equals(
                                status.ToString(),
                                "Paid",
                                StringComparison.OrdinalIgnoreCase))
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "This service has already been paid.";
                            btnPay.Visible = false;
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Payment could not be updated. Please try again.";
                        }
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceHistory.aspx");
        }
    }
}
