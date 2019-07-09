using System;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Detail : System.Web.UI.Page
{
    String query = "";
    SqlCommand command;
    SqlDataReader reader;
    DateTime today;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Cus_Name"] != null)
        {
            LinkButton1.Visible = false;
            btnShowLoginForm.Visible = false;
            btnBooking.Visible = true;
            today = DateTime.Today;
        }


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        connection.Open();

        if (checkInput())
        {
            query = ("Select count(*) From CUSTOMER where Cus_Email='" + myEmail.Text + "' and Cus_Password='" + myPwd.Text + "'");
            command = new SqlCommand(query, connection);
            String count = command.ExecuteScalar().ToString();
            if (count == "1")
            {
                query = ("Select Cus_Name, Cus_ID From CUSTOMER where Cus_Email='" + myEmail.Text + "'");
                command = new SqlCommand(query, connection);
                reader = command.ExecuteReader();
                reader.Read();

                Session["Cus_Name"] = reader[0];
                Session["Cus_ID"] = reader[1];

                ((MasterPage)Master).GetName.Text = "Welcome to our Hotel - " + Session["Cus_Name"].ToString();
                ((MasterPage)Master).ShowAccountButton.Visible = true;
                ((MasterPage)Master).ShowLogoutButon.Visible = true;
                myEmail.Text = "";
                myPwd.Text = "";

                Panel2.Visible = false;
                Panel3.Visible = true;
            }
            else
            {
                myLogin.Text = "Invalid Account. Please try again!";
            }
        }



    }

    protected Boolean checkInput()
    {
        if (String.IsNullOrWhiteSpace(myEmail.Text))
        {
            lblMyEmail.Text = "Please enter your Email";
            return false;
        }
        if (String.IsNullOrWhiteSpace(myPwd.Text))
        {
            lblMyPwd.Text = "Please enter your Password";
            return false;
        }
        return true;
    }

    protected void btnShowLoginForm_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }





    protected void myEmail_TextChanged(object sender, EventArgs e)
    {
        lblMyEmail.Text = "";
    }

    protected void myPwd_TextChanged(object sender, EventArgs e)
    {
        lblMyPwd.Text = "";
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void btnBooking_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel3.Visible = true;
    }

    protected void btnReservation_Click(object sender, EventArgs e)
    {
        
        if (checkDate())
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
            connection.Open();
            command = new SqlCommand("InsertBooking", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Boo_ID", Convert.ToInt32(txtBookID.Value == "" ? "0" : txtBookID.Value));
            command.Parameters.AddWithValue("@Cus_ID", Session["Cus_ID"].ToString());
            command.Parameters.AddWithValue("@Roo_ID", Convert.ToInt32(((Label)(DataList3.Items[0].FindControl("Roo_IDLabel"))).Text));
            command.Parameters.AddWithValue("@Loc_ID", RadioButtonList1.SelectedValue);
            command.Parameters.AddWithValue("@Boo_CheckIn", txtArrival.Text);
            command.Parameters.AddWithValue("@Boo_CheckOut", txtDeparture.Text);
            command.Parameters.AddWithValue("@Boo_Quantity", countDay());
            command.Parameters.AddWithValue("@Boo_Price", price());
            command.Parameters.AddWithValue("@Boo_Adult", Convert.ToInt32(txtAdult.Text));
            command.Parameters.AddWithValue("@Boo_Children", Convert.ToInt32(txtChildren.Text));
            command.Parameters.AddWithValue("@Boo_Date", today.ToString("dd/MM/yyyy"));
            command.Parameters.AddWithValue("@Boo_Total", total().ToString());
            command.Parameters.AddWithValue("@Boo_Note", txtNote.Text);
            command.ExecuteNonQuery();
            connection.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "", "showAlert()", true);
            UpdateRoom();
        }
        
    }

    protected void UpdateRoom()
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        connection.Open();
        command = new SqlCommand("UpdateRoom", connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@Roo_ID", Convert.ToInt32(((Label)(DataList3.Items[0].FindControl("Roo_IDLabel"))).Text));
        command.Parameters.AddWithValue("@Loc_ID", RadioButtonList1.SelectedValue);
        command.Parameters.AddWithValue("@Status", "Unavailable");
        command.ExecuteNonQuery();
        connection.Close();
    }
    protected Boolean checkDate()
    {
        if (String.IsNullOrEmpty(txtArrival.Text))
        {
            lblArrival.Text = "Choose Arrival Date";
            return false;
        }

        if (String.IsNullOrEmpty(txtDeparture.Text))
        {
            lblDeparture.Text = "Choose Departure Date";
            return false;
        }
        if (txtArrival.Text.Equals(txtDeparture.Text) == true)
        {
            lblDeparture.Text = "Choose another Date";
            return false;
        }

        if (RadioButtonList1.SelectedIndex < 0)
        {
            lblLocation.Text = "Choose one";
            return false;
        }
        if (String.IsNullOrEmpty(txtAdult.Text))
        {
            lblAdult.Text = "Enter a number";
            return false;
        }
        if (String.IsNullOrEmpty(txtChildren.Text))
        {
            lblChldren.Text = "Enter a number";
            return false;
        }
        return true;
    }
    protected int countDay()
    {
        DateTime start = DateTime.Parse(txtArrival.Text);
        DateTime end = DateTime.Parse(txtDeparture.Text);
        TimeSpan Difference = (end - start);
        int days = Difference.Days;
        return days;

    }

    protected decimal total()
    {
        Decimal total;
        total = Convert.ToDecimal(((Label)(DataList3.Items[0].FindControl("Roo_PriceLabel"))).Text);
        return total * countDay();
    }

    protected String price()
    {
        return Convert.ToString(((Label)(DataList3.Items[0].FindControl("Roo_PriceLabel"))).Text);
    }
    protected void btnArrival_Click(object sender, EventArgs e)
    {
        calArrival.Visible = true;
    }




    protected void calArrival_SelectionChanged(object sender, EventArgs e)
    {
        txtArrival.Text = calArrival.SelectedDate.ToShortDateString();
        calArrival.Visible = false;
        lblArrival.Text = "";
    }

    protected void calDeparture_SelectionChanged(object sender, EventArgs e)
    {
        txtDeparture.Text = calDeparture.SelectedDate.ToShortDateString();
        calDeparture.Visible = false;
        lblDeparture.Text = "";
    }

    protected void btnDeparture_Click(object sender, EventArgs e)
    {
        calDeparture.Visible = true;
    }


    protected void calArrival_DayRender(object sender, DayRenderEventArgs e)
    {

        if (e.Day.Date < DateTime.Now)
        {

            e.Cell.BackColor = ColorTranslator.FromHtml("#a9a9a9");

            e.Day.IsSelectable = false;

        }
    }

    protected void calDeparture_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date <= DateTime.Now)
        {

            e.Cell.BackColor = ColorTranslator.FromHtml("#a9a9a9");

            e.Day.IsSelectable = false;

        }
    }
}