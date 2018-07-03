<%@ Page Title="" Language="C#" MasterPageFile="~/LoginRegistrationMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Test1.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-8 col-md-offset-2">
        <legend class="text-center">Login</legend>
        <div class="login-form">            
                <div class="form-group">
                    <label for="">Email</label>
                    <div class="clearfix">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" required></asp:TextBox>
                        <div class="clearfix">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <fieldset>
                                <asp:Button ID="BtnLogin" runat="server" OnClick="Button1_Click1" Text="Login" class="btn btn-primary" />
                                <p>
                                    <a href="Registration.aspx">No account yet? Create one </a>
                                </p>

                            </fieldset>
                        </div>
                    </div>
                    </div>           
        </div>
    </div>
</asp:Content>


