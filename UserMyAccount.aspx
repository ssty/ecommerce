<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="UserMyAccount.aspx.cs" Inherits="Test1.UserMyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <div class="side-bar col-md-3" style="height: 500px; width: 320px;">
        <div class="search-hotel">
            <h3 class="agileits-sear-head">Account Settings</h3>
            <asp:Panel ID="panelSearch" runat="server">
                <div class="breadcrumb" style="width: inherit; margin-bottom: 30px;">
                    <a class="agileits-sear-head" href="#">My Account</a>
                </div>
                <div class="breadcrumb" style="width: inherit;">
                    <a class="agileits-sear-head" href="#" onclick="check1();" data-toggle="modal" data-target="#myModal">Edit Profile</a>
                </div>
                <div class="breadcrumb" style="width: inherit;">
                    <a class="agileits-sear-head" href="#" onclick="check1();" data-toggle="modal" data-target="#myModalTwo">Deactivate Account</a>
                </div>
            </asp:Panel>
        </div>
    </div>

    <div class="col col-lg-9" style="position: center;">
        <div class="panel panel-info" style="width: 1020px; height: 500px; background-color: #F8F8F8;">
            <div class="panel-body">
                <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
                    <button id="editBtn" type="button" class="btn btn-primary pull-right" onclick="check1();" data-toggle="modal" data-target="#myModal" style="height: 40px;">Edit Profile</button>
                </div>
                <div class="row">
                    <div class="col-md-3 col-lg-3 ">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/profile_icon.png" Height="200px" Width="200px" />
                        <br />
                        <br />
                        <div class=" col-md-9 col-lg-9">
                            <table class="table table-user-information" style="background-color: #F8F8F8;">
                                <tbody>
                                    <tr>
                                        <td style="color: black; font-size: large;">Name:</td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Style="color: black; font-size: large;"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: black; font-size: large;">Email Address:</td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Style="color: black; font-size: large;"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Label ID="Label4" ForeColor="Red" runat="server" Style="color: black;"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModalTwo" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" style="margin-top: 0px; margin-bottom: 0px;">&times;</button>
                    <h4 class="modal-title" >Deactivate Account</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 ">
                                    <div class=" col-md-9 col-lg-9" style="width: 566px;">
                                        <label style="color: red;">
                                            Are you sure you want to deactivate account?
                                        </label>
                                        <label style="font-size:small; font-style:italic;">
                                            Deactivating will permanently delete your account. Your data will also be deleted. Make sure if you want to deactivate your account. If you dont want to deactivate press cross button else click deactivate account button... 
                                        </label>
                                        <br />
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="btn" class="modal-footer">
                     <asp:Button ID="btnDeactivate" class="btn btn-default" PostBackUrl="~/Homepage.aspx" OnClientClick="" UseSubmitBehavior="false" runat="server" Text="Deactivate Account" OnClick="btnDeactivate_Click1" />
               </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" style="margin-top: 0px; margin-bottom: 0px;">&times;</button>
                    <h4 class="modal-title">Edit Profile</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 ">
                                    <div class=" col-md-9 col-lg-9">
                                        <label>
                                            Name:
  <input name="name" id="name" type="text" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;" />
                                        </label>
                                        <label>
                                            Old Password:
  <input name="oldPassword" id="oldPassword" type="password" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;"  />
                                        </label>
                                        <br>
                                        <label>
                                            New Password:
  <input name="password" id="password" type="password" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;" onkeyup='check();' />
                                        </label>
                                        <br>
                                        <label>
                                            Confirm password:   
  <input type="password" name="confirm_password" id="confirm_password" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;" onkeyup='check();' />
                                            <span id='message'></span>
                                        </label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="btnHide" class="modal-footer">
                    <asp:Button ID="Button1" class="btn btn-default" OnClientClick="return check();" runat="server" Text="Save Changes" OnClick="Button1_Click1" />
                </div>
            </div>
        </div>
    </div>
    <script>       
        var check = function () {
            if (document.getElementById('password').value ==
                document.getElementById('confirm_password').value) {
                document.getElementById('message').style.color = 'green';
                document.getElementById('message').innerHTML = 'Passwords Match!!!';
            } else {
                document.getElementById('message').style.color = 'red';
                document.getElementById('message').innerHTML = 'Passwords Do Not Match!!';
            }
        }
    </script>
</asp:Content>
