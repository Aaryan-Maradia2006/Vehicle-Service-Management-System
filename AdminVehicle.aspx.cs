using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminVehicle : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadVehicles("");
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        private void LoadVehicles(string search)
        {
            SqlConnection con = new SqlConnection(s);

            search = search.Replace("'", "''");

            string query = @"
                SELECT
                    CustomerId,
                    FullName,
                    Mobile,
                    VehicleNumber,
                    VehicleBrand,
                    VehicleModel
                FROM Customer
                WHERE
                    '" + search + @"' = ''
                    OR CAST(CustomerId AS NVARCHAR(20))
                        LIKE '%" + search + @"%'
                    OR FullName LIKE '%" + search + @"%'
                    OR Mobile LIKE '%" + search + @"%'
                    OR VehicleNumber LIKE '%" + search + @"%'
                    OR VehicleBrand LIKE '%" + search + @"%'
                    OR VehicleModel LIKE '%" + search + @"%'
                ORDER BY CustomerId DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblTotalVehicles.Text = dt.Rows.Count.ToString();

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
            LoadVehicles(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadVehicles("");
        }
    }
}