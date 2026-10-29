
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class AdminPayment : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentRecords("");
            }
        }

        void LoadPaymentRecords(string search)
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT ServiceHistoryId, CustomerName, Mobile,
                             VehicleNumber, ServiceType, BookingDate,
                             Amount, Status
                             FROM ServiceHistory";

            if (search != "")
            {
                query += @" WHERE CAST(ServiceHistoryId AS NVARCHAR(20)) LIKE @Search
                            OR CustomerName LIKE @Search
                            OR VehicleNumber LIKE @Search";
            }

            query += " ORDER BY ServiceHistoryId DESC";

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

            lblMessage.Text = "";
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
