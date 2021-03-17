<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_Operations._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="text-center">ASP.net CRUD</h1>
        <h3 class="text-center">Login Here</h3>
    </div>

    <div class=" jumbotron">
        <div class="row">
                
            <div class="col-md-12 text-center" >
                <div class="form-group">
                    <label for="inputEmail4" style="display:block">Username:&nbsp; </label>
                    <asp:TextBox ID="TextBox1" runat="server" Height="24px" style="margin-left: 437px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Your Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <!--Password below this-->
                <div class="form-group" >
                    <label for="inputPassword4" style="display:block">Password: </label>
                    <asp:TextBox ID="TextBox2" type="password"  runat="server" style="display:block; margin-left: 437px;" Height="25px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!--Login btn below this-->
            <div class="row">
                <div class="col-md-12 text-center" >
                    <asp:Button ID="Button1" runat="server" Text="Log In" class="btn btnout btn-primary" OnClick="Button1_Click" />
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
            </div>
    </div>
</asp:Content>
