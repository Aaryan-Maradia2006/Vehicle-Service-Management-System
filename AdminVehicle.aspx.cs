
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminVehicle : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadVehicles("");
            }
        }

        private void LoadVehicles(string search)
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT CustomerId, FullName, Mobile,
                             VehicleNumber, VehicleBrand, VehicleModel
                             FROM Customer";

            if (search != "")
            {
                query += @" WHERE CAST(CustomerId AS NVARCHAR(20)) LIKE @Search
                            OR FullName LIKE @Search
                            OR Mobile LIKE @Search
                            OR VehicleNumber LIKE @Search
                            OR VehicleBrand LIKE @Search
                            OR VehicleModel LIKE @Search";
            }

            query += " ORDER BY CustomerId ASC";

            SqlCommand cmd = new SqlCommand(query, con);

            if (search != "")
            {
                cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblTotalVehicles.Text = dt.Rows.Count.ToString();

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Records found: " + dt.Rows.Count;
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
