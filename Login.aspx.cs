
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace VehicleServiceManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        // Login Button
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (username == "" || password == "")
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter username and password.";
                return;
            }

            // Admin Login
            if (username == "admin" && password == "123")
            {
                Session.Clear();
                Session["Admin"] = "admin";

                Response.Redirect("Admin.aspx");
                return;
            }

            // Customer Login
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT CustomerId, FullName, Username
                                 FROM Customer
                                 WHERE Username = @Username
                                 AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Session.Clear();

                            Session["CustomerId"] = dr["CustomerId"].ToString();
                            Session["CustomerName"] = dr["FullName"].ToString();
                            Session["Username"] = dr["Username"].ToString();

                            Response.Redirect("Default.aspx");
                            return;
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Invalid Username or Password.";
                        }
                    }
                }
            }
        }

        // Reset Button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            lblMessage.Text = "";
        }
    }
}
