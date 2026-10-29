
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminReports : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
                LoadReport("");
            }
        }

        private void LoadSummary()
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT COUNT(*) AS TotalServices,
                             SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedServices,
                             SUM(CASE WHEN Status = 'Pending' THEN 1 ELSE 0 END) AS PendingServices,
                             COALESCE(SUM(Amount), 0) AS TotalAmount
                             FROM ServiceHistory";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotalServices.Text = dr["TotalServices"].ToString();
                lblCompletedServices.Text = dr["CompletedServices"].ToString();
                lblPendingServices.Text = dr["PendingServices"].ToString();

                decimal amount = Convert.ToDecimal(dr["TotalAmount"]);
                lblTotalAmount.Text = amount.ToString("N2");
            }

            dr.Close();
            con.Close();
        }

        private void LoadReport(string status)
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT ServiceHistoryId, CustomerName, Mobile,
                             VehicleNumber, ServiceType, BookingDate,
                             Status, Amount
                             FROM ServiceHistory";

            if (status != "")
            {
                query += " WHERE Status = @Status";
            }

            query += " ORDER BY ServiceHistoryId DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            if (status != "")
            {
                cmd.Parameters.AddWithValue("@Status", status);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Records displayed: " + dt.Rows.Count;

            con.Close();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadReport(ddlStatus.SelectedValue);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlStatus.SelectedIndex = 0;

            LoadSummary();
            LoadReport("");
        }
    }
}
