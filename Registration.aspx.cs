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
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        // PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridfill();
            }
        }

        // CONNECTION
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // GRID FILL
        void gridfill()
        {
            getcon();

            da = new SqlDataAdapter(
                "SELECT * FROM Customer",
                con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
            da.Dispose();
            ds.Dispose();
            con.Dispose();
        }

        // CLEAR FORM
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

        // REGISTER / UPDATE
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtMobile.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                Response.Write(
                    "<script>alert('Please fill in all required fields.');</script>");
                return;
            }
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                Response.Write(
                    "<script>alert('Password and Confirm Password do not match.');</script>");
                return;
            }
            else if (btnRegister.Text == "REGISTER")
            {
                string fullName = txtName.Text.Trim().Replace("'", "''");
                string mobile = txtMobile.Text.Trim().Replace("'", "''");
                string email = txtEmail.Text.Trim().Replace("'", "''");
                string vehicleNo = txtVehicleNo.Text.Trim().Replace("'", "''");
                string brand = txtVehicleBrand.Text.Trim().Replace("'", "''");
                string model = txtVehicleModel.Text.Trim().Replace("'", "''");
                string username = txtUsername.Text.Trim().Replace("'", "''");
                string password = txtPassword.Text.Replace("'", "''");
                string address = txtAddress.Text.Trim().Replace("'", "''");

                getcon();

                string query =
                    "INSERT INTO Customer " +
                    "(FullName, Mobile, Email, VehicleNumber, VehicleBrand, VehicleModel, Username, Password, Address) " +
                    "VALUES ('" + fullName + "','" + mobile + "','" +
                    email + "','" + vehicleNo + "','" + brand + "','" +
                    model + "','" + username + "','" + password + "','" +
                    address + "')";

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();
                cmd.Dispose();
                con.Dispose();

                Response.Write(
                    "<script>alert('Registration Successful');</script>");

                clear();
                gridfill();
            }
            else if (btnRegister.Text == "UPDATE")
            {
                if (ViewState["id"] == null)
                {
                    Response.Write(
                        "<script>alert('Please select Edit first.');</script>");
                    return;
                }

                int customerId = Convert.ToInt32(ViewState["id"]);

                string fullName = txtName.Text.Trim().Replace("'", "''");
                string mobile = txtMobile.Text.Trim().Replace("'", "''");
                string email = txtEmail.Text.Trim().Replace("'", "''");
                string vehicleNo = txtVehicleNo.Text.Trim().Replace("'", "''");
                string brand = txtVehicleBrand.Text.Trim().Replace("'", "''");
                string model = txtVehicleModel.Text.Trim().Replace("'", "''");
                string username = txtUsername.Text.Trim().Replace("'", "''");
                string password = txtPassword.Text.Replace("'", "''");
                string address = txtAddress.Text.Trim().Replace("'", "''");

                getcon();

                string query =
                    "UPDATE Customer SET " +
                    "FullName='" + fullName + "'," +
                    "Mobile='" + mobile + "'," +
                    "Email='" + email + "'," +
                    "VehicleNumber='" + vehicleNo + "'," +
                    "VehicleBrand='" + brand + "'," +
                    "VehicleModel='" + model + "'," +
                    "Username='" + username + "'," +
                    "Password='" + password + "'," +
                    "Address='" + address + "' " +
                    "WHERE CustomerId=" + customerId;

                cmd = new SqlCommand(query, con);
                int result = cmd.ExecuteNonQuery();

                con.Close();
                cmd.Dispose();
                con.Dispose();

                if (result > 0)
                {
                    Response.Write(
                        "<script>alert('Data Updated Successfully');</script>");

                    clear();
                    gridfill();
                }
                else
                {
                    Response.Write(
                        "<script>alert('Update failed. Record not found.');</script>");
                }
            }
        }

        // LOAD SELECTED RECORD
        void filldata()
        {
            if (ViewState["id"] == null)
            {
                return;
            }

            int customerId = Convert.ToInt32(ViewState["id"]);

            getcon();

            da = new SqlDataAdapter(
                "SELECT * FROM Customer WHERE CustomerId=" + customerId,
                con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables.Count > 0 &&
                ds.Tables[0].Rows.Count > 0)
            {
                txtName.Text =
                    ds.Tables[0].Rows[0]["FullName"].ToString();

                txtMobile.Text =
                    ds.Tables[0].Rows[0]["Mobile"].ToString();

                txtEmail.Text =
                    ds.Tables[0].Rows[0]["Email"].ToString();

                txtVehicleNo.Text =
                    ds.Tables[0].Rows[0]["VehicleNumber"].ToString();

                txtVehicleBrand.Text =
                    ds.Tables[0].Rows[0]["VehicleBrand"].ToString();

                txtVehicleModel.Text =
                    ds.Tables[0].Rows[0]["VehicleModel"].ToString();

                txtUsername.Text =
                    ds.Tables[0].Rows[0]["Username"].ToString();

                txtPassword.Text =
                    ds.Tables[0].Rows[0]["Password"].ToString();

                txtConfirmPassword.Text =
                    ds.Tables[0].Rows[0]["Password"].ToString();

                txtAddress.Text =
                    ds.Tables[0].Rows[0]["Address"].ToString();
            }

            con.Close();
            da.Dispose();
            ds.Dispose();
            con.Dispose();
        }

        // GRID EDIT COMMAND
        protected void GridView1_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                ViewState["id"] = e.CommandArgument.ToString();

                filldata();
                btnRegister.Text = "UPDATE";

                Response.Write(
                    "<script>alert('Record Loaded. Make changes and click UPDATE.');</script>");
            }
        }

        // UPDATE BUTTON
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] != null)
            {
                filldata();
                btnRegister.Text = "UPDATE";
            }
            else
            {
                Response.Write(
                    "<script>alert('Please select Edit from Registered Details first.');</script>");
            }
        }

        // DELETE BUTTON
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                Response.Write(
                    "<script>alert('Please select Edit from Registered Details first.');</script>");
                return;
            }

            int customerId = Convert.ToInt32(ViewState["id"]);

            getcon();

            cmd = new SqlCommand(
                "DELETE FROM Customer WHERE CustomerId=" + customerId,
                con);

            int result = cmd.ExecuteNonQuery();

            con.Close();
            cmd.Dispose();
            con.Dispose();

            if (result > 0)
            {
                Response.Write(
                    "<script>alert('Selected User Data Deleted Successfully');</script>");

                clear();
                gridfill();
            }
            else
            {
                Response.Write(
                    "<script>alert('Record not found.');</script>");
            }
        }

        // RESET BUTTON
        protected void btnReset_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}