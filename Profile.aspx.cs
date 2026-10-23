using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class Profile : System.Web.UI.Page
    {
        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
            else if (IsPostBack)
            {
                // Keep current page values.
            }
        }

        // LOAD PROFILE
        void LoadProfile()
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int customerId =
                Convert.ToInt32(Session["CustomerId"]);

            SqlConnection con = new SqlConnection(s);

            string query = @"
                SELECT CustomerId, FullName, Mobile, Email,
                       VehicleNumber, VehicleBrand, VehicleModel,
                       Username, Password, Address
                FROM Customer
                WHERE CustomerId = " + customerId;

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblCustomerId.Text =
                    Server.HtmlEncode(dr["CustomerId"].ToString());

                lblFullName.Text =
                    Server.HtmlEncode(dr["FullName"].ToString());

                lblMobile.Text =
                    Server.HtmlEncode(dr["Mobile"].ToString());

                lblEmail.Text =
                    Server.HtmlEncode(dr["Email"].ToString());

                lblUsername.Text =
                    Server.HtmlEncode(dr["Username"].ToString());

                string password =
                    dr["Password"].ToString();

                lblPassword.Text =
                    new string('*', password.Length);

                lblAddress.Text =
                    Server.HtmlEncode(dr["Address"].ToString());

                lblVehicleNumber.Text =
                    Server.HtmlEncode(dr["VehicleNumber"].ToString());

                lblVehicleBrand.Text =
                    Server.HtmlEncode(dr["VehicleBrand"].ToString());

                lblVehicleModel.Text =
                    Server.HtmlEncode(dr["VehicleModel"].ToString());
            }
            else if (!dr.Read())
            {
                dr.Close();
                con.Close();

                cmd.Dispose();
                con.Dispose();

                Response.Redirect("Login.aspx");
                return;
            }

            dr.Close();
            con.Close();

            cmd.Dispose();
            con.Dispose();
        }

        // UPDATE BUTTON
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            txtFullName.Text = lblFullName.Text;
            txtMobile.Text = lblMobile.Text;
            txtEmail.Text = lblEmail.Text;
            txtUsername.Text = lblUsername.Text;
            txtAddress.Text = lblAddress.Text;
            txtVehicleNumber.Text = lblVehicleNumber.Text;
            txtVehicleBrand.Text = lblVehicleBrand.Text;
            txtVehicleModel.Text = lblVehicleModel.Text;
            txtPassword.Text = "";

            lblFullName.Visible = false;
            lblMobile.Visible = false;
            lblEmail.Visible = false;
            lblUsername.Visible = false;
            lblPassword.Visible = false;
            lblAddress.Visible = false;
            lblVehicleNumber.Visible = false;
            lblVehicleBrand.Visible = false;
            lblVehicleModel.Visible = false;

            txtFullName.Visible = true;
            txtMobile.Visible = true;
            txtEmail.Visible = true;
            txtUsername.Visible = true;
            txtPassword.Visible = true;
            txtAddress.Visible = true;
            txtVehicleNumber.Visible = true;
            txtVehicleBrand.Visible = true;
            txtVehicleModel.Visible = true;

            btnUpdate.Visible = false;
            btnSave.Visible = true;
            btnCancel.Visible = true;

            lblMessage.Text = "";
        }

        // SAVE CHANGES
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int customerId =
                Convert.ToInt32(Session["CustomerId"]);

            string fullName =
                txtFullName.Text.Trim().Replace("'", "''");

            string mobile =
                txtMobile.Text.Trim().Replace("'", "''");

            string email =
                txtEmail.Text.Trim().Replace("'", "''");

            string vehicleNumber =
                txtVehicleNumber.Text.Trim().Replace("'", "''");

            string vehicleBrand =
                txtVehicleBrand.Text.Trim().Replace("'", "''");

            string vehicleModel =
                txtVehicleModel.Text.Trim().Replace("'", "''");

            string username =
                txtUsername.Text.Trim().Replace("'", "''");

            string address =
                txtAddress.Text.Trim().Replace("'", "''");

            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(mobile) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(username))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please fill in all required fields.";

                return;
            }

            string passwordQuery = "";

            if (!string.IsNullOrWhiteSpace(password))
            {
                password = password.Replace("'", "''");

                passwordQuery =
                    ", Password = '" + password + "'";
            }

            SqlConnection con = new SqlConnection(s);

            string query = @"
                UPDATE Customer
                SET
                    FullName = '" + fullName + @"',
                    Mobile = '" + mobile + @"',
                    Email = '" + email + @"',
                    VehicleNumber = '" + vehicleNumber + @"',
                    VehicleBrand = '" + vehicleBrand + @"',
                    VehicleModel = '" + vehicleModel + @"',
                    Username = '" + username + @"',
                    Address = '" + address + @"'
                    " + passwordQuery + @"
                WHERE CustomerId = " + customerId;

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            int result = cmd.ExecuteNonQuery();

            con.Close();

            cmd.Dispose();
            con.Dispose();

            if (result > 0)
            {
                Session["CustomerName"] =
                    txtFullName.Text.Trim();

                Session["Username"] =
                    txtUsername.Text.Trim();

                lblMessage.ForeColor =
                    System.Drawing.Color.Green;

                lblMessage.Text =
                    "Profile updated successfully!";

                LoadProfile();
                SetViewMode();
            }
            else if (result == 0)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Profile was not updated.";
            }
        }

        // CANCEL
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadProfile();
            SetViewMode();
            lblMessage.Text = "";
        }

        // VIEW MODE
        void SetViewMode()
        {
            txtFullName.Visible = false;
            txtMobile.Visible = false;
            txtEmail.Visible = false;
            txtUsername.Visible = false;
            txtPassword.Visible = false;
            txtAddress.Visible = false;
            txtVehicleNumber.Visible = false;
            txtVehicleBrand.Visible = false;
            txtVehicleModel.Visible = false;

            lblFullName.Visible = true;
            lblMobile.Visible = true;
            lblEmail.Visible = true;
            lblUsername.Visible = true;
            lblPassword.Visible = true;
            lblAddress.Visible = true;
            lblVehicleNumber.Visible = true;
            lblVehicleBrand.Visible = true;
            lblVehicleModel.Visible = true;

            btnUpdate.Visible = true;
            btnSave.Visible = false;
            btnCancel.Visible = false;
        }
    }
}