using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminSearch : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecords();
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        private void LoadRecords()
        {
            SqlConnection con = new SqlConnection(s);

            string serviceId = txtServiceId.Text.Trim().Replace("'", "''");
            string customerName = txtCustomerName.Text.Trim().Replace("'", "''");
            string mobile = txtMobile.Text.Trim().Replace("'", "''");
            string vehicleNumber = txtVehicleNumber.Text.Trim().Replace("'", "''");
            string serviceType = txtServiceType.Text.Trim().Replace("'", "''");

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
                WHERE
                    ('" + serviceId + @"' = '' OR
                     CAST(ServiceHistoryId AS NVARCHAR(20))
                     LIKE '%" + serviceId + @"%')
                    AND
                    ('" + customerName + @"' = '' OR
                     CustomerName LIKE '%" + customerName + @"%')
                    AND
                    ('" + mobile + @"' = '' OR
                     Mobile LIKE '%" + mobile + @"%')
                    AND
                    ('" + vehicleNumber + @"' = '' OR
                     VehicleNumber LIKE '%" + vehicleNumber + @"%')
                    AND
                    ('" + serviceType + @"' = '' OR
                     ServiceType LIKE '%" + serviceType + @"%')
                ORDER BY ServiceHistoryId DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMessage.ForeColor =
                System.Drawing.Color.DarkGreen;

            lblMessage.Text =
                "Records found: " + dt.Rows.Count;

            da.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRecords();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtServiceId.Text = "";
            txtCustomerName.Text = "";
            txtMobile.Text = "";
            txtVehicleNumber.Text = "";
            txtServiceType.Text = "";

            LoadRecords();
        }
    }
}