using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlModel.Items.Add("Select Model");
            }
        }
        protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlModel.Items.Clear();

            ddlModel.Items.Add("Select Model");

            switch (ddlBrand.SelectedValue)
            {
                case "Maruti Suzuki":
                    ddlModel.Items.Add("Swift");
                    ddlModel.Items.Add("Baleno");
                    ddlModel.Items.Add("Brezza");
                    ddlModel.Items.Add("Ertiga");
                    break;

                case "Hyundai":
                    ddlModel.Items.Add("i20");
                    ddlModel.Items.Add("Creta");
                    ddlModel.Items.Add("Venue");
                    ddlModel.Items.Add("Verna");
                    break;

                case "Honda":
                    ddlModel.Items.Add("City");
                    ddlModel.Items.Add("Amaze");
                    ddlModel.Items.Add("Elevate");
                    break;

                case "Tata":
                    ddlModel.Items.Add("Nexon");
                    ddlModel.Items.Add("Punch");
                    ddlModel.Items.Add("Harrier");
                    ddlModel.Items.Add("Safari");
                    break;

                case "Mahindra":
                    ddlModel.Items.Add("Thar");
                    ddlModel.Items.Add("Scorpio N");
                    ddlModel.Items.Add("XUV700");
                    ddlModel.Items.Add("Bolero");
                    break;

                case "Toyota":
                    ddlModel.Items.Add("Fortuner");
                    ddlModel.Items.Add("Innova");
                    ddlModel.Items.Add("Glanza");
                    break;

                case "Kia":
                    ddlModel.Items.Add("Sonet");
                    ddlModel.Items.Add("Seltos");
                    ddlModel.Items.Add("Carens");
                    ddlModel.Items.Add("EV6");
                    break;

                case "MG":
                    ddlModel.Items.Add("Hector");
                    ddlModel.Items.Add("Astor");
                    ddlModel.Items.Add("Comet EV");
                    ddlModel.Items.Add("ZS EV");
                    break;
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            lblBooking.Text =
                "<b>Customer Name : </b>" + txtCustomerName.Text + "<br/>" +
                "<b>Mobile Number : </b>" + txtMobile.Text + "<br/>" +
                "<b>Email : </b>" + txtEmail.Text + "<br/>" +
                "<b>Vehicle Number : </b>" + txtVehicleNumber.Text + "<br/>" +
                "<b>Brand : </b>" + ddlBrand.SelectedItem.Text + "<br/>" +
                "<b>Model : </b>" + ddlModel.SelectedItem.Text + "<br/>" +
                "<b>Service : </b>" + ddlService.SelectedItem.Text + "<br/>" +
                "<b>Booking Date : </b>" + txtDate.Text + "<br/>" +
                "<b>Pickup Required : </b>" + rblPickup.SelectedItem.Text + "<br/>" +
                "<b>Problem : </b>" + txtProblem.Text;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtCustomerName.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtVehicleNumber.Text = "";

            ddlBrand.SelectedIndex = 0;

            ddlModel.Items.Clear();
            ddlModel.Items.Add("Select Model");
            ddlModel.SelectedIndex = 0;

            ddlService.SelectedIndex = 0;

            txtDate.Text = "";

            rblPickup.ClearSelection();

            txtProblem.Text = "";

            lblBooking.Text = "";
        }
    }
}