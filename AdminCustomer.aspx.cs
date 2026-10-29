
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminCustomer : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomers("");
            }
        }

        private void LoadCustomers(string search)
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT CustomerId, FullName, Mobile, Email,
                             VehicleNumber, VehicleBrand, VehicleModel, Address
                             FROM Customer";

            if (search != "")
            {
                query += @" WHERE FullName LIKE @Search
                            OR Mobile LIKE @Search
                            OR Email LIKE @Search
                            OR VehicleNumber LIKE @Search";
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

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Total customers found: " + dt.Rows.Count;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadCustomers(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadCustomers("");
        }
    }
}
