using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class PaymentReceipt : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            else if (!IsPostBack)
            {
                LoadReceipt();
            }
        }

        void LoadReceipt()
        {
            int paymentId;

            if (!int.TryParse(
                Request.QueryString["PaymentId"], out paymentId)
                || paymentId <= 0)
            {
                Response.Redirect("ServiceHistory.aspx");
                return;
            }

            SqlConnection con = new SqlConnection(s);

            string customerName =
                Convert.ToString(Session["CustomerName"])
                .Replace("'", "''");

            string query = @"
                SELECT p.PaymentId, p.TransactionId, p.PaymentDate,
                       p.PaymentMethod, p.Amount, p.PaymentStatus,
                       sh.CustomerName, sh.Mobile, sh.VehicleNumber,
                       sh.VehicleBrand, sh.VehicleModel, sh.ServiceType
                FROM Payments p
                INNER JOIN ServiceHistory sh
                    ON sh.ServiceHistoryId = p.ServiceHistoryId
                WHERE p.PaymentId = " + paymentId + @"
                  AND sh.CustomerName = '" + customerName + @"'
                  AND p.PaymentStatus = 'Success'";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblReceiptId.Text =
                    dr["PaymentId"].ToString();

                lblTransaction.Text =
                    Server.HtmlEncode(
                        dr["TransactionId"].ToString());

                if (dr["PaymentDate"] != DBNull.Value)
                {
                    lblDate.Text =
                        Convert.ToDateTime(dr["PaymentDate"])
                        .ToString("dd-MM-yyyy hh:mm tt");
                }
                else if (dr["PaymentDate"] == DBNull.Value)
                {
                    lblDate.Text = "N/A";
                }

                lblCustomer.Text =
                    Server.HtmlEncode(
                        dr["CustomerName"].ToString());

                lblMobile.Text =
                    Server.HtmlEncode(
                        dr["Mobile"].ToString());

                lblVehicle.Text =
                    Server.HtmlEncode(
                        dr["VehicleNumber"].ToString());

                lblVehicleModel.Text =
                    Server.HtmlEncode(
                        dr["VehicleBrand"].ToString() + " " +
                        dr["VehicleModel"].ToString());

                lblService.Text =
                    Server.HtmlEncode(
                        dr["ServiceType"].ToString());

                lblMethod.Text =
                    Server.HtmlEncode(
                        dr["PaymentMethod"].ToString());

                if (dr["Amount"] != DBNull.Value)
                {
                    lblAmount.Text =
                        "₹" +
                        Convert.ToDecimal(dr["Amount"])
                        .ToString("0.00");
                }
                else if (dr["Amount"] == DBNull.Value)
                {
                    lblAmount.Text = "₹0.00";
                }

                lblStatus.Text =
                    Server.HtmlEncode(
                        dr["PaymentStatus"].ToString());

                lblStatus.ForeColor =
                    System.Drawing.Color.Green;
            }
            else if (!dr.Read())
            {
                dr.Close();
                con.Close();

                cmd.Dispose();
                con.Dispose();

                Response.Redirect("ServiceHistory.aspx");
                return;
            }

            dr.Close();
            con.Close();

            cmd.Dispose();
            con.Dispose();
        }
    }
}