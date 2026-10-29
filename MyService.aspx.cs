
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class MyService : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerName"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadMyServices();
            }
        }

        private void LoadMyServices()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT ServiceHistoryId, VehicleNumber,
                                 VehicleBrand, VehicleModel, ServiceType,
                                 BookingDate, Status, Amount
                                 FROM ServiceHistory
                                 WHERE CustomerName = @CustomerName
                                 ORDER BY ServiceHistoryId DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue(
                    "@CustomerName",
                    Session["CustomerName"].ToString()
                );

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (dt.Rows.Count == 0)
                {
                    lblMessage.Text = "No service bookings found for your account.";
                }
                else
                {
                    lblMessage.Text = "Total services: " + dt.Rows.Count;
                }
            }
        }
    }
}
