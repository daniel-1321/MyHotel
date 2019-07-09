<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container mt-3" style="padding-left: 10%; padding-right: 10%">
        <h1 class="text-center lead display-4" style="color: #b58e3e">REGISTRATION FORM</h1>
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
        <div class="border border-info rounded py-3 px-5 ">
            <asp:HiddenField ID="txtID" runat="server" />
            <!--NAME-->
            <div class="form-group">
                <label for="inputAddress">Full Name <span class="text-danger mr-2">(*) </span></label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" runat="server" ErrorMessage="Name can NOT be empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter your name" TextMode="SingleLine"></asp:TextBox>

            </div>
            <!--EMAIL + PASSWORD-->
            <div class="form-row ">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Email <span class="text-danger mr-2">(*) </span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email can NOT be empty" ForeColor="#FF3300"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Password <span class="text-danger mr-2">(*) </span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password can NOT be empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <!--PHONE-->
            <div class="form-group">
                <label for="inputAddress">Phone Number <span class="text-danger mr-2">(*) </span></label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPhone" runat="server" ErrorMessage="Phone can NOT be empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="Enter your phone" TextMode="Number"></asp:TextBox>

            </div>
            <!--ADDRESS-->
            <div class="form-group">
                <label for="inputAddress">Address <span class="text-danger mr-2">(*)</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtAddress" runat="server" ErrorMessage="Address can NOT be empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter your address" TextMode="SingleLine"></asp:TextBox>

            </div>
            <!--DOB + GENDER-->
            <div class="form-row">
                <div class="form-group col-md-7">
                    <label for="inputCity">Date of Birth</label>
                    <div class="form-row">
                        <asp:TextBox ID="txtDob" runat="server" placeholder="Choose your birthday" class="form-control w-75"></asp:TextBox>
                        <asp:Button ID="btnCalendar" runat="server" CssClass="btn btn-primary ml-2" Text="Date" OnClick="btnCalendar_Click" />
                    </div>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" ShowGridLines="True" Visible="False" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
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
                <div class="form-group col-md-5">
                    <label for="inputState">State</label>
                    <asp:RadioButtonList ID="radGender" CssClass="mt-2" runat="server" RepeatDirection="Horizontal" Width="336px">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="form-group justify-content-between">
                <asp:Button ID="btnRegister" CssClass="btn btn-outline-primary btn-block mt-3" runat="server" Text="REGISTER" OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
</asp:Content>

