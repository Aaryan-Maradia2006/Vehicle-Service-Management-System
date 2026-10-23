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
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServiceStatus("");
            }
            else if (IsPostBack)
            {
                // No action required.
            }
        }

        private void LoadServiceStatus(string search)
        {
            SqlConnection con = new SqlConnection(s);

            search = search.Replace("'", "''");

            string query = @"
                SELECT
                    ServiceHistoryId,
                    CustomerName,
                    VehicleNumber,
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
                    OR VehicleNumber LIKE '%" + search + @"%'
                ORDER BY ServiceHistoryId DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.EditIndex = -1;
            GridView1.DataSource = dt;
            GridView1.DataBind();

            lblMessage.Text = "";

            da.Dispose();
            cmd.Dispose();
            con.Close();
            con.Dispose();
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

        protected void GridView1_RowEditing(
            object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadServiceStatus(txtSearch.Text.Trim());
        }

        protected void GridView1_RowCancelingEdit(
            object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadServiceStatus(txtSearch.Text.Trim());
        }

        protected void GridView1_RowUpdating(
            object sender, GridViewUpdateEventArgs e)
        {
            int serviceId = Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value);

            DropDownList ddlStatus =
                (DropDownList)GridView1.Rows[e.RowIndex]
                .FindControl("ddlStatus");

            if (ddlStatus == null)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Unable to find the status dropdown.";

                return;
            }

            string status = ddlStatus.SelectedValue.Replace("'", "''");

            SqlConnection con = new SqlConnection(s);

            string query = @"
                UPDATE ServiceHistory
                SET Status = '" + status + @"'
                WHERE ServiceHistoryId = " + serviceId;

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            cmd.Dispose();
            con.Dispose();

            GridView1.EditIndex = -1;
            LoadServiceStatus(txtSearch.Text.Trim());

            lblMessage.ForeColor =
                System.Drawing.Color.DarkGreen;

            lblMessage.Text =
                "Service status updated successfully.";
        }

        protected void GridView1_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
                (e.Row.RowState & DataControlRowState.Edit) ==
                DataControlRowState.Edit)
            {
                DropDownList ddlStatus =
                    (DropDownList)e.Row.FindControl("ddlStatus");

                if (ddlStatus != null)
                {
                    string currentStatus = Convert.ToString(
                        DataBinder.Eval(e.Row.DataItem, "Status"));

                    ListItem item =
                        ddlStatus.Items.FindByValue(currentStatus);

                    if (item != null)
                    {
                        ddlStatus.ClearSelection();
                        item.Selected = true;
                    }
                }
            }
        }
    }
}