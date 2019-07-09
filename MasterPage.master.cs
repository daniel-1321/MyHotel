using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Cus_Name"] != null)
        {
            lblCusName.Text = "Welcome to our Hotel - " + Session["Cus_Name"].ToString();
            lblLogout.Visible = true;
            lblMyAccount.Visible = true;
            
        }


    }



    public Label GetName
    {
        get
        {
            return this.lblCusName;
        }
    }

    public LinkButton ShowAccountButton
    {
        get
        {
            return this.lblMyAccount;
        }

    }
    public LinkButton ShowLogoutButon
    {
        get
        {
            return this.lblLogout;
        }

    }

 

    protected void lblLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Index.aspx");
    }

    protected void lblMyAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("Account.aspx");
    }
}
