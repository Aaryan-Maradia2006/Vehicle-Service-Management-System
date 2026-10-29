
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class Profile : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
                SetViewMode();
            }
        }

        // Load Profile
        void LoadProfile()
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT CustomerId, FullName, Mobile, Email,
                                Username, Password, Address,
                                VehicleNumber, VehicleBrand, VehicleModel
                                FROM Customer
                                WHERE CustomerId = @CustomerId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblCustomerId.Text = Server.HtmlEncode(dr["CustomerId"].ToString());
                    lblFullName.Text = Server.HtmlEncode(dr["FullName"].ToString());
                    lblMobile.Text = Server.HtmlEncode(dr["Mobile"].ToString());
                    lblEmail.Text = Server.HtmlEncode(dr["Email"].ToString());
                    lblUsername.Text = Server.HtmlEncode(dr["Username"].ToString());
                    lblAddress.Text = Server.HtmlEncode(dr["Address"].ToString());
                    lblVehicleNumber.Text = Server.HtmlEncode(dr["VehicleNumber"].ToString());
                    lblVehicleBrand.Text = Server.HtmlEncode(dr["VehicleBrand"].ToString());
                    lblVehicleModel.Text = Server.HtmlEncode(dr["VehicleModel"].ToString());

                    string password = dr["Password"].ToString();
                    lblPassword.Text = new string('*', password.Length);
                }
                else
                {
                    dr.Close();
                    Response.Redirect("Login.aspx");
                    return;
                }

                dr.Close();
            }
        }

        // Update Button
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

        // Save Profile
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string email = txtEmail.Text.Trim();
            string username = txtUsername.Text.Trim();
            string address = txtAddress.Text.Trim();
            string vehicleNumber = txtVehicleNumber.Text.Trim();
            string vehicleBrand = txtVehicleBrand.Text.Trim();
            string vehicleModel = txtVehicleModel.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (fullName == "" || mobile == "" ||
                email == "" || username == "")
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all required fields.";
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"UPDATE Customer SET
                                FullName = @FullName,
                                Mobile = @Mobile,
                                Email = @Email,
                                Username = @Username,
                                Address = @Address,
                                VehicleNumber = @VehicleNumber,
                                VehicleBrand = @VehicleBrand,
                                VehicleModel = @VehicleModel";

                if (password != "")
                {
                    query += ", Password = @Password";
                }

                query += " WHERE CustomerId = @CustomerId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                cmd.Parameters.AddWithValue("@VehicleBrand", vehicleBrand);
                cmd.Parameters.AddWithValue("@VehicleModel", vehicleModel);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);

                if (password != "")
                {
                    cmd.Parameters.AddWithValue("@Password", password);
                }

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Session["CustomerName"] = fullName;
                    Session["Username"] = username;

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Profile updated successfully!";

                    LoadProfile();
                    SetViewMode();
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Profile was not updated.";
                }
            }
        }

        // Cancel Button
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadProfile();
            SetViewMode();
            lblMessage.Text = "";
        }

        // View Mode
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
