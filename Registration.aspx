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
            <div class="row">
                <span id='message1' class="text-center" style="width: 150px; position: center; margin-left: 30px;"></span>
            </div>
            <div class="row">
                <span id='message2' class="text-center" style="width: 150px; position: center; margin-left: 30px;"></span>
            </div>
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

                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required  TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group col-md-6">
                <label for="confirm_password">Confirm Password</label>
                <asp:TextBox ID="txtConfirmpassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <div class="col-md-3">
                    <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary"  data-toggle="modal" data-target="#myModal"  OnClick="Button1_Click" />
                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="clearfix">
            </div>
            <a href="Login.aspx">Already have an account?</a>
        </div>
    </div>
     <div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="reset" class="close" data-dismiss="modal" onclick="ClearFields();" style="margin-top: 0px; margin-bottom: 0px;">&times;</button>
                    <h4 class="modal-title">Verify your email address</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="row">
                                <div class=" col-md-9 col-lg-9">
                                    <label>
                                       Activate you email address
                                        </label>
                                    <label>
                                        Your activation code:
  <input name="code" id="code" type="text" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;" />
                                    </label>                                    
                                    <br />
                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <span id='message3' class="text-center" style="width: 150px; position: center; margin-left: 30px;"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="btnHide" class="modal-footer">
                    <asp:Button ID="Button2" class="btn btn-default" OnClientClick="return check();" runat="server" Text="Verify Email" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        function registerMsg() {
        //    document.getElementById("message1").innerHTML = "Your account has been registered successfully!";
        //    document.getElementById("message2").innerHTML = "Please login for further information ";
        }
    </script>
</asp:Content>






