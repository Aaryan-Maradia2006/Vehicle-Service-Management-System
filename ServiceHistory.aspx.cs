using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class ServiceHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // User login karelo che ke nahi check karo
            if (Session["CustomerName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadServiceHistory();
            }
        }

        // =========================================
        // LOAD LOGGED-IN USER SERVICE HISTORY
        // =========================================
        private void LoadServiceHistory()
        {
            try
            {
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
                        WHERE CustomerName = @CustomerName
                        ORDER BY ServiceHistoryId DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@CustomerName",
                            customerName
                        );

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();

                            da.Fill(dt);

                            GridView1.DataSource = dt;
                            GridView1.DataBind();
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PayService")
            {
                // Check login
                if (Session["CustomerName"] == null)
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "LoginMessage",
                        "alert('Please login first to make payment.');",
                        true
                    );

                    return;
                }

                // Get Service ID
                string serviceId = e.CommandArgument.ToString();

                // Go to Payment Page
                Response.Redirect("Payment.aspx?ServiceId=" + serviceId);
            }
        }
    }
}