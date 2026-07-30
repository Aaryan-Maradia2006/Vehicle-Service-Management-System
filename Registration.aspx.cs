using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleServiceManagementSystem
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
                lblOutput.Text =
                "<b>Registration Successful!</b><br/><br/>" +
                "<b>Full Name:</b> " + txtName.Text + "<br/>" +
                "<b>Mobile:</b> " + txtMobile.Text + "<br/>" +
                "<b>Email:</b> " + txtEmail.Text + "<br/>" +
                "<b>Vehicle Number:</b> " + txtVehicleNo.Text + "<br/>" +
                "<b>Vehicle Model:</b> " + txtVehicleModel.Text + "<br/>" +
                "<b>Username:</b> " + txtUsername.Text + "<br/>" +
                "<b>Address:</b> " + txtAddress.Text;
        }
    }
}