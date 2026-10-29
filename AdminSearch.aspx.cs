
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminSearch : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecords();
            }
        }

        private void LoadRecords()
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT ServiceHistoryId, CustomerName, Mobile,
                             VehicleNumber, VehicleBrand, VehicleModel,
                             ServiceType, BookingDate, Status, Amount
                             FROM ServiceHistory
                             WHERE
                             (@ServiceId = '' OR CAST(ServiceHistoryId AS NVARCHAR(20)) LIKE @ServiceIdSearch)
                             AND (@CustomerName = '' OR CustomerName LIKE @CustomerNameSearch)
                             AND (@Mobile = '' OR Mobile LIKE @MobileSearch)
                             AND (@VehicleNumber = '' OR VehicleNumber LIKE @VehicleNumberSearch)
                             AND (@ServiceType = '' OR ServiceType LIKE @ServiceTypeSearch)
                             ORDER BY ServiceHistoryId DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            string serviceId = txtServiceId.Text.Trim();
            string customerName = txtCustomerName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string vehicleNumber = txtVehicleNumber.Text.Trim();
            string serviceType = txtServiceType.Text.Trim();

            cmd.Parameters.AddWithValue("@ServiceId", serviceId);
            cmd.Parameters.AddWithValue("@ServiceIdSearch", "%" + serviceId + "%");

            cmd.Parameters.AddWithValue("@CustomerName", customerName);
            cmd.Parameters.AddWithValue("@CustomerNameSearch", "%" + customerName + "%");

            cmd.Parameters.AddWithValue("@Mobile", mobile);
            cmd.Parameters.AddWithValue("@MobileSearch", "%" + mobile + "%");

            cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
            cmd.Parameters.AddWithValue("@VehicleNumberSearch", "%" + vehicleNumber + "%");

            cmd.Parameters.AddWithValue("@ServiceType", serviceType);
            cmd.Parameters.AddWithValue("@ServiceTypeSearch", "%" + serviceType + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Records found: " + dt.Rows.Count;

            con.Close();
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
