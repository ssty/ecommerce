<%@ Page Title="" Language="C#" MasterPageFile="~/LoginRegistrationMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Test1.Registration" %>

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
        <legend class="text-center">Registration</legend>
        <div class="login-form">
            <div class="form-group col-md-12">
                <label for="">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required Height="30px" Width="310px"></asp:TextBox>
            </div>
            <div class="form-group col-md-12">
                <label for="">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required TextMode="Email" onblur="checkEmailAddress()"></asp:TextBox>
                <span id="message"></span>
                <span style="color: red"></span>
            </div>
            <script type="text/javascript">
                function checkEmailAddress() {
                    var email_address = $("#ContentPlaceHolder1_txtEmail").val();
                    // var email_address = $(this).val();
                    $.ajax({
                        type: "POST",
                        url: "Registration.aspx/CheckUserName",
                        data: '{email_address: "' + email_address + '" }',
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            var message = $("#message");
                            if (response.d) {
                                message.css("color", "red");
                                message.html("Email address is already used");

                            }
                            else {
                                message.css("color", "green");
                                message.html("Email address is available");

                            }
                        }
                    });
                };

                function ClearMessage() {
                    $("#message").html("");
                };
            </script>


            <div class="form-group col-md-6">
                <label for="password">Password</label>

                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required OnTextChanged="txtPassword_TextChanged" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group col-md-6">
                <label for="confirm_password">Confirm Password</label>
                <asp:TextBox ID="txtConfirmpassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary" OnClick="Button1_Click" />
                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="clearfix">
            </div>
            <a href="Login.aspx">Already have an account?</a>
        </div>
    </div>

</asp:Content>






