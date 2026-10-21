using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminCustomer : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomers("");
            }
        }

        private void LoadCustomers(string search)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                search = search.Replace("'", "''");

                string query = @"
                    SELECT
                        CustomerId,
                        FullName,
                        Mobile,
                        Email,
                        VehicleNumber,
                        VehicleBrand,
                        VehicleModel,
                        Address
                    FROM Customer
                    WHERE
                        '" + search + @"' = ''
                        OR FullName LIKE '%" + search + @"%'
                        OR Mobile LIKE '%" + search + @"%'
                        OR Email LIKE '%" + search + @"%'
                        OR VehicleNumber LIKE '%" + search + @"%'
                    ORDER BY CustomerId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        lblMessage.ForeColor =
                            System.Drawing.Color.DarkGreen;

                        lblMessage.Text =
                            "Total customers found: " + dt.Rows.Count;
                    }
                }
            }
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