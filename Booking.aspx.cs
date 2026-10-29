
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class Booking : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadModels();
                LoadServiceBrands();
                LoadCustomerDetails();
            }
        }

        // Registration details automatically load
        void LoadCustomerDetails()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT FullName, Mobile, Email,
                                        VehicleNumber, VehicleBrand, VehicleModel
                                 FROM Customer
                                 WHERE CustomerId = @CustomerId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@CustomerId",
                    Convert.ToInt32(Session["CustomerId"]));

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCustomerName.Text = dr["FullName"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtVehicleNumber.Text = dr["VehicleNumber"].ToString();

                    string brand = dr["VehicleBrand"].ToString();
                    string model = dr["VehicleModel"].ToString();

                    if (ddlBrand.Items.FindByValue(brand) != null)
                    {
                        ddlBrand.SelectedValue = brand;
                    }

                    LoadModels();

                    if (ddlModel.Items.FindByValue(model) != null)
                    {
                        ddlModel.SelectedValue = model;
                    }
                }

                dr.Close();
            }
        }

        // Vehicle models according to brand
        void LoadModels()
        {
            string brand = ddlBrand.SelectedValue;

            ddlModel.Items.Clear();
            ddlModel.Items.Add(new ListItem("Select Model", ""));

            if (brand == "Maruti Suzuki")
            {
                ddlModel.Items.Add(new ListItem("Swift", "Swift"));
                ddlModel.Items.Add(new ListItem("Baleno", "Baleno"));
                ddlModel.Items.Add(new ListItem("Brezza", "Brezza"));
                ddlModel.Items.Add(new ListItem("Ertiga", "Ertiga"));
            }
            else if (brand == "Hyundai")
            {
                ddlModel.Items.Add(new ListItem("i20", "i20"));
                ddlModel.Items.Add(new ListItem("Creta", "Creta"));
                ddlModel.Items.Add(new ListItem("Venue", "Venue"));
                ddlModel.Items.Add(new ListItem("Verna", "Verna"));
            }
            else if (brand == "Honda")
            {
                ddlModel.Items.Add(new ListItem("City", "City"));
                ddlModel.Items.Add(new ListItem("Amaze", "Amaze"));
                ddlModel.Items.Add(new ListItem("Elevate", "Elevate"));
            }
            else if (brand == "Tata")
            {
                ddlModel.Items.Add(new ListItem("Nexon", "Nexon"));
                ddlModel.Items.Add(new ListItem("Punch", "Punch"));
                ddlModel.Items.Add(new ListItem("Harrier", "Harrier"));
                ddlModel.Items.Add(new ListItem("Safari", "Safari"));
            }
            else if (brand == "Mahindra")
            {
                ddlModel.Items.Add(new ListItem("Thar", "Thar"));
                ddlModel.Items.Add(new ListItem("Scorpio N", "Scorpio N"));
                ddlModel.Items.Add(new ListItem("XUV700", "XUV700"));
                ddlModel.Items.Add(new ListItem("Bolero", "Bolero"));
            }
            else if (brand == "Toyota")
            {
                ddlModel.Items.Add(new ListItem("Fortuner", "Fortuner"));
                ddlModel.Items.Add(new ListItem("Innova", "Innova"));
                ddlModel.Items.Add(new ListItem("Glanza", "Glanza"));
            }
            else if (brand == "Kia")
            {
                ddlModel.Items.Add(new ListItem("Sonet", "Sonet"));
                ddlModel.Items.Add(new ListItem("Seltos", "Seltos"));
                ddlModel.Items.Add(new ListItem("Carens", "Carens"));
                ddlModel.Items.Add(new ListItem("EV6", "EV6"));
            }
            else if (brand == "MG")
            {
                ddlModel.Items.Add(new ListItem("Hector", "Hector"));
                ddlModel.Items.Add(new ListItem("Astor", "Astor"));
                ddlModel.Items.Add(new ListItem("Comet EV", "Comet EV"));
                ddlModel.Items.Add(new ListItem("ZS EV", "ZS EV"));
            }
        }

        protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadModels();
        }

        // Show related brand choices for the selected service
        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadServiceBrands();
        }

        void AddBrand(string name)
        {
            ddlServiceBrand.Items.Add(new ListItem(name, name));
        }

        void LoadServiceBrands()
        {
            ddlServiceBrand.Items.Clear();
            trServiceBrand.Visible = false;
            lblServiceBrand.Text = "";

            string service = ddlService.SelectedValue;

            if (service == "Oil Change")
            {
                lblServiceBrand.Text = "Oil Brand";
                AddBrand("Select Oil Brand");
                AddBrand("Castrol");
                AddBrand("Mobil");
                AddBrand("Shell");
                AddBrand("Motul");
                trServiceBrand.Visible = true;
            }
            else if (service == "Wheel Alignment")
            {
                lblServiceBrand.Text = "Equipment Brand";
                AddBrand("Select Brand");
                AddBrand("Hunter");
                AddBrand("John Bean");
                AddBrand("Bosch");
                AddBrand("Hofmann");
                trServiceBrand.Visible = true;
            }
            else if (service == "Battery Replacement")
            {
                lblServiceBrand.Text = "Battery Brand";
                AddBrand("Select Battery Brand");
                AddBrand("Amaron");
                AddBrand("Exide");
                AddBrand("Luminous");
                AddBrand("Livguard");
                trServiceBrand.Visible = true;
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Session["CustomerId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtCustomerName.Text) ||
                string.IsNullOrWhiteSpace(txtMobile.Text) ||
                string.IsNullOrWhiteSpace(txtVehicleNumber.Text) ||
                ddlBrand.SelectedIndex == 0 ||
                ddlModel.SelectedIndex == 0 ||
                ddlService.SelectedIndex == 0 ||
                string.IsNullOrWhiteSpace(txtDate.Text))
            {
                ShowMessage("Please fill in all required fields.");
                return;
            }

            if (trServiceBrand.Visible &&
                ddlServiceBrand.SelectedIndex == 0)
            {
                ShowMessage("Please select the required brand.");
                return;
            }

            DateTime bookingDate;

            if (!DateTime.TryParse(txtDate.Text, out bookingDate))
            {
                ShowMessage("Please select a valid booking date.");
                return;
            }

            int customerId = Convert.ToInt32(Session["CustomerId"]);

            string customerName = txtCustomerName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string email = txtEmail.Text.Trim();
            string vehicleNumber = txtVehicleNumber.Text.Trim();
            string vehicleBrand = ddlBrand.SelectedValue;
            string vehicleModel = ddlModel.SelectedValue;
            string service = ddlService.SelectedValue;

            string pickup = "No";

            if (rblPickup.SelectedItem != null)
            {
                pickup = rblPickup.SelectedValue;
            }

            string problem = txtProblem.Text.Trim();

            // Default service charges
            decimal amount = 0;

            if (service == "General Service")
                amount = 1500;
            else if (service == "Oil Change")
                amount = 800;
            else if (service == "Engine Repair")
                amount = 3000;
            else if (service == "Brake Service")
                amount = 1200;
            else if (service == "Battery Replacement")
                amount = 5000;
            else if (service == "Wheel Alignment")
                amount = 1000;
            else if (service == "Car Wash")
                amount = 500;

            // Include selected oil/equipment/battery brand in problem details
            if (trServiceBrand.Visible)
            {
                problem = problem + " | Selected Brand: " +
                          ddlServiceBrand.SelectedValue;
            }

            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"INSERT INTO ServiceHistory
                    (CustomerId, CustomerName, Mobile, Email,
                     VehicleNumber, VehicleBrand, VehicleModel,
                     ServiceType, BookingDate, PickupRequired,
                     ProblemDescription, Status, Amount)
                    VALUES
                    (@CustomerId, @CustomerName, @Mobile, @Email,
                     @VehicleNumber, @VehicleBrand, @VehicleModel,
                     @ServiceType, @BookingDate, @PickupRequired,
                     @ProblemDescription, @Status, @Amount)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                cmd.Parameters.AddWithValue("@CustomerName", customerName);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@VehicleNumber", vehicleNumber);
                cmd.Parameters.AddWithValue("@VehicleBrand", vehicleBrand);
                cmd.Parameters.AddWithValue("@VehicleModel", vehicleModel);
                cmd.Parameters.AddWithValue("@ServiceType", service);
                cmd.Parameters.AddWithValue("@BookingDate", bookingDate);
                cmd.Parameters.AddWithValue("@PickupRequired", pickup);
                cmd.Parameters.AddWithValue("@ProblemDescription",
                    string.IsNullOrWhiteSpace(problem) ? "-" : problem);
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@Amount", amount);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Session["CustomerName"] = customerName;

            Response.Redirect("ServiceHistory.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlBrand.SelectedIndex = 0;
            LoadModels();

            ddlService.SelectedIndex = 0;
            LoadServiceBrands();

            txtDate.Text = "";
            rblPickup.ClearSelection();
            txtProblem.Text = "";
            lblBooking.Text = "";

            LoadCustomerDetails();
        }

        void ShowMessage(string message)
        {
            string safeMessage = message.Replace("\\", "\\\\")
                                        .Replace("'", "\\'")
                                        .Replace("\r", "")
                                        .Replace("\n", "");

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "BookingMessage",
                "alert('" + safeMessage + "');",
                true
            );
        }
    }
}
