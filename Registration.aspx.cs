
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace VehicleServiceManagementSystem
{
    public partial class Registration : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        // Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridfill();
                clear();
            }
        }

        // Show All Customers
        void gridfill()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Customer";
                SqlDataAdapter da = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // Clear All Fields
        void clear()
        {
            txtName.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtVehicleNo.Text = "";
            txtVehicleBrand.Text = "";
            txtVehicleModel.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtAddress.Text = "";

            ViewState["id"] = null;
            btnRegister.Text = "REGISTER";
        }

        // Register or Update
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string email = txtEmail.Text.Trim();
            string vehicleNo = txtVehicleNo.Text.Trim();
            string brand = txtVehicleBrand.Text.Trim();
            string model = txtVehicleModel.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string address = txtAddress.Text.Trim();

            if (fullName == "" || mobile == "" ||
                email == "" || username == "" ||
                password == "" || confirmPassword == "")
            {
                ShowMessage("Please fill in all required fields.");
                return;
            }

            if (password != confirmPassword)
            {
                ShowMessage("Password and Confirm Password do not match.");
                return;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                string query;

                if (btnRegister.Text == "REGISTER")
                {
                    query = @"INSERT INTO Customer
                              (FullName, Mobile, Email, VehicleNumber,
                               VehicleBrand, VehicleModel, Username, Password, Address)
                              VALUES
                              (@FullName, @Mobile, @Email, @VehicleNumber,
                               @VehicleBrand, @VehicleModel, @Username, @Password, @Address)";
                }
                else
                {
                    if (ViewState["id"] == null)
                    {
                        ShowMessage("Please select Edit first.");
                        return;
                    }

                    query = @"UPDATE Customer SET
                              FullName = @FullName,
                              Mobile = @Mobile,
                              Email = @Email,
                              VehicleNumber = @VehicleNumber,
                              VehicleBrand = @VehicleBrand,
                              VehicleModel = @VehicleModel,
                              Username = @Username,
                              Password = @Password,
                              Address = @Address
                              WHERE CustomerId = @CustomerId";
                }

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNo);
                cmd.Parameters.AddWithValue("@VehicleBrand", brand);
                cmd.Parameters.AddWithValue("@VehicleModel", model);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Address", address);

                if (btnRegister.Text == "UPDATE")
                {
                    cmd.Parameters.AddWithValue("@CustomerId",
                        Convert.ToInt32(ViewState["id"]));
                }

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    if (btnRegister.Text == "REGISTER")
                    {
                        ShowMessage("Registration Successful.");
                    }
                    else
                    {
                        ShowMessage("Data Updated Successfully.");
                    }

                    clear();
                    gridfill();
                }
                else
                {
                    ShowMessage("Operation failed. Please try again.");
                }
            }
        }

        // Load Selected Customer Details
        void filldata()
        {
            if (ViewState["id"] == null)
            {
                return;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "SELECT * FROM Customer WHERE CustomerId = @CustomerId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId",
                    Convert.ToInt32(ViewState["id"]));

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["FullName"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtVehicleNo.Text = dr["VehicleNumber"].ToString();
                    txtVehicleBrand.Text = dr["VehicleBrand"].ToString();
                    txtVehicleModel.Text = dr["VehicleModel"].ToString();
                    txtUsername.Text = dr["Username"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                    txtConfirmPassword.Text = dr["Password"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                }
            }
        }

        // GridView Edit Command
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                ViewState["id"] = e.CommandArgument.ToString();

                filldata();
                btnRegister.Text = "UPDATE";

                ShowMessage("Record loaded. Make changes and click UPDATE.");
            }
        }

        // Update Button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] != null)
            {
                filldata();
                btnRegister.Text = "UPDATE";
            }
            else
            {
                ShowMessage("Please select Edit from Registered Details first.");
            }
        }

        // Delete Button
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                ShowMessage("Please select Edit from Registered Details first.");
                return;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = "DELETE FROM Customer WHERE CustomerId = @CustomerId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId",
                    Convert.ToInt32(ViewState["id"]));

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    ShowMessage("Selected user deleted successfully.");
                    clear();
                    gridfill();
                }
                else
                {
                    ShowMessage("Record not found.");
                }
            }
        }

        // Reset Button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            clear();
        }

        // Show Message
        void ShowMessage(string message)
        {
            string safeMessage = message.Replace("\\", "\\\\")
                                        .Replace("'", "\\'")
                                        .Replace("\r", "")
                                        .Replace("\n", "");

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "message",
                "alert('" + safeMessage + "');",
                true
            );
        }
    }
}
