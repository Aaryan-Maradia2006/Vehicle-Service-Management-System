using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class AdminMechanic : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMechanics();
            }
        }

        // Load mechanics and dashboard information
        private void LoadMechanics()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT
                        M.MechanicId,
                        M.MechanicName,
                        M.Mobile,
                        M.Email,
                        M.Specialization,
                        M.Address,
                        M.IsActive,
                        (SELECT COUNT(*)
                         FROM dbo.ServiceAssignment SA
                         WHERE SA.MechanicId = M.MechanicId) AS TotalAssignments,
                        (SELECT COUNT(*)
                         FROM dbo.ServiceAssignment SA
                         WHERE SA.MechanicId = M.MechanicId
                           AND SA.AssignmentStatus = 'In Progress') AS InProgress,
                        (SELECT COUNT(*)
                         FROM dbo.ServiceAssignment SA
                         WHERE SA.MechanicId = M.MechanicId
                           AND SA.AssignmentStatus = 'Completed') AS Completed
                    FROM dbo.Mechanic M
                    WHERE 1 = 1";

                if (txtSearch.Text.Trim() != "")
                {
                    query += @"
                        AND (
                            M.MechanicName LIKE @Search
                            OR M.Mobile LIKE @Search
                            OR M.Email LIKE @Search
                            OR M.Specialization LIKE @Search
                        )";
                }

                if (ddlFilterStatus.SelectedValue != "All")
                {
                    query += " AND M.IsActive = @IsActive";
                }

                if (ddlSort.SelectedValue == "DESC")
                    query += " ORDER BY M.MechanicId DESC";
                else if (ddlSort.SelectedValue == "NAME")
                    query += " ORDER BY M.MechanicName ASC";
                else
                    query += " ORDER BY M.MechanicId ASC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (txtSearch.Text.Trim() != "")
                    {
                        cmd.Parameters.Add("@Search", SqlDbType.VarChar, 100)
                            .Value = "%" + txtSearch.Text.Trim() + "%";
                    }

                    if (ddlFilterStatus.SelectedValue != "All")
                    {
                        cmd.Parameters.Add("@IsActive", SqlDbType.Bit)
                            .Value = ddlFilterStatus.SelectedValue == "1";
                    }

                    DataTable dt = new DataTable();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

                LoadDashboard();
            }
        }

        // Dashboard counts
        private void LoadDashboard()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    SELECT
                        COUNT(*) AS TotalMechanics,
                        ISNULL(SUM(CASE WHEN IsActive = 1 THEN 1 ELSE 0 END), 0) AS ActiveMechanics,
                        ISNULL(SUM(CASE WHEN IsActive = 0 THEN 1 ELSE 0 END), 0) AS InactiveMechanics
                    FROM dbo.Mechanic";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblTotalMechanics.Text = dr["TotalMechanics"].ToString();
                            lblActiveMechanics.Text = dr["ActiveMechanics"].ToString();
                            lblInactiveMechanics.Text = dr["InactiveMechanics"].ToString();
                        }
                    }
                }

                string assignmentQuery =
                    "SELECT COUNT(*) FROM dbo.ServiceAssignment";

                using (SqlCommand cmd = new SqlCommand(assignmentQuery, con))
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();

                    lblTotalAssignments.Text = cmd.ExecuteScalar().ToString();
                }
            }
        }

        // Add mechanic
        protected void btnAddMechanic_Click(object sender, EventArgs e)
        {
            if (txtMechanicName.Text.Trim() == "")
            {
                ShowMessage("Please enter mechanic name.", true);
                return;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"
                    INSERT INTO dbo.Mechanic
                    (MechanicName, Mobile, Email, Specialization, Address, IsActive)
                    VALUES
                    (@Name, @Mobile, @Email, @Specialization, @Address, @IsActive)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar, 100)
                        .Value = txtMechanicName.Text.Trim();

                    cmd.Parameters.Add("@Mobile", SqlDbType.VarChar, 15)
                        .Value = txtMobile.Text.Trim();

                    cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100)
                        .Value = txtEmail.Text.Trim();

                    cmd.Parameters.Add("@Specialization", SqlDbType.VarChar, 100)
                        .Value = txtSpecialization.Text.Trim();

                    cmd.Parameters.Add("@Address", SqlDbType.VarChar, 250)
                        .Value = txtAddress.Text.Trim();

                    cmd.Parameters.Add("@IsActive", SqlDbType.Bit)
                        .Value = ddlStatus.SelectedValue == "1";

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ClearForm();
            ShowMessage("Mechanic added successfully!", false);
            LoadMechanics();
        }

        // Clear add form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblMessage.Text = "";
        }

        private void ClearForm()
        {
            txtMechanicName.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtSpecialization.Text = "";
            txtAddress.Text = "";
            ddlStatus.SelectedValue = "1";
        }

        // Search mechanics
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadMechanics();
        }

        // Show all mechanics
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlFilterStatus.SelectedValue = "All";
            ddlSort.SelectedValue = "ASC";

            LoadMechanics();
        }

        // Activate / deactivate mechanic
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ToggleStatus")
            {
                int mechanicId;

                if (!int.TryParse(e.CommandArgument.ToString(), out mechanicId))
                {
                    ShowMessage("Invalid mechanic ID.", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(s))
                {
                    string query = @"
                        UPDATE dbo.Mechanic
                        SET IsActive = 0
                        WHERE MechanicId = @MechanicId
                          AND IsActive = 1";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add("@MechanicId", SqlDbType.Int)
                            .Value = mechanicId;

                        con.Open();
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                            ShowMessage("Mechanic deactivated successfully.", false);
                        else
                            ShowMessage("Mechanic not found or already inactive.", true);
                    }
                }

                LoadMechanics();
            }
        }

        // Display messages
        private void ShowMessage(string message, bool isError)
        {
            lblMessage.ForeColor = isError ? Color.Red : Color.DarkGreen;
            lblMessage.Text = message;
        }
    }
}