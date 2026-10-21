using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminBooking : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings("");
            }
        }

        private void LoadBookings(string search)
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
                        OR Mobile LIKE '%" + search + @"%'
                        OR VehicleNumber LIKE '%" + search + @"%'
                    ORDER BY ServiceHistoryId DESC";

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
                            "Total bookings found: " + dt.Rows.Count;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadBookings(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadBookings("");
        }
    }
}