<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Test1.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet"/>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap_css"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
             <header>

            <div class="header-bot">
                <div class="header-bot_inner_wthreeinfo_header_mid">
                    <div class="col-md-4 logo_agile">
                        <h1>
                            <a href="index.html">
                                <span>S</span>ee
						<span>P</span>roduct&nbsp;
                            </a>
                        </h1>
                    </div>
                  
                    <div class="clearfix"></div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </header>
        <div class="row">

            <div class="col-md-8 col-md-offset-2">
                <form role="form" method="POST" action="#">

                    <legend class="text-center">Register</legend>

                    <fieldset>
                        <legend>Account Details</legend>

                        <div class="form-group col-md-12">
                            <label for="first_name">Name</label>
                            <br />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required ></asp:TextBox>
                          
                                   <%-- <input type="text" class="form-control" name="" id="first_name" placeholder="First Name" required="required">--%>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required TextMode="Email" ></asp:TextBox>
                          <%--  <input type="email" class="form-control" name="" id="" placeholder="Email" required="required">--%>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="password">Password</label>
                          
                          <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required OnTextChanged="txtPassword_TextChanged" TextMode="Password" ></asp:TextBox>
                       </div>

                        <div class="form-group col-md-6">
                            <label for="confirm_password">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmpassword" runat="server" CssClass="form-control" required TextMode="Password" ></asp:TextBox>
                        </div>


                    </fieldset>
                    <div class="form-group">
                        <div class="col-md-3">
                              <asp:Button ID="Button1" runat="server" Text="Register"  class="btn btn-primary" OnClick="Button1_Click"/>
                            <%--<button type="submit" class="btn btn-primary">
                                Register
                            </button>--%>
                                                    
                        </div>
                    </div>
                    <br />
                     <a href="Login.aspx">Already have an account?</a>

                </form>
            </div>

        </div>
    </div>
    </form>
</body>
</html>
