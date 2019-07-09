<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="mt-3 container">
            <h1 class="text-center" style="color: #b58e3e;">THE BEST CHOICE FOR YOU <span style="font-size: smaller" class="lead">&</span> YOUR FAMILY</h1>
            <div class="row mt-3">
                <div class="col-3">
                    <p class="mb-1" style="color:coral">Search by Price</p>
                    <asp:DropDownList CssClass="rounded py-2 border-primary" ID="DropDownList1" runat="server" Width="100%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="1000">All</asp:ListItem>
                        <asp:ListItem Value="300">&lt; $ 300</asp:ListItem>
                        <asp:ListItem Value="500">$ 300 - $ 500</asp:ListItem>
                        <asp:ListItem Value="700">$ 500 - $ 700</asp:ListItem>
                        <asp:ListItem Value="700">&gt; $ 700</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnSearchPrice" CssClass="btn btn-primary float-right mt-2 px-3" runat="server" Text="Search" OnClick="btnSearchPrice_Click" />
                </div>
                <div class="col-3">

                    <p class="mb-1" style="color:coral">Search by Room Type</p>
                    <asp:DropDownList CssClass="rounded py-2 border-success" ID="DropDownList2" runat="server" Width="100%">
                    </asp:DropDownList>

                    <asp:Button ID="btnSearch" CssClass="btn btn-success float-right mt-2 px-3" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </div>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <!--PANEL PRICE-->
                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal" DataKeyField="Roo_ID" OnItemCommand="DataList1_ItemCommand1">

                        <ItemTemplate>
                            <div class="col-12 mb-3 rounded">
                                <div class="card">
                                    <img src="image/<%# Eval("Roo_Image") %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-6">
                                                <p class="card-title h2 text-info myTitle"><%# Eval("Roo_Name") %></p>
                                            </div>
                                            <div class="col-6">
                                                <p class="card-title h2 float-right">$ <%# Eval("Roo_Price") %></p>
                                            </div>
                                        </div>
                                        <p class="card-text lead"><%# Eval("Roo_Type") %></p>
                                        <asp:Button ID="Button1" runat="server" Text="More Detail" CommandName="detail" CssClass="btn btn-outline-primary btn-lg" CommandArgument='<%# Eval("Roo_ID") %>' />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT * FROM [ROOM] WHERE ([Roo_Price] &lt;= @Roo_Price)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Roo_Price" PropertyName="SelectedValue" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>



                <!--PANEL ROOM LOCATION-->
                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="2" RepeatDirection="Horizontal" DataKeyField="Roo_ID" OnItemCommand="DataList2_ItemCommand" >
                        <ItemTemplate>
                            <div class="col-12 mb-3 rounded">
                                <div class="card">
                                    <img src="image/<%# Eval("Roo_Image") %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-8">
                                                <p class="card-title h5 lead" style="color:#b58e3e"> <%# Eval("Loc_Name") %></p>
                                            </div>
                                            <div class="col-4">
                                                <p class="card-title h6 float-right">Status :  <%# Eval("Status") %></p>
                                            </div>
                                            <div class="col-9">
                                                <p class="card-title h2 text-info myTitle"><%# Eval("Roo_Name") %></p>
                                            </div>
                                            <div class="col-3">
                                                <p class="card-title h2 float-right">$ <%# Eval("Roo_Price") %></p>
                                            </div>
                                        </div>
                                        <p class="card-text lead"><%# Eval("Roo_Type") %></p>
                                        <asp:Button ID="Button1" runat="server" Text="More Detail" CommandName="detail" CssClass="btn btn-outline-primary btn-lg" CommandArgument='<%# Eval("Roo_ID") %>' />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT ROOM.Roo_ID, ROOM.Roo_Name, ROOM.Roo_Bed, ROOM.Roo_Type, ROOM.Roo_Price, ROOM.Roo_Image, ROOM.Roo_Person, LOCATION.Loc_ID, LOCATION.Loc_Name, LOCATION.Loc_Phone, LOCATION.Loc_Address, LOCATION.Loc_District, LOCATION.Loc_City, ROOM_LOCATION.Roo_ID AS Expr1, ROOM_LOCATION.Loc_ID AS Expr2, ROOM_LOCATION.Status, ROOM_LOCATION.Description FROM ROOM_LOCATION INNER JOIN LOCATION ON ROOM_LOCATION.Loc_ID = LOCATION.Loc_ID INNER JOIN ROOM ON ROOM_LOCATION.Roo_ID = ROOM.Roo_ID WHERE (ROOM.Roo_Type = @Roo_Type)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Roo_Type" PropertyName="SelectedValue" DefaultValue="'%a%'" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
        </div>
    </section>
</asp:Content>

