using System;
using System.Activities.Validation;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    String query = "";
    DateTime today;
    SqlCommand command;
    protected void Page_Load(object sender, EventArgs e)
    {

        today = DateTime.Today;
        txtDob.Text = today.ToString("dd/MM/yyyy");

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtDob.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
        Calendar1.Visible = false;
    }



    protected void btnCalendar_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected Boolean checkEmail()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        connection.Open();
        query = ("Select count(*) From CUSTOMER where Cus_Email='" + txtEmail.Text + "'");
        command = new SqlCommand(query, connection);
        String count = command.ExecuteScalar().ToString();
        if (count == "1")
        {
            Label1.Text = "<script>alert('Email has been existed. Please again!')</script>";
            txtEmail.Text = "";
            SetFocus(txtEmail);
            return false;
        }
        return true;
    }
    protected Boolean checkPhone()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        connection.Open();
        query = ("Select count(*) From CUSTOMER where Cus_Phone='" + txtPhone.Text + "'");
        command = new SqlCommand(query, connection);
        String count = command.ExecuteScalar().ToString();
        if (count == "1")
        {
            Label1.Text = "<script>alert('Phone number has been existed. Please again!')</script>";
            txtPhone.Text = "";
            SetFocus(txtPhone);
            return false;
        }
        return true;
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        connection.Open();
        if (checkEmail() && checkPhone())
        {
            command = new SqlCommand("CustomerRegister", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Cus_ID", Convert.ToInt32(txtID.Value == "" ? "0" : txtID.Value));
            command.Parameters.AddWithValue("@Cus_Name", txtName.Text);
            command.Parameters.AddWithValue("@Cus_Phone", txtPhone.Text.Trim());
            command.Parameters.AddWithValue("@Cus_Email", txtEmail.Text.Trim());
            command.Parameters.AddWithValue("@Cus_Password", txtPassword.Text.Trim());
            command.Parameters.AddWithValue("@Cus_Address", txtAddress.Text);
            command.Parameters.AddWithValue("@Cus_DOB", txtDob.Text);
            command.Parameters.AddWithValue("@Cus_Gender", radGender.Text);
            command.Parameters.AddWithValue("@Cus_Type", "A");
            command.Parameters.AddWithValue("@Cus_Join", today.ToString("dd-MM-yyyy"));
            command.ExecuteNonQuery();
            Label1.Text = "<script>alert('Register successfully')</script>";
            Clear();
        }

    }

    protected void Clear()
    {
        txtName.Text = txtEmail.Text = txtPassword.Text = txtPhone.Text = txtAddress.Text = "";
        txtDob.Text = today.ToString("dd-MM-yyyy");
        radGender.SelectedItem.Text = "Male";
    }
}