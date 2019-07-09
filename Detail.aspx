<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="container-fluid justify-content-center mt-3">
            <div class="row">
                <div class="col-7 mb-3 rounded">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Roo_ID" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" Height="630px">
                        <ItemTemplate>
                            <div class="card">
                                <img src="image/<%# Eval("Roo_Image") %>" class="card-img-top" alt="..." style="height: 580px">

                                <div class="card-body">
                                    <p class="card-text lead text-right font-weight-bolder myType display-4"><%# Eval("Roo_Type") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>


                </div>
                <div class="col-5">
                    <!-- PANEL 1 DETAIL-->
                    <asp:Panel ID="Panel1" runat="server" Height="64px" Visible="true">
                        <asp:DataList ID="DataList2" runat="server" DataKeyField="Roo_ID" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%">
                            <ItemTemplate>
                                <h2 style="color: #b58e3e;" class=""><%# Eval("Roo_Name") %></h2>
                                <p class="card-text lead font-weight-bold text-center">ROOM AMIANTIES</p>
                                <div class="room-facilities d-flex justify-content-center">
                                    <figure class="text-center myFigure">
                                        <figcaption><i class="fas fa-user-friends h4"></i>
                                            <br />
                                            <%# Eval("Roo_Person") %> Persons
                                        </figcaption>
                                    </figure>
                                    <figure class="text-center myFigure">
                                        <figcaption><i class="fas fa-utensils h4"></i>
                                            <br />
                                            All inclusive
                                        </figcaption>
                                    </figure>
                                    <figure class="text-center myFigure">
                                        <figcaption><i class="fas fa-bed h4"></i>
                                            <br />
                                            <%# Eval("Roo_Bed") %> Bed(s)
                                        </figcaption>
                                    </figure>
                                    <figure class="text-center myFigure ">
                                        <figcaption><i class="fas fa-wifi h4"></i>
                                            <br />
                                            Internet 
                                        </figcaption>
                                    </figure>
                                    <figure class="text-center myFigure">
                                        <figcaption><i class="fas fa-concierge-bell h4"></i>
                                            <br />
                                            Room Service
                                        </figcaption>
                                    </figure>
                                    <figure class="text-center myFigure">
                                        <figcaption><i class="fas fa-glass-martini h4"></i>
                                            <br />
                                            Lounge
                                        </figcaption>
                                    </figure>


                                </div>
                                <p class="card-text lead font-weight-bold text-center mt-3">HOUSE RULES</p>


                                <!-- === box === -->

                                <div class="box lead">
                                    <div class="row border-bottom">
                                        <div class="col-md-4">
                                            <p>Check-In</p>
                                        </div>
                                        <div class="col-md-8">
                                            <p class="">14:00 - 22:00</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- === box === -->

                                <div class="box mt-2 lead">
                                    <div class="row border-bottom">
                                        <div class="col-md-4">
                                            <p>Check-out</p>
                                        </div>
                                        <div class="col-md-8">
                                            <p>14:00 - 22:00</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- === box === -->

                                <div class="box mt-2 lead">
                                    <div class="row border-bottom">
                                        <div class="col-md-4">
                                            <p>Children</p>
                                        </div>
                                        <div class="col-md-8">
                                            <p>All children are welcome.</p>
                                            <p>There is no capacity for extra beds.</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- === box === -->

                                <div class="box mt-2 lead">
                                    <div class="row border-bottom">
                                        <div class="col-md-4">
                                            <p>Pets</p>
                                        </div>
                                        <div class="col-md-8">
                                            <p>Pets are not allowed.</p>
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:DataList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT * FROM [ROOM] WHERE ([Roo_ID] = @Roo_ID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Roo_ID" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button Text="LOGIN FOR RESERVATION" CssClass=" mt-3 btn btn-outline-primary w-100 py-3" runat="server" ID="btnShowLoginForm" OnClick="btnShowLoginForm_Click" />
                        <asp:Button Text="BOOKING NOW" CssClass=" mt-3 btn btn-outline-primary w-100 py-3" runat="server" ID="btnBooking" Visible="false" OnClick="btnBooking_Click" CommandName="booking" CommandArgument='<%# Eval("Roo_ID") %>' />

                        <div class="text-center mt-2">
                            <asp:LinkButton ID="LinkButton1" CssClass="display-5 text-dark font-weight-bold" runat="server" OnClick="LinkButton1_Click" Font-Size="Small">Register here</asp:LinkButton>
                        </div>
                    </asp:Panel>

                    <!-- PANEL 2 LOGIN -->
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        <h2 class="card-title lead font-weight-bolder text-monospace">LOGIN</h2>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Email <span class="text-danger">(*)</span></label>
                                <asp:TextBox ID="myEmail" runat="server" class="form-control" placeholder="Enter your email" OnTextChanged="myEmail_TextChanged"></asp:TextBox>
                                <asp:Label ID="lblMyEmail" runat="server" Text="" CssClass="text-danger"></asp:Label>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Password <span class="text-danger">(*)</span></label>
                                <asp:TextBox ID="myPwd" runat="server" TextMode="Password" class="form-control" placeholder="Enter your password"></asp:TextBox>
                                <asp:Label ID="lblMyPwd" runat="server" Text="" CssClass="text-danger"></asp:Label>
                            </div>
                        </div>

                        <asp:Button Text="LOG IN" CssClass="btn btn-outline-primary mr-3 px-3" runat="server" ID="btnLogin" OnClick="btnLogin_Click" />
                        <asp:Button Text="SIGN UP" CssClass="btn btn-danger px-3" runat="server" ID="btnSignup" OnClick="btnSignup_Click" />
                        <br />
                        <asp:Label ID="myLogin" runat="server" CssClass="text-danger" Text=""></asp:Label>
                    </asp:Panel>

                    <!-- PANEL 3 RESERVATION-->
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                        <asp:HiddenField ID="txtBookID" runat="server" />
                        <h2 class="card-title lead font-weight-bolder text-monospace">RESERVATION DETAIL</h2>
                        
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1" DataKeyField="Roo_ID" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%">
                                <ItemTemplate>
                                    <asp:Label Visible="false" ID="Roo_IDLabel" runat="server" Text='<%# Eval("Roo_ID") %>' />
                                    <div class="row">
                                        <div class="col-6">
                                            <h2 style="color:#b58e3e"><asp:Label ID="Roo_NameLabel" runat="server" Text='<%# Eval("Roo_Name") %>' /></h2>
                                        </div>
                                        <div class="col-6">
                                            <h2 class="text-right">$ <asp:Label CssClass="display-5" ID="Roo_PriceLabel" runat="server" Text='<%# Eval("Roo_Price") %>' /> <span class="lead"> Per Night</span></h2>
                                        </div>
                                   </div>
                                    
                                </ItemTemplate>
                            </asp:DataList>
                             
                        <div class="form-row">
                            <div class="col-6">
                                <label for="inputCity">Arrival Date</label><asp:Label ID="lblArrival" CssClass="ml-1 text-danger" runat="server" Text="*" Font-Size="Smaller"></asp:Label>
                                <div class="form-row">
                                    <asp:TextBox ID="txtArrival" runat="server" placeholder="Arrival Date" class="form-control w-75"></asp:TextBox>
                                    <asp:Button ID="btnArrival" runat="server" CssClass="btn btn-primary ml-1" Text="Date" OnClick="btnArrival_Click" />
                                </div>
                                <asp:Calendar Format="dd/MM/yyyy" ID="calArrival" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" ShowGridLines="True" Visible="False" Width="220px" OnDayRender="calArrival_DayRender" OnSelectionChanged="calArrival_SelectionChanged">
                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                </asp:Calendar>
                            </div>
                            <div class="col-6">
                                <label for="inputCity">Departure Date</label><asp:Label ID="lblDeparture" CssClass="ml-1 text-danger" runat="server" Text="*" Font-Size="Smaller"></asp:Label>
                                <div class="form-row">
                                    <asp:TextBox ID="txtDeparture" runat="server" placeholder="Departure Date" class="form-control w-75"></asp:TextBox>
                                    <asp:Button ID="btnDeparture" runat="server" CssClass="btn btn-primary ml-1" Text="Date" OnClick="btnDeparture_Click" />
                                </div>
                                <asp:Calendar ID="calDeparture" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" ShowGridLines="True" Visible="False" Width="220px" OnDayRender="calDeparture_DayRender" OnSelectionChanged="calDeparture_SelectionChanged" Format="dd/MM/yyyy">
                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                </asp:Calendar>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-6">
                                <label for="inputCity">Adult</label><asp:Label ID="lblAdult" CssClass="ml-1 text-danger" runat="server" Text="*" Font-Size="Smaller"></asp:Label>
                                <asp:TextBox ID="txtAdult" runat="server" placeholder="Adult" class="form-control w-100" TextMode="Number" Text="1"></asp:TextBox>

                            </div>
                            <div class="col-6">
                                <label for="inputCity">Children</label><asp:Label ID="lblChldren" CssClass="ml-1 text-danger" runat="server" Text="*" Font-Size="Smaller"></asp:Label>
                                <asp:TextBox ID="txtChildren" runat="server" placeholder="Children" class="form-control w-100" TextMode="Number" Text="0"></asp:TextBox>

                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <label for="inputCity">Note</label>
                                <asp:TextBox ID="txtNote" runat="server" placeholder="Your Note" class="form-control w-100" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row mt-2">
                            <div class="col-12">
                                <label for="inputCity">Choose Location</label><asp:Label ID="lblLocation" CssClass="ml-1 text-danger" runat="server" Text="*" Font-Size="Smaller"></asp:Label>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Loc_Name" DataValueField="Loc_ID" RepeatDirection="Horizontal" CellPadding="2" CellSpacing="2"></asp:RadioButtonList>

                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT ROOM.Roo_Name, ROOM.Roo_Price, ROOM_LOCATION.Roo_ID, LOCATION.Loc_ID, LOCATION.Loc_Name, LOCATION.Loc_Phone, LOCATION.Loc_Address, LOCATION.Loc_District, ROOM_LOCATION.Status, ROOM_LOCATION.Description FROM  ROOM_LOCATION INNER JOIN LOCATION ON ROOM_LOCATION.Loc_ID = LOCATION.Loc_ID INNER JOIN ROOM ON ROOM.Roo_ID = ROOM_LOCATION.Roo_ID WHERE (ROOM_LOCATION.Status = 'Available' AND ROOM_LOCATION.Roo_ID = @Roo_ID)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Roo_ID" QueryStringField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnReservation" runat="server" Text="Done" CssClass="btn btn-block p-2 font-weight-bolder" ForeColor="White" Font-Size="Large" BackColor="#b58e3e" OnClick="btnReservation_Click" />
                    </asp:Panel>


                </div>
            </div>
        </div>

    </section>
</asp:Content>

