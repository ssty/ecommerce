<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="UserMyAccount.aspx.cs" Inherits="Test1.UserMyAccount" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <style>
        .HiddenCol {
            display: none;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return link2()" Text="Edit Profile"></asp:LinkButton>

            </div>
            <div class="panel panel-info">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 col-lg-3 ">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/profile_icon.png" Height="200px" Width="200px" />

                            <div class=" col-md-9 col-lg-9">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td>Name:</td>
                                            <td>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email Address:</td>
                                            <td>
                                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>Contact Number:</td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <div id="dialog" style="display: none; position:center" >
                <table class="table table-user-information" >
                    <tbody>
                        <tr style=position:center; >
                            <td>Old Password:</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>New Password:</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                            </td>
                        </tr>                       
                        <tr>
                            <td><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="link2()" UseSubmitBehavior="false" data-dismiss="modal"  />
                       </td>
                             </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function link2() {
            ShowPopup();
            return false;
        }
        function ShowPopup() {
            $("#dialog").dialog({
                title: "Edit Profile",
                width: 500,
                height:500,
                modal: true
            });
        }
    </script>

</asp:Content>
