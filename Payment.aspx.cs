using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // User login che ke nahi?
            if (Session["CustomerName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }


        // =========================================
        // LOAD SERVICE DETAILS
        // =========================================

        private void LoadPaymentDetails()
        {
            try
            {
                string serviceId = Request.QueryString["ServiceId"];

                if (string.IsNullOrEmpty(serviceId))
                {
                    Response.Redirect("ServiceHistory.aspx");
                    return;
                }

                string customerName = Session["CustomerName"].ToString();

                string cs = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
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
                            Status,
                            Amount
                        FROM ServiceHistory
                        WHERE ServiceHistoryId = @ServiceId
                        AND CustomerName = @CustomerName";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@ServiceId",
                            serviceId
                        );

                        cmd.Parameters.AddWithValue(
                            "@CustomerName",
                            customerName
                        );


                        con.Open();

                        using (SqlDataReader dr =
                            cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblServiceId.Text =
                                    dr["ServiceHistoryId"].ToString();

                                lblCustomerName.Text =
                                    dr["CustomerName"].ToString();

                                lblMobile.Text =
                                    dr["Mobile"].ToString();

                                lblVehicleNumber.Text =
                                    dr["VehicleNumber"].ToString();

                                lblVehicle.Text =
                                    dr["VehicleBrand"].ToString()
                                    + " "
                                    + dr["VehicleModel"].ToString();

                                lblServiceType.Text =
                                    dr["ServiceType"].ToString();


                                if (dr["BookingDate"] != DBNull.Value)
                                {
                                    DateTime date =
                                        Convert.ToDateTime(
                                            dr["BookingDate"]
                                        );

                                    lblServiceDate.Text =
                                        date.ToString("dd-MM-yyyy");
                                }
                                else
                                {
                                    lblServiceDate.Text = "-";
                                }


                                if (dr["Amount"] != DBNull.Value)
                                {
                                    decimal amount =
                                        Convert.ToDecimal(
                                            dr["Amount"]
                                        );

                                    lblAmount.Text =
                                        "₹" + amount.ToString("0.00");
                                }
                                else
                                {
                                    lblAmount.Text =
                                        "₹0.00";
                                }
                            }
                            else
                            {
                                Response.Write(
                                    "<script>alert('Service record not found.');</script>"
                                );

                                Response.Redirect(
                                    "ServiceHistory.aspx"
                                );
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Error: " +
                    Server.HtmlEncode(ex.Message) +
                    "');</script>"
                );
            }
        }


        // =========================================
        // PAY NOW
        // =========================================

        protected void btnPay_Click(
            object sender,
            EventArgs e)
        {
            // Login check
            if (Session["CustomerName"] == null)
            {
                Response.Write(
                    "<script>alert('Please login first to make payment.');</script>"
                );

                return;
            }


            string serviceId =
                Request.QueryString["ServiceId"];


            if (string.IsNullOrEmpty(serviceId))
            {
                Response.Redirect(
                    "ServiceHistory.aspx"
                );

                return;
            }


            try
            {
                string cs = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;


                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    string query = @"
                        UPDATE ServiceHistory
                        SET Status = 'Paid'
                        WHERE ServiceHistoryId = @ServiceId
                        AND CustomerName = @CustomerName";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@ServiceId",
                            serviceId
                        );

                        cmd.Parameters.AddWithValue(
                            "@CustomerName",
                            Session["CustomerName"].ToString()
                        );


                        con.Open();

                        int result =
                            cmd.ExecuteNonQuery();


                        if (result > 0)
                        {
                            Response.Write(
                                "<script>" +
                                "alert('Payment Successful!');" +
                                "window.location='ServiceHistory.aspx';" +
                                "</script>"
                            );
                        }
                        else
                        {
                            Response.Write(
                                "<script>" +
                                "alert('Payment failed or service record not found.');" +
                                "</script>"
                            );
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Payment Error: " +
                    Server.HtmlEncode(ex.Message) +
                    "');</script>"
                );
            }
        }


        // =========================================
        // BACK BUTTON
        // =========================================

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "ServiceHistory.aspx"
            );
        }
    }
}