using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class AdminAssignment : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
                LoadMechanics();
                LoadAssignments("");
            }
        }

        private void LoadServices()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT ServiceHistoryId, CustomerName, VehicleNumber
                    FROM ServiceHistory
                    ORDER BY ServiceHistoryId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    ddlService.DataSource = cmd.ExecuteReader();
                    ddlService.DataTextField = "ServiceHistoryId";
                    ddlService.DataValueField = "ServiceHistoryId";
                    ddlService.DataBind();

                    ddlService.Items.Insert(
                        0,
                        new ListItem("-- Select Service --", "")
                    );
                }
            }
        }

        private void LoadMechanics()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT MechanicId, MechanicName
                    FROM Mechanic
                    ORDER BY MechanicName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    ddlMechanic.DataSource = cmd.ExecuteReader();
                    ddlMechanic.DataTextField = "MechanicName";
                    ddlMechanic.DataValueField = "MechanicId";
                    ddlMechanic.DataBind();

                    ddlMechanic.Items.Insert(
                        0,
                        new ListItem("-- Select Mechanic --", "")
                    );
                }
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlService.SelectedValue) ||
                string.IsNullOrEmpty(ddlMechanic.SelectedValue))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text =
                    "Please select a service and a mechanic.";
                return;
            }

            int serviceId = Convert.ToInt32(ddlService.SelectedValue);
            int mechanicId = Convert.ToInt32(ddlMechanic.SelectedValue);

            string status = ddlStatus.SelectedValue.Replace("'", "''");

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    INSERT INTO ServiceAssignment
                    (
                        ServiceHistoryId,
                        MechanicId,
                        AssignedDate,
                        AssignmentStatus
                    )
                    VALUES
                    (
                        " + serviceId + @",
                        " + mechanicId + @",
                        GETDATE(),
                        '" + status + @"'
                    )";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Text = "Mechanic assigned successfully.";

            LoadAssignments("");
        }

        private void LoadAssignments(string search)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                search = search.Replace("'", "''");

                string query = @"
                    SELECT
                        A.AssignmentId,
                        A.ServiceHistoryId,
                        S.CustomerName,
                        S.VehicleNumber,
                        M.MechanicName,
                        A.AssignedDate,
                        A.AssignmentStatus
                    FROM ServiceAssignment A
                    INNER JOIN ServiceHistory S
                        ON A.ServiceHistoryId = S.ServiceHistoryId
                    INNER JOIN Mechanic M
                        ON A.MechanicId = M.MechanicId
                    WHERE
                        '" + search + @"' = ''
                        OR CAST(A.ServiceHistoryId AS NVARCHAR(20))
                            LIKE '%" + search + @"%'
                        OR M.MechanicName LIKE '%" + search + @"%'
                        OR S.VehicleNumber LIKE '%" + search + @"%'
                    ORDER BY A.AssignmentId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadAssignments(txtSearch.Text.Trim());
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadAssignments("");
        }
    }
}