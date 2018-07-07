<%@ Page Title="" Language="C#" MasterPageFile="~/LoginRegistrationMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Test1.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .blue {
            background-color: blue
        }

        .red {
            background-color: red
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-8 col-md-offset-2">
        <legend class="text-center">Login</legend>
        <div class="login-form">
            <div class="form-group">
                <label for="">Email</label>
                <div class="clearfix">
                    <div>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" onblur="checkEmailAddress()" CssClass="form-control" required></asp:TextBox>
                        <span id="message"></span>
                        <span style="color: red"></span>
                    </div>z
                    <div class="clearfix">
                    </div>
                    <script type="text/javascript">
                        function checkEmailAddress() {
                            var email_address = $("#ContentPlaceHolder1_txtEmail").val();
                            $.ajax({
                                type: "POST",
                                url: "Login.aspx/CheckUserName",
                                data: '{email_address: "' + email_address + '" }',
                                contentType: "application/json; charset=utf-8",
                                success: function (response) {
                                    var message = $("#message");
                                    if (response.d) {
                                        message.css("color", "green");
                                        message.html("Registered Email Address");

                                    }
                                    else {
                                        message.css("color", "red");
                                        message.html("*Unregistered Email address");

                                    }
                                }
                            });
                        };

                        function ClearMessage() {
                            $("#message").html("");
                        };
                    </script>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <fieldset>
                            <asp:Button ID="BtnLogin" runat="server" PostBackUrl="~/Login.aspx" OnClientClick="ClearFields();" OnClick="Button1_Click1" Text="Login" class="btn btn-primary" />
                            <p>
                                <a href="Registration.aspx">No account yet? Create one </a>
                            </p>

                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function ClearFields() {
            document.getElementById("txtEmail").value = "";
            document.getElementById("txtPassword").value = "";
        }
    </script>
</asp:Content>


