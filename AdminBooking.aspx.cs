
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class AdminBooking : System.Web.UI.Page
    {
        private readonly string s =
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.EditIndex = -1;
                LoadBookings("");
            }
        }

        // Load bookings and preserve the current search
        private void LoadBookings(string search)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT ServiceHistoryId,
                           CustomerName,
                           Mobile,
                           VehicleNumber,
                           VehicleBrand,
                           VehicleModel,
                           ServiceType,
                           BookingDate,
                           Status,
                           Amount
                    FROM dbo.ServiceHistory";

                if (!string.IsNullOrWhiteSpace(search))
                {
                    query += @"
                        WHERE CAST(ServiceHistoryId AS NVARCHAR(20)) LIKE @Search
                           OR CustomerName LIKE @Search
                           OR Mobile LIKE @Search
                           OR VehicleNumber LIKE @Search";
                }

                query += " ORDER BY ServiceHistoryId ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(search))
                    {
                        cmd.Parameters.Add("@Search", SqlDbType.NVarChar, 100)
                            .Value = "%" + search.Trim() + "%";
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMessage.ForeColor = Color.DarkGreen;
            lblMessage.Text = "Total bookings found: " + dt.Rows.Count;
        }

        // Search bookings
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadBookings(txtSearch.Text.Trim());
        }

        // Show all bookings
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            GridView1.EditIndex = -1;
            LoadBookings("");
        }

        // Enter edit mode for the selected row
        protected void GridView1_RowEditing(
            object sender, GridViewEditEventArgs e)
        {
            e.Cancel = true;
            GridView1.EditIndex = e.NewEditIndex;

            LoadBookings(txtSearch.Text.Trim());
        }

        // Cancel edit mode
        protected void GridView1_RowCancelingEdit(
            object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            GridView1.EditIndex = -1;

            LoadBookings(txtSearch.Text.Trim());
        }

        // Save the selected status
        protected void GridView1_RowUpdating(
            object sender, GridViewUpdateEventArgs e)
        {
            e.Cancel = true;

            if (e.RowIndex < 0 || e.RowIndex >= GridView1.Rows.Count)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Invalid booking row.";
                return;
            }

            int serviceId = Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value);

            DropDownList ddlStatus =
                GridView1.Rows[e.RowIndex].FindControl("ddlStatus")
                as DropDownList;

            if (ddlStatus == null)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Status dropdown was not found.";
                return;
            }

            string status = ddlStatus.SelectedValue;

            string[] allowedStatuses =
            {
                "Pending",
                "Confirmed",
                "In Progress",
                "Completed",
                "Cancelled"
            };

            if (Array.IndexOf(allowedStatuses, status) < 0)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Invalid booking status.";
                return;
            }

            int result;

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    UPDATE dbo.ServiceHistory
                    SET Status = @Status
                    WHERE ServiceHistoryId = @ServiceHistoryId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 50)
                        .Value = status;

                    cmd.Parameters.Add("@ServiceHistoryId", SqlDbType.Int)
                        .Value = serviceId;

                    con.Open();
                    result = cmd.ExecuteNonQuery();
                }
            }

            GridView1.EditIndex = -1;
            LoadBookings(txtSearch.Text.Trim());

            if (result > 0)
            {
                lblMessage.ForeColor = Color.DarkGreen;
                lblMessage.Text = "Booking status updated successfully!";
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Booking record was not found.";
            }
        }
    }
}
