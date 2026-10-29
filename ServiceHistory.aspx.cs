using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class ServiceHistory : System.Web.UI.Page
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
                LoadServiceHistory();
            }
        }

        // Show logged-in customer's service history
        void LoadServiceHistory()
        {
            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT ServiceHistoryId,
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
                    WHERE CustomerId = @CustomerId
                    ORDER BY ServiceHistoryId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

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

        // Handle PAY button
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PayService")
            {
                if (Session["CustomerId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                int serviceId;

                if (!int.TryParse(Convert.ToString(e.CommandArgument), out serviceId))
                {
                    ShowMessage("Invalid service ID.");
                    return;
                }

                int customerId = Convert.ToInt32(Session["CustomerId"]);

                using (SqlConnection con = new SqlConnection(s))
                {
                    string query = @"
                        SELECT PaymentStatus
                        FROM dbo.ServiceHistory
                        WHERE ServiceHistoryId = @ServiceId
                          AND CustomerId = @CustomerId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@ServiceId", SqlDbType.Int).Value = serviceId;
                        cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                        con.Open();

                        object result = cmd.ExecuteScalar();

                        if (result == null || result == DBNull.Value)
                        {
                            ShowMessage("Service record was not found.");
                            return;
                        }

                        string paymentStatus = result.ToString();

                        if (paymentStatus.Equals("Paid", StringComparison.OrdinalIgnoreCase))
                        {
                            ShowMessage("This service has already been paid.");
                            LoadServiceHistory();
                            return;
                        }

                        Response.Redirect("Payment.aspx?ServiceId=" + serviceId);
                    }
                }
            }
        }

        void ShowMessage(string message)
        {
            string safeMessage = message.Replace("\\", "\\\\")
                                        .Replace("'", "\\'")
                                        .Replace("\r", "")
                                        .Replace("\n", "");

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "HistoryMessage",
                "alert('" + safeMessage + "');",
                true
            );
        }
    }
}