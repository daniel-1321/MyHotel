using System;

using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "detail")
        {
            Response.Redirect("Detail.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}