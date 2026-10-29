
using System;
using System.Text.RegularExpressions;

namespace VehicleServiceManagementSystem
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtAdminName.Text = Convert.ToString(Session["AdminName"]);
                txtUsername.Text = Convert.ToString(Session["AdminUsername"]);
                txtEmail.Text = Convert.ToString(Session["AdminEmail"]);

                if (txtAdminName.Text == "")
                {
                    txtAdminName.Text = "Administrator";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string adminName = txtAdminName.Text.Trim();
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (adminName == "" || username == "" || email == "")
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all profile fields.";
            }
            else if (!IsValidEmail(email))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter a valid email address.";
            }
            else
            {
                Session["AdminName"] = adminName;
                Session["AdminUsername"] = username;
                Session["AdminEmail"] = email;

                lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
                lblMessage.Text = "Profile updated for this session only. Database saving is not configured.";
            }
        }

        private bool IsValidEmail(string email)
        {
            if (Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
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
