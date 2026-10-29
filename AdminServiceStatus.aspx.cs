
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class AdminServiceStatus : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServiceStatus("");
            }
        }

        private void LoadServiceStatus(string search)
        {
            SqlConnection con = new SqlConnection(s);

            string query = @"SELECT ServiceHistoryId, CustomerName,
                             VehicleNumber, ServiceType, BookingDate,
                             Status, Amount
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
            LoadServiceStatus(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadServiceStatus("");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadServiceStatus(txtSearch.Text.Trim());
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadServiceStatus(txtSearch.Text.Trim());
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int serviceId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            DropDownList ddlStatus = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlStatus");

            if (ddlStatus == null)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Unable to find the status dropdown.";
                return;
            }

            string status = ddlStatus.SelectedValue;

            SqlConnection con = new SqlConnection(s);

            string query = "UPDATE ServiceHistory SET Status = @Status WHERE ServiceHistoryId = @ServiceId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@ServiceId", serviceId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;

            LoadServiceStatus(txtSearch.Text.Trim());

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Service status updated successfully.";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
                (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {
                DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");

                if (ddlStatus != null)
                {
                    string currentStatus = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Status"));

                    ListItem item = ddlStatus.Items.FindByValue(currentStatus);

                    if (item != null)
                    {
                        ddlStatus.SelectedValue = currentStatus;
                    }
                }
            }
        }
    }
}
