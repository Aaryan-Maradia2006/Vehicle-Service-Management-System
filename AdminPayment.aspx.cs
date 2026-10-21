using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminPayment : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentRecords("");
            }
            else if (IsPostBack)
            {
                // Postback par biju kai karvanu nathi.
            }
        }

        void LoadPaymentRecords(string search)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                search = search.Replace("'", "''");

                string query = @"
                    SELECT
                        ServiceHistoryId,
                        CustomerName,
                        Mobile,
                        VehicleNumber,
                        ServiceType,
                        BookingDate,
                        Amount,
                        Status
                    FROM ServiceHistory
                    WHERE
                        '" + search + @"' = ''
                        OR CAST(ServiceHistoryId AS NVARCHAR(20))
                            LIKE '%" + search + @"%'
                        OR CustomerName LIKE '%" + search + @"%'
                        OR VehicleNumber LIKE '%" + search + @"%'
                    ORDER BY ServiceHistoryId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        lblMessage.Text = "";
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadPaymentRecords(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadPaymentRecords("");
        }
    }
}