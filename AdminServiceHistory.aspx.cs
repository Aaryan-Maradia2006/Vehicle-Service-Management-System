using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminServiceHistory : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServiceHistory("");
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        private void LoadServiceHistory(string search)
        {
            SqlConnection con = new SqlConnection(s);

            search = search.Replace("'", "''");

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
                    '" + search + @"' = ''
                    OR CAST(ServiceHistoryId AS NVARCHAR(20))
                        LIKE '%" + search + @"%'
                    OR CustomerName LIKE '%" + search + @"%'
                    OR VehicleNumber LIKE '%" + search + @"%'
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
                "Total service records: " + dt.Rows.Count;

            da.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadServiceHistory(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadServiceHistory("");
        }
    }
}