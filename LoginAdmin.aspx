<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="Test1.LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet"/>
    <link href="/Bootstrap/Design/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="/Bootstrap/Design/css/jquery-ui1.css"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        #form1 {
            height: 55px;
        }

        .login-form {
            width: 340px;
            margin: 50px auto;
        }

            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }

            .login-form h2 {
                margin: 0 0 15px;
            }

        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }

        .btn {
            font-size: 15px;
            font-weight: bold;
        }

        .footer {
            flex-shrink: 0;
        }
    </style>
</head>
<body>
      <form id="form2" runat="server">
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
            </div>
        </div> 
         <div class="col-md-8 col-md-offset-2">
        <legend class="text-center">Admin Login Panel</legend>
        <div class="login-form">            
                <div class="form-group">
                    <label for="">Username</label>
                    <div class="clearfix" style="margin-left:0px;">
                        <asp:TextBox ID="txtUsername" runat="server"  CssClass="form-control" required Height="30px" Width="340px"></asp:TextBox>
                        <div class="clearfix">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <fieldset>
                                <asp:Button ID="BtnLogin" runat="server" OnClick="Button1_Click1" Text="Login" class="btn btn-primary" />
                            </fieldset>
                        </div>
                    </div>
                    </div>           
        </div>
    </div>
    </form>
</body>
</html>
