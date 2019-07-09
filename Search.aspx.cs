using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadData(DropDownList2, "Roo_Type", "ROOM");
        }

    }

    protected void LoadData(DropDownList list, String parameter, String table)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HOTELConnectionString"].ToString());
        SqlCommand command = new SqlCommand("SELECT " + parameter + " from " + table, connection);
        connection.Open();
        list.DataSource = command.ExecuteReader();
        list.DataTextField = parameter;
        list.DataValueField = parameter;

        list.DataBind();
        //list.Items.Insert(0, "All");
        connection.Close();
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }

    protected void btnSearchPrice_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        Panel1.Visible = false;
        Panel2.Visible = true;
    }



    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detail")
        {
            Response.Redirect("Detail.aspx?id=" + e.CommandArgument.ToString());
        }
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detail")
        {
            Response.Redirect("Detail.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}