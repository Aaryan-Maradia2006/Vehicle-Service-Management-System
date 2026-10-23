using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminReports : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
                LoadReport("");
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        private void LoadSummary()
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"
                SELECT
                    COUNT(*) AS TotalServices,
                    SUM(CASE
                        WHEN Status = 'Completed' THEN 1
                        ELSE 0
                    END) AS CompletedServices,
                    SUM(CASE
                        WHEN Status = 'Pending' THEN 1
                        ELSE 0
                    END) AS PendingServices,
                    COALESCE(SUM(Amount), 0) AS TotalAmount
                FROM ServiceHistory";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblTotalServices.Text =
                    Convert.ToString(dr["TotalServices"]);

                lblCompletedServices.Text =
                    Convert.ToString(dr["CompletedServices"]);

                lblPendingServices.Text =
                    Convert.ToString(dr["PendingServices"]);

                decimal totalAmount =
                    Convert.ToDecimal(dr["TotalAmount"]);

                lblTotalAmount.Text =
                    totalAmount.ToString("N2");
            }
            else if (!dr.Read())
            {
                lblTotalServices.Text = "0";
                lblCompletedServices.Text = "0";
                lblPendingServices.Text = "0";
                lblTotalAmount.Text = "0.00";
            }

            dr.Close();
            con.Close();

            cmd.Dispose();
            con.Dispose();
        }

        private void LoadReport(string status)
        {
            SqlConnection con = new SqlConnection(s);

            status = status.Replace("'", "''");

            string query = @"
                SELECT
                    ServiceHistoryId,
                    CustomerName,
                    Mobile,
                    VehicleNumber,
                    ServiceType,
                    BookingDate,
                    Status,
                    Amount
                FROM ServiceHistory
                WHERE
                    '" + status + @"' = ''
                    OR Status = '" + status + @"'
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
                "Records displayed: " + dt.Rows.Count;

            da.Dispose();
            cmd.Dispose();
            con.Dispose();
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