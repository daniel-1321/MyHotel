<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="container mt-3">
            <div class="row">
                <div class="col-6 border-info">
                    <h2 class="myType text-center">YOUR INFORMATION</h2>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Cus_ID" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%" CellPadding="3">
                        <ItemTemplate>

                            <asp:Table CellPadding="2" ID="Table1" runat="server" CssClass="table-bordered" Width="100%" CellSpacing="3">
                                <asp:TableRow>
                                    <asp:TableCell>Name</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_Name") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Phone</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_Phone") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Email</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_Email") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Address</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_Address") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>DOB</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_DOB") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Type</asp:TableCell>
                                    <asp:TableCell><%# Eval("Cus_Type") %></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] WHERE ([Cus_ID] = @Cus_ID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Cus_ID" SessionField="Cus_ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-6 border-info">
                    <h2 class="myType text-center">YOUR BOOKING</h2>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" Width="100%">
                        <ItemTemplate>
                            <asp:Table CellPadding="2" ID="Table1" runat="server" CssClass="table-bordered" Width="100%" CellSpacing="3">
                                <asp:TableRow>
                                    <asp:TableCell>Room Name</asp:TableCell>
                                    <asp:TableCell><%# Eval("Roo_Name") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Location</asp:TableCell>
                                    <asp:TableCell><%# Eval("Loc_Name") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Check In Date</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_CheckIn") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Check Out Date</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_CheckOut") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Adult</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_Adult") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Children</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_Children") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Book Date</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_Date") %></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Total</asp:TableCell>
                                    <asp:TableCell><%# Eval("Boo_Total") %></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT ROOM.Roo_Name, LOCATION.Loc_Name, BOOKING.Boo_CheckIn, BOOKING.Boo_CheckOut, BOOKING.Boo_Adult, BOOKING.Boo_Children, BOOKING.Boo_Date, BOOKING.Boo_Total FROM BOOKING INNER JOIN CUSTOMER ON BOOKING.Cus_ID = CUSTOMER.Cus_ID INNER JOIN LOCATION ON BOOKING.Loc_ID = LOCATION.Loc_ID INNER JOIN ROOM ON BOOKING.Roo_ID = ROOM.Roo_ID WHERE (CUSTOMER.Cus_ID = @Cus_ID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Cus_ID" SessionField="Cus_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

