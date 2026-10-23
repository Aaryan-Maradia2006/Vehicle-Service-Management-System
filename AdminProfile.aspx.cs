using System;
using System.Web;
using System.Text.RegularExpressions;

namespace VehicleServiceManagementSystem
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtAdminName.Text =
                    Convert.ToString(Session["AdminName"]);

                txtUsername.Text =
                    Convert.ToString(Session["AdminUsername"]);

                txtEmail.Text =
                    Convert.ToString(Session["AdminEmail"]);

                if (string.IsNullOrWhiteSpace(txtAdminName.Text))
                {
                    txtAdminName.Text = "Administrator";
                }
                else if (!string.IsNullOrWhiteSpace(txtAdminName.Text))
                {
                    // Existing admin name is retained.
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string adminName = txtAdminName.Text.Trim();
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(adminName) ||
                string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(email))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please fill in all profile fields.";
            }
            else if (!IsValidEmail(email))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please enter a valid email address.";
            }
            else
            {
                Session["AdminName"] = adminName;
                Session["AdminUsername"] = username;
                Session["AdminEmail"] = email;

                lblMessage.ForeColor =
                    System.Drawing.Color.DarkGreen;

                lblMessage.Text =
                    "Profile updated for this session only. " +
                    "Database saving is not configured.";
            }
        }

        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
            {
                return false;
            }
            else if (Regex.IsMatch(
                email,
                @"^[A-Za-z0-9]+([._%+-][A-Za-z0-9]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+$"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}