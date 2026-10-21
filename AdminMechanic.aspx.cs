using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminMechanic : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMechanics("");
            }
        }

        private void LoadMechanics(string search)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                search = search.Replace("'", "''");

                string query = @"
                    SELECT
                        MechanicId,
                        MechanicName,
                        Mobile,
                        Email,
                        Specialization
                    FROM Mechanic
                    WHERE
                        '" + search + @"' = ''
                        OR CAST(MechanicId AS NVARCHAR(20))
                            LIKE '%" + search + @"%'
                        OR MechanicName LIKE '%" + search + @"%'
                        OR Mobile LIKE '%" + search + @"%'
                        OR Email LIKE '%" + search + @"%'
                        OR Specialization LIKE '%" + search + @"%'
                    ORDER BY MechanicId DESC";

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
                            "Total mechanics found: " + dt.Rows.Count;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadMechanics(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadMechanics("");
        }
    }
}