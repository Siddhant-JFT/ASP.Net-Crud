<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD_Operations._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1 class="text-center">CRUD in ASP.net</h1>
        <h3 class="text-center">Login Here</h3>
    </div>

    <div class="row flex">
        <div class="col-md-12" style="justify-content:center;">

            <div class="form-row">
                <div class="form-group col-md-12">
                  <label for="inputEmail4">Username: </label>
                  <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Your Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-12">
                  <label for="inputPassword4">Password: </label><br />
                    <asp:TextBox ID="TextBox2" type="password" class="form-control" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-row">
                    <div class="col-md-12">
                        <asp:Button ID="Button1" runat="server" Text="Log In" class="btn btn-primary" OnClick="Button1_Click" />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </div>
                </div>
              </div>
        </div>
    </div>
</asp:Content>
